import { Request, Response } from 'express';
import { client } from '../../../prisma';

export class GetAllDisciplinesController {
  async handle(req: Request, res: Response) {
    try {
      const disciplines = await client.disciplina.findMany({
        select: {
          codigo: true,
          hora_aula: true,
          hora_relogio: true,
          nome: true,
          cursos_da_disciplina:{
            select: {
              curso: {
                select: {
                  nome: true,
                  codigo_siaa: true
                }
              }
            }
          }
        }
      })
      return res.status(200).json({message: 'Disciplina retornadas com sucesso.', disciplines})
    }catch(err) {
      return res.status(500).json({message: err})
    }
  }
}