import { Request, Response } from 'express';
import { client } from '../../../prisma';

export class GetAllDisciplinesController {
  async handle(req: Request, res: Response) {
    try {
      const disciplines = await client.disciplina.findMany({
        select: {
          serie: true,
          codigo: true,
          hora_aula: true,
          hora_relogio: true,
          nome: true,
        },
        distinct: ['codigo'],
        orderBy: {serie: 'asc'}
      })
      return res.status(200).json({message: 'Disciplina retornadas com sucesso.', disciplines})
    }catch(err) {
      return res.status(500).json({message: err})
    }
  }
}