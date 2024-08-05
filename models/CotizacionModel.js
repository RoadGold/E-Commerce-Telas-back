// models/CotizacionModel.js
import { DataTypes } from 'sequelize';
import db from '../database/db.js';

const CotizacionModel = db.define('Cotizaciones', {
    CotizacionID: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    ClienteNombre: {
        type: DataTypes.STRING,
        allowNull: false
    },
    FechaCotizacion: {
        type: DataTypes.DATE,
        allowNull: false
    },
    Total: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false
    }
}, {
    timestamps: false,
});

export default CotizacionModel;
