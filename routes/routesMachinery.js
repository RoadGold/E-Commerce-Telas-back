import express from 'express';
import { getAllMachinery, createMachinery, updateMachinery, deleteMachinery } from '../controllers/MachineryController.js';

const router = express.Router();

router.get('/', getAllMachinery);
router.post('/', createMachinery);
router.put('/:id', updateMachinery);
router.delete('/:id', deleteMachinery);

export default router;
