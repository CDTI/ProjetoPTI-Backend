//Server configs
import express, { Request, Response } from 'express';
import dotenv from 'dotenv';
import cors from "cors";
//Routes
import disciplineRoutes from './src/routes/discipline.routes';
import courseRoutes from './src/routes/course.routes';
import campusRoutes from './src/routes/campus.routes';
import matrixRoutes from './src/routes/matrix.routes';

dotenv.config();

const app = express();
app.use(cors());
app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.get('/', (req: Request, res: Response) => {
  return res.send('This is the API of the PTI Project')
})

app.use('/discipline', disciplineRoutes)
app.use('/campus', campusRoutes)
app.use('/course', courseRoutes)
app.use('/matrix', matrixRoutes)

//Factorys
app.get('/hehe' , (req: Request, res: Response) => {
  try{
    return 'hehe'
  }catch(err) {
    console.log(err);
  }
})

app.listen(process.env.PORT || 8080, () => {
  console.log(`Server running on ${process.env.port}`)
})
