// controllers/CotizacionControllers.js
import CotizacionModel from '../models/CotizacionModel.js';
import DetalleCotizacionModel from '../models/DetalleCotizacionModel.js';

// Obtener todas las cotizaciones
export const getAllCotizaciones = async (req, res) => {
    try {
        const cotizaciones = await CotizacionModel.findAll();
        res.json(cotizaciones);
    } catch (error) {
        res.json({ message: error.message });
    }
};

// Obtener una cotización por ID
export const getCotizacion = async (req, res) => {
    try {
        const cotizacion = await CotizacionModel.findByPk(req.params.id, {
            include: DetalleCotizacionModel
        });
        res.json(cotizacion);
    } catch (error) {
        res.json({ message: error.message });
    }
};

// Crear una nueva cotización
export const createCotizacion = async (req, res) => {
    try {
        const { ClienteNombre, FechaCotizacion, detalles } = req.body;
        const newCotizacion = await CotizacionModel.create({
            ClienteNombre,
            FechaCotizacion,
            Total: detalles.reduce((acc, item) => acc + (item.Cantidad * item.PrecioUnitario), 0)
        });

        detalles.forEach(async detalle => {
            await DetalleCotizacionModel.create({
                CotizacionID: newCotizacion.CotizacionID,
                ...detalle
            });
        });

        res.status(201).json({ message: 'Cotización creada correctamente', cotizacion: newCotizacion });
    } catch (error) {
        res.status(500).json({ message: 'Error al crear la cotización', error: error.message });
    }
};

// Actualizar una cotización
export const updateCotizacion = async (req, res) => {
    try {
        const { ClienteNombre, FechaCotizacion, detalles } = req.body;
        await CotizacionModel.update({
            ClienteNombre,
            FechaCotizacion,
            Total: detalles.reduce((acc, item) => acc + (item.Cantidad * item.PrecioUnitario), 0)
        }, {
            where: { CotizacionID: req.params.id }
        });

        await DetalleCotizacionModel.destroy({
            where: { CotizacionID: req.params.id }
        });

        detalles.forEach(async detalle => {
            await DetalleCotizacionModel.create({
                CotizacionID: req.params.id,
                ...detalle
            });
        });

        res.json({ message: 'Cotización actualizada' });
    } catch (error) {
        res.status(500).json({ message: 'Error al actualizar la cotización', error: error.message });
    }
};

// Eliminar una cotización
export const deleteCotizacion = async (req, res) => {
    try {
        await DetalleCotizacionModel.destroy({
            where: { CotizacionID: req.params.id }
        });
        await CotizacionModel.destroy({
            where: { CotizacionID: req.params.id }
        });
        res.json({ message: 'Cotización eliminada' });
    } catch (error) {
        res.status(500).json({ message: 'Error al eliminar la cotización', error: error.message });
    }
};
