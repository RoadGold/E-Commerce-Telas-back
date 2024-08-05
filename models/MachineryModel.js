import { DataTypes } from 'sequelize';
import db from "../database/db.js";

const MachineryModel = db.define('machinery', {
    MaquinariaID: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    Nombre: { type: DataTypes.STRING },
    Descripcion: { type: DataTypes.TEXT },
    FechaAdquisicion: { type: DataTypes.DATE },
    Estado: { type: DataTypes.STRING }
});

export default MachineryModel;
