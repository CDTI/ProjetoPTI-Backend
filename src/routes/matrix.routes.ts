import { Router } from 'express';
import { UploadMatrixController } from '../controllers/Matrix/UploadMatrixController';
//Multer
import multer from 'multer';
import { GetMatrixesFromCourse } from '../controllers/Matrix/GetMatrixesFromCourse';
import { GetDisciplinesFromMatrix } from '../controllers/Matrix/GetDisciplinesFromMatrix';
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
const getMatrixesFromCourse = new GetMatrixesFromCourse();
const getDisciplinesFromMatrix = new GetDisciplinesFromMatrix();

matrixRoutes.post('/', upload.single('file'), uploadMatrix.handle)
matrixRoutes.get("/:idCurso", getMatrixesFromCourse.handle)
matrixRoutes.get("/disciplines/:matrizId", getDisciplinesFromMatrix.handle)

export default matrixRoutes