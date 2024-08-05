// EmployeeModel.js

import { DataTypes } from 'sequelize';
import db from '../database/db.js';

const EmployeeModel = db.define('employees', {
    EmpleadoID: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    Nombre: {
        type: DataTypes.STRING,
        allowNull: false
    },
    Apellido: {
        type: DataTypes.STRING,
        allowNull: false
    },
    Puesto: {
        type: DataTypes.STRING
    },
    FechaContratacion: {
        type: DataTypes.DATE
    }
});

export default EmployeeModel;
