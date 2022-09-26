/*
  Warnings:

  - A unique constraint covering the columns `[codigo_mec,nome]` on the table `cursos` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `curso_nome` to the `disciplinas_curso` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "disciplinas_curso" DROP CONSTRAINT "disciplinas_curso_curso_codigo_mec_fkey";

-- AlterTable
ALTER TABLE "disciplinas_curso" ADD COLUMN     "curso_nome" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "cursos_codigo_mec_nome_key" ON "cursos"("codigo_mec", "nome");

-- AddForeignKey
ALTER TABLE "disciplinas_curso" ADD CONSTRAINT "disciplinas_curso_curso_codigo_mec_curso_nome_fkey" FOREIGN KEY ("curso_codigo_mec", "curso_nome") REFERENCES "cursos"("codigo_mec", "nome") ON DELETE RESTRICT ON UPDATE CASCADE;
