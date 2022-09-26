import fs from 'fs';
import { parse } from 'csv'
import { client } from '../prisma';

type Disciplina = {
  serie: number;
  codigo: string;
  nome: string;
  hora_aula?: number;
  hora_relogio?: number;
}

const rows : Disciplina[] = [];
let index = 0;
let codigo_siaa = '';

fs.createReadStream("../matriz2.csv")
  .pipe(parse({ delimiter: ",", from_line: 1 }))
  .on("data", function (row) {
    if(index === 0) {
      codigo_siaa = row[0].split(" - ", 2)[1]
      index++;
    }else if(index === 1) {
      index++;
      return;
    }else {
      rows.push({
        serie: row[0],
        codigo: row[1],
        nome: row[2],
        hora_aula: isNaN(parseInt(row[3])) ? 0 : parseInt(row[3]),
        hora_relogio: isNaN(parseInt(row[4])) ? 0 : parseInt(row[4])
      })
    }
  })
  .on("end", async () => {
    const curso = await client.curso.findFirst({
      where: {codigo_siaa}
    })
    if(curso) {
      rows.map(async row => {
        try {
          await client.disciplina.upsert({
            where: {codigo: row.codigo},
            update: {
              cursos_da_disciplina: {
                create: {
                  curso_codigo_mec: curso?.codigo_mec,
                }
              }
            },
            create: {
              codigo: row.codigo,
              nome: row.nome,
              hora_aula: row.hora_aula,
              hora_relogio: row.hora_relogio,
              cursos_da_disciplina: {
                create: {
                  curso: {connect: {codigo_mec: curso?.codigo_mec}}
                }
              }
            },
          })
        }catch(err) {
          console.log(err)
        }
      })
    }
  })
