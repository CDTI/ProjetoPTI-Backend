/*
  Warnings:

  - A unique constraint covering the columns `[disciplina_codigo]` on the table `disciplinas_curso` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "disciplinas_curso_disciplina_codigo_key" ON "disciplinas_curso"("disciplina_codigo");
