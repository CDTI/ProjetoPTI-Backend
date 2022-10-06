import { Request, Response } from "express";
import { client } from "../../../prisma";


export class GetDisciplinesFromMatrix {
  async handle(req: Request, res: Response) {
    const { matrizId } = req.params;
    try {
        const disciplinas = await client.matriz.findMany({
            where: {id: matrizId},
            select: {
                disciplinas: {
                  orderBy: {"serie": "asc"},
                },
            },
            distinct: ["curso_codigo_mec"],
        });


        return res.status(200).json({message: "Disciplinas da matriz retornadas com sucesso.", disciplinas: disciplinas[0].disciplinas});
    } catch (err) {
      return res.status(500).json({ message: err });
    }
  }
}
