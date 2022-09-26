-- DropIndex
DROP INDEX "disciplina_cursos_curso_codigo_mec_key";

-- AlterTable
ALTER TABLE "disciplinas" ALTER COLUMN "hora_aula" DROP NOT NULL,
ALTER COLUMN "hora_relogio" DROP NOT NULL;
