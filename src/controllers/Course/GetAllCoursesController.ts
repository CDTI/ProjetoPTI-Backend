import { Request, Response } from 'express';
import { client } from '../../../prisma';

export class GetAllCoursesController {
  async handle(req: Request, res: Response) {
    try {
      const courses = await client.curso.findMany({
        select: { 
          nome: true,
          codigo_mec: true,
          codigo_siaa: true,
          unidades: {
            select: {
              unidade_nome: true,
            }
          }
        }
      }).then(response => {
        return response.map((course) => {
          return {
            ...course,
            unidades: course.unidades.map((campus) => campus.unidade_nome)
          }
        })
      })
      return res.status(200).json({message: 'Cursos retornados com sucesso.', courses})
    }catch(err) {
      return res.status(500).json({message: err})
    }
  }
}