import { Request, Response } from "express";
import fs from "fs";
import { parse } from "csv";
import { client } from "../../../prisma";

const root = process.cwd();

type Disciplina = {
  serie: number;
  codigo: string;
  nome: string;
  hora_aula: number | null;
  hora_relogio: number | null;
};

export class UploadMatrixController {
  async handle(req: Request, res: Response) {
    try {
      const rows: Disciplina[] = [];
      let index = 0;
      let codigo_siaa = "";
      let ano = "";
      let semestre = "";
      fs.createReadStream(`${root}/uploads/${req.file?.originalname}`)
        .pipe(parse({ delimiter: ",", from_line: 1 }))
        .on("data", function (row: any) {
          if (index === 0) {
            codigo_siaa = row[0].split(" - ", 2)[1];
            ano = row[0].split(" - ", 4)[3].split(" |")[0].split("-")[0];
            semestre = row[0].split(" - ", 4)[3].split(" |")[0].split("-")[1];
            index++;
          } else if (index === 1) {
            index++;
            return;
          } else {
            if (
              row[2] !== "Atividades Complementares" &&
              row[2] !== "Temas Transversais"
            ) {
              rows.push({
                serie: parseInt(row[0]),
                codigo: row[1],
                nome: row[2],
                hora_aula: isNaN(parseInt(row[3])) ? 0 : parseInt(row[3]),
                hora_relogio: isNaN(parseInt(row[4])) ? 0 : parseInt(row[4]),
              });
            }
          }
        })
        .on("end", async function () {
          const preMatrizId = `${codigo_siaa}-${ano}-${semestre}`;
          const matrixAlreadyExists = await client.matriz.findFirst({where: {id: preMatrizId}});
          if(matrixAlreadyExists) {
            return res.status(500).json({ message: "Essa matriz já existe na base de dados." });
          }
          const curso = await client.curso.findFirst({
            where: { codigo_siaa },
          });
          if (curso) {
            const matriz = await client.matriz.create({
              data: {
                id: preMatrizId,
                ano, 
                semestre, 
                curso: {connect: {codigo_mec: curso.codigo_mec}}
              },
            })
            let disciplinas = await Promise.all(
              rows.map(async (row) => {
                  return await client.disciplina.create({
                    data: {
                      serie: row.serie,
                      codigo: row.codigo,
                      nome: row.nome,
                      hora_aula: row.hora_aula,
                      hora_relogio: row.hora_relogio,
                      matriz: {connect: {id: matriz.id}},
                    },
                  });
              })
            ).catch((err) => console.log(err.message));
            return res.status(200).json({message: "Disciplina criadas com sucesso.",matriz: { disciplinas, curso: curso.nome }});
          }
        });
    } catch (err) {
      return res.status(500).json({ message: err });
    }
  }
}
