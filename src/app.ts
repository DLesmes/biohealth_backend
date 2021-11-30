import express from 'express';
import medicosRoutes from './routes/medicos';
import config from './config/config';
import errorHandler from './middlewares/erros';
import validarRol from './middlewares/validarRol';

const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use((_, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});
//app.use(validarRol);


medicosRoutes(app);

//app.use(errorHandler);


app.listen(config.PORT, () => {
    return console.log(`servidor corriendo sobre el puerto ${config.PORT}`)
});
