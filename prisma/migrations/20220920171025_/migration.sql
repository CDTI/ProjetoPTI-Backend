/*
  Warnings:

  - A unique constraint covering the columns `[curso_codigo_mec]` on the table `disciplinas_curso` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "disciplinas_curso_disciplina_codigo_key";

-- CreateIndex
CREATE UNIQUE INDEX "disciplinas_curso_curso_codigo_mec_key" ON "disciplinas_curso"("curso_codigo_mec");
