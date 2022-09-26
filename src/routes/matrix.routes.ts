import { Router } from 'express';
import { UploadMatrixController } from '../controllers/Matrix/UploadMatrixController';
//Multer
import multer from 'multer';
const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, 'uploads');
    },
    filename: function (req, file, cb) {
        cb(null , file.originalname );
    }
});

const upload = multer({ storage: storage })

const matrixRoutes = Router();
const uploadMatrix = new UploadMatrixController();

matrixRoutes.post('/', upload.single('file'), uploadMatrix.handle)

export default matrixRoutes