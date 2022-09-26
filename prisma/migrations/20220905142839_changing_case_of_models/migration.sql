/*
  Warnings:

  - You are about to drop the column `cursoId` on the `disciplina_cursos` table. All the data in the column will be lost.
  - You are about to drop the column `disciplinaCodigo` on the `disciplina_cursos` table. All the data in the column will be lost.
  - Added the required column `curso_mec_id` to the `disciplina_cursos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `disciplina_codigo` to the `disciplina_cursos` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "disciplina_cursos" DROP CONSTRAINT "disciplina_cursos_cursoId_fkey";

-- DropForeignKey
ALTER TABLE "disciplina_cursos" DROP CONSTRAINT "disciplina_cursos_disciplinaCodigo_fkey";

-- AlterTable
ALTER TABLE "disciplina_cursos" DROP COLUMN "cursoId",
DROP COLUMN "disciplinaCodigo",
ADD COLUMN     "curso_mec_id" TEXT NOT NULL,
ADD COLUMN     "disciplina_codigo" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "disciplina_cursos" ADD CONSTRAINT "disciplina_cursos_disciplina_codigo_fkey" FOREIGN KEY ("disciplina_codigo") REFERENCES "disciplinas"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disciplina_cursos" ADD CONSTRAINT "disciplina_cursos_curso_mec_id_fkey" FOREIGN KEY ("curso_mec_id") REFERENCES "cursos"("codigo_mec") ON DELETE RESTRICT ON UPDATE CASCADE;
