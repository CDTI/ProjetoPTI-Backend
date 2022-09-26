import { Request, Response } from 'express';
import { client } from '../../../prisma';

export class GetAllCampusController {
  async handle(req: Request, res: Response) {
    try {
      const unidades = await client.unidade.findMany();
      return res.status(200).json({message: 'Unidade resgatadas com sucesso.', campus: unidades})
    }catch(err) {
      return res.status(500).json({message: err})
    }
  }
}