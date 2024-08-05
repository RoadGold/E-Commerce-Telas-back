import MachineryModel from '../models/MachineryModel.js';

// Obtener toda la maquinaria
export const getAllMachinery = async (req, res) => {
    try {
        const machinery = await MachineryModel.findAll();
        res.json(machinery);
    } catch (error) {
        res.json({ message: error.message });
    }
};
//mostrar
//mostrar todos los registros


// Crear nueva maquinaria
export const createMachinery = async (req, res) => {
    try {
        await MachineryModel.create(req.body);
        res.json({ 'message': 'Machinery created' });
    } catch (error) {
        res.json({ message: error.message });
    }
};

// Actualizar maquinaria
export const updateMachinery = async (req, res) => {
    try {
        await MachineryModel.update(req.body, { where: { MaquinariaID: req.params.id } });
        res.json({ 'message': 'Machinery updated' });
    } catch (error) {
        res.json({ message: error.message });
    }
};

// Eliminar maquinaria
export const deleteMachinery = async (req, res) => {
    try {
        await MachineryModel.destroy({ where: { MaquinariaID: req.params.id } });
        res.json({ 'message': 'Machinery deleted' });
    } catch (error) {
        res.json({ message: error.message });
    }
};
