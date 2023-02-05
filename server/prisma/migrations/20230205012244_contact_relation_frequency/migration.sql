/*
  Warnings:

  - The values [THREE_MONTHS] on the enum `ContactFrequency` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `related_user` on the `Contact` table. All the data in the column will be lost.
  - You are about to drop the column `relating_user` on the `Contact` table. All the data in the column will be lost.
  - Added the required column `related_user_id` to the `Contact` table without a default value. This is not possible if the table is not empty.
  - Added the required column `relating_user_id` to the `Contact` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "ContactFrequency_new" AS ENUM ('ONE_WEEK', 'TWO_WEEKS', 'ONE_MONTH', 'SIX_MONTHS', 'ONE_YEAR');
ALTER TABLE "Contact" ALTER COLUMN "contact_frequency" TYPE "ContactFrequency_new" USING ("contact_frequency"::text::"ContactFrequency_new");
ALTER TYPE "ContactFrequency" RENAME TO "ContactFrequency_old";
ALTER TYPE "ContactFrequency_new" RENAME TO "ContactFrequency";
DROP TYPE "ContactFrequency_old";
COMMIT;

-- AlterTable
ALTER TABLE "Contact" DROP COLUMN "related_user",
DROP COLUMN "relating_user",
ADD COLUMN     "related_user_id" INTEGER NOT NULL,
ADD COLUMN     "relating_user_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_relating_user_id_fkey" FOREIGN KEY ("relating_user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_related_user_id_fkey" FOREIGN KEY ("related_user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
