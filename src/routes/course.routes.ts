import { Router } from 'express';
import { CreateCourseController } from '../controllers/Course/CreateCourseController';
import { GetAllCoursesController } from '../controllers/Course/GetAllCoursesController';
const coursesRoutes = Router();

const createCourse = new CreateCourseController();
const getAllCourses = new GetAllCoursesController();

coursesRoutes.get('/', getAllCourses.handle)
coursesRoutes.post('/', createCourse.handle)

export default coursesRoutes