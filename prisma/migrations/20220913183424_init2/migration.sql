/*
  Warnings:

  - You are about to drop the column `curso_nome` on the `disciplinas_curso` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "disciplinas_curso" DROP CONSTRAINT "disciplinas_curso_curso_codigo_mec_curso_nome_fkey";

-- DropIndex
DROP INDEX "cursos_codigo_mec_nome_key";

-- AlterTable
ALTER TABLE "disciplinas_curso" DROP COLUMN "curso_nome";

-- AddForeignKey
ALTER TABLE "disciplinas_curso" ADD CONSTRAINT "disciplinas_curso_curso_codigo_mec_fkey" FOREIGN KEY ("curso_codigo_mec") REFERENCES "cursos"("codigo_mec") ON DELETE RESTRICT ON UPDATE CASCADE;
