"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteMedico = exports.updateMedico = exports.addMedico = exports.getMedico = exports.getMedicos = void 0;
const mysql_service_1 = __importDefault(require("../services/mysql.service"));
const getMedicos = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const response = yield (0, mysql_service_1.default)('SELECT * FROM medico');
        const data = {
            message: `${response.length} datos encontrados`,
            datos: response.length > 0 ? response : null
        };
        res.json(data);
    }
    catch (error) {
        next(error);
    }
});
exports.getMedicos = getMedicos;
const getMedico = (req, res, next) => {
    const { id } = req.params;
    (0, mysql_service_1.default)(`SELECT * FROM medico WHERE idMedico = ${id}`).then((response) => {
        const data = {
            message: `${response.length} datos encontrados`,
            datos: response.length > 0 ? response[0] : null
        };
        res.json(data);
    }).catch((error) => {
        next(error);
    });
};
exports.getMedico = getMedico;
const addMedico = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    const { primerNombre, segundoNombre, primerApellido, segundoApellido, usuario, contrasena, fotoUsuario, firma } = req.body;
    try {
        const response = yield (0, mysql_service_1.default)(`INSERT INTO medico (primerNombre, segundoNombre, primerApellido, segundoApellido, usuario, contrasena, fotoUsuario, firma) VALUES ('${primerNombre}', '${segundoNombre}', '${primerApellido}', '${segundoApellido}', '${usuario}', '${contrasena}', '${fotoUsuario}', '${firma}')`);
        res.status(201).json({ message: 'created', id: response.insertId });
    }
    catch (error) {
        next(error);
    }
});
exports.addMedico = addMedico;
const updateMedico = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    const { primerNombre, segundoNombre, primerApellido, segundoApellido, usuario, contrasena, fotoUsuario, firma } = req.body;
    try {
        const response = yield (0, mysql_service_1.default)(`UPDATE medico SET primerNombre = '${primerNombre}', segundoNombre = '${segundoNombre}', primerApellido = '${primerApellido}', segundoApellido = '${segundoApellido}', usuario = '${usuario}', contrasena = '${contrasena}', fotoUsuario = '${fotoUsuario}', firma = '${firma}' WHERE idMedico = ${req.params.id}`);
        console.log(response);
        if (response.affectedRows > 0) {
            res.json({ message: 'updated' });
        }
        else {
            res.status(404).json({ message: `No existe registro con id: ${req.params.id}` });
        }
    }
    catch (error) {
        next(error);
    }
});
exports.updateMedico = updateMedico;
const deleteMedico = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const response = yield (0, mysql_service_1.default)(`DELETE FROM medico WHERE idMedico = ${req.params.id}`);
        console.log(response);
        if (response.affectedRows > 0) {
            res.json({ message: 'deleted' });
        }
        else {
            res.status(404).json({ message: `No existe registro con id: ${req.params.id}` });
        }
    }
    catch (error) {
        next(error);
    }
});
exports.deleteMedico = deleteMedico;
//# sourceMappingURL=medicosController.js.map