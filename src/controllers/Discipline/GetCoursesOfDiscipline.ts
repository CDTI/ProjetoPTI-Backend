import { Request, Response } from 'express';
import { client } from '../../../prisma';

export class GetCoursesOfDisciplineController {
  async handle(req: Request, res: Response) {
    const { disciplina_codigo } = req.body;
    try {
      const cursos = await client.disciplinaCursos.findMany({
        where: {disciplina_codigo}
      })
      return res.status(200).json({message: 'Cursos buscados com sucesso.', cursos})
    }catch(err) {
      return res.status(500).json({message: err})
    }
  }
}