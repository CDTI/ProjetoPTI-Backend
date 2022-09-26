import { Request, Response } from 'express';
import { client } from '../../../prisma';

export class CreateDisciplineController {
  async handle(req: Request, res: Response) {
    const { nome, hora_aula, hora_relogio, codigo, cursos_codigos} = req.body;
    try {
      cursos_codigos.map(async (codigoCurso: string) => {
        await client.disciplina.upsert({
        where: {codigo},
        update: {
          cursos_da_disciplina: {
            create: {
              curso_codigo_mec: codigoCurso,
            }
          }
        },
        create: {
          codigo: codigo,
          nome: nome,
          hora_aula: hora_aula,
          hora_relogio: hora_relogio,
          cursos_da_disciplina: {
            create: {
              curso: {connect: {codigo_mec: codigoCurso}}
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