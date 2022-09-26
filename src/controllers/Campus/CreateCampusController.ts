import { Request, Response } from 'express';
import { client } from '../../../prisma';

export class CreateCampusController {
  async handle(req: Request, res: Response) {
    const { nome} = req.body;
    console.log(nome);
    try {
      const unidade = await client.unidade.create({data: { nome}})
      return res.status(200).json({message: 'Unidade criada com sucesso.', unidade})
    }catch(err) {
      console.log(err);
      return res.status(500).json({message: err})
    }
  }
}