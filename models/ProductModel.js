import db from '../database/db.js';
import { DataTypes } from 'sequelize';

const ProductModel = db.define('productos', {
    nombre: { type: DataTypes.STRING, allowNull: false }, // Ejemplo de configuración allowNull
    precio: { type: DataTypes.NUMBER },
    descripcion: { type: DataTypes.TEXT },
    img1: { type: DataTypes.TEXT },
    img2: { type: DataTypes.TEXT },
    img3: { type: DataTypes.TEXT },
    stockMax: { type: DataTypes.INTEGER },
    stockMin: { type: DataTypes.INTEGER },
    stock: { type: DataTypes.INTEGER }
});

export default ProductModel;
