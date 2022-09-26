import { Router } from 'express';
import { CreateDisciplineController } from '../controllers/Discipline/CreateDisciplineController';
import { GetAllDisciplinesController } from '../controllers/Discipline/GetAllDisciplinesController';
import { GetCoursesOfDisciplineController } from '../controllers/Discipline/GetCoursesOfDiscipline';

const disciplinaRoutes = Router();
const createDisciplina = new CreateDisciplineController();
const getCoursesOfDiscipline = new GetCoursesOfDisciplineController();
const getAllDisciplines = new GetAllDisciplinesController();

disciplinaRoutes.get('/', getAllDisciplines.handle)
disciplinaRoutes.post('/', createDisciplina.handle)
disciplinaRoutes.get('/listCourses', getCoursesOfDiscipline.handle)

export default disciplinaRoutes