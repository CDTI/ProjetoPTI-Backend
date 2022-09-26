import { Router } from 'express';
import { CreateCampusController } from '../controllers/Campus/CreateCampusController';
import { GetAllCampusController } from '../controllers/Campus/GetAllCampusController';
const campusRoutes = Router();

const createCampus = new CreateCampusController();
const getAllCampus = new GetAllCampusController();


campusRoutes.get('/', getAllCampus.handle)
campusRoutes.post('/', createCampus.handle)

export default campusRoutes