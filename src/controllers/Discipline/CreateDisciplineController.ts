import { Request, Response } from 'express';
import { client } from '../../../prisma';

export class CreateDisciplineController {
  async handle(req: Request, res: Response) {
    const { nome, serie, matriz_id, hora_aula, hora_relogio, codigo, cursos_codigos} = req.body;
    try {
      cursos_codigos.map(async (codigoCurso: string) => {
        await client.disciplina.create({
        data: {
          serie: serie,
          codigo: codigo,
          nome: nome,
          hora_aula: hora_aula,
          hora_relogio: hora_relogio,
          matriz: {
            connect: {
              id: matriz_id
            }
          }
        },
      })
      })
      return res.status(200).json({message: 'Disciplina criada com sucesso.'})
    }catch(err) {
      return res.status(500).json({message: err})
    }
  }
}