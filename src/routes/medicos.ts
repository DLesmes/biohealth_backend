import { Router } from "express";
import { addMedico, deleteMedico, getMedico, getMedicos, updateMedico } from "../controllers/medicosController";
import errorHandler from '../middlewares/erros';
import validarRol from "../middlewares/validarRol";

const medicosRoutes = (app) =>{
    const router = Router();
    app.use('/', router);

    //app.use(validarRol)
    router.get('/getMedicos', getMedicos);
    router.get('/getMedico/:id', getMedico);
    router.post('/addMedico', addMedico);
    router.put('/updateMedico/:id', updateMedico);
    router.delete('/deleteMedico/:id', deleteMedico);

    router.use(errorHandler);

}

export default medicosRoutes;