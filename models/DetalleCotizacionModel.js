// models/DetalleCotizacionModel.js
import { DataTypes } from 'sequelize';
import db from '../database/db.js';

const DetalleCotizacionModel = db.define('DetallesCotizaciones', {
    DetalleCotizacionID: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    CotizacionID: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'Cotizaciones',
            key: 'CotizacionID'
        }
    },
    id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'Productos',
            key: 'id'
        }
    },
    Cantidad: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    PrecioUnitario: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false
    }
}, {
    timestamps: false,
});

export default DetalleCotizacionModel;
