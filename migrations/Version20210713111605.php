<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210713111605 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE societe_type_societe (societe_id INT NOT NULL, type_societe_id INT NOT NULL, INDEX IDX_FB9E3F15FCF77503 (societe_id), INDEX IDX_FB9E3F15E1F4A326 (type_societe_id), PRIMARY KEY(societe_id, type_societe_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE societe_type_societe ADD CONSTRAINT FK_FB9E3F15FCF77503 FOREIGN KEY (societe_id) REFERENCES societe (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE societe_type_societe ADD CONSTRAINT FK_FB9E3F15E1F4A326 FOREIGN KEY (type_societe_id) REFERENCES type_societe (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE societe DROP FOREIGN KEY FK_19653DBDC54C8C93');
        $this->addSql('DROP INDEX IDX_19653DBDC54C8C93 ON societe');
        $this->addSql('ALTER TABLE societe DROP type_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE societe_type_societe');
        $this->addSql('ALTER TABLE societe ADD type_id INT NOT NULL');
        $this->addSql('ALTER TABLE societe ADD CONSTRAINT FK_19653DBDC54C8C93 FOREIGN KEY (type_id) REFERENCES type_societe (id)');
        $this->addSql('CREATE INDEX IDX_19653DBDC54C8C93 ON societe (type_id)');
    }
}
