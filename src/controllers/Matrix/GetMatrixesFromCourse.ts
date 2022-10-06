import { Request, Response } from "express";
import { client } from "../../../prisma";


export class GetMatrixesFromCourse {
  async handle(req: Request, res: Response) {
    const { idCurso } = req.params;
    try {
      const matrixes = await client.matriz.findMany({where: {curso_codigo_mec: idCurso}});
      return res.status(200).json({message: "Matrizes retornadas com sucesso.",matrizes: matrixes});
    } catch (err) {
      return res.status(500).json({ message: err });
    }
  }
}
