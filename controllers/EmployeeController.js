// EmployeeController.js

import EmployeeModel from '../models/EmployeeModel.js';

export const getAllEmployees = async (req, res) => {
    try {
        const employees = await EmployeeModel.findAll();
        res.json(employees);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

export const createEmployee = async (req, res) => {
    try {
        const { Nombre, Apellido, Puesto, FechaContratacion } = req.body;
        const newEmployee = await EmployeeModel.create({
            Nombre,
            Apellido,
            Puesto,
            FechaContratacion
        });
        res.status(201).json(newEmployee);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

export const updateEmployee = async (req, res) => {
    const { id } = req.params;
    try {
        await EmployeeModel.update(req.body, { where: { EmpleadoID: id } });
        res.json({ message: 'Employee updated' });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

export const deleteEmployee = async (req, res) => {
    const { id } = req.params;
    try {
        await EmployeeModel.destroy({ where: { EmpleadoID: id } });
        res.json({ message: 'Employee deleted' });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};
