import { Request, Response } from 'express';
import { client } from '../../../prisma';

export class CreateCourseController {
  async handle(req: Request, res: Response) {
    const { nome, codigo_mec, unidades, codigo_siaa  } = req.body;
    
    try {
      const curso = await client.curso.create({
        data: {
          codigo_mec,
          codigo_siaa,
          nome,
        }
      })
      const unidadesDoCurso = await client.cursoUnidades.createMany({
        data: unidades.map((campus: string) => {
          return {
            curso_codigo_mec: curso.codigo_mec,
            curso_codigo_siaa: curso.codigo_siaa,
            unidade_nome: campus
          }
        })
      })
      return res.status(200).json({message: 'Curso criado com sucesso.', curso, unidadesDoCurso})
    }catch(err) {
      console.log(err);
      return res.status(500).json({message: err})
    }
  }
}