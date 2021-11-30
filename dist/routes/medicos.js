"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const medicosController_1 = require("../controllers/medicosController");
const erros_1 = __importDefault(require("../middlewares/erros"));
const medicosRoutes = (app) => {
    const router = (0, express_1.Router)();
    app.use('/', router);
    //app.use(validarRol)
    router.get('/getMedicos', medicosController_1.getMedicos);
    router.get('/getMedico/:id', medicosController_1.getMedico);
    router.post('/addMedico', medicosController_1.addMedico);
    router.put('/updateMedico/:id', medicosController_1.updateMedico);
    router.delete('/deleteMedico/:id', medicosController_1.deleteMedico);
    router.use(erros_1.default);
};
exports.default = medicosRoutes;
//# sourceMappingURL=medicos.js.map