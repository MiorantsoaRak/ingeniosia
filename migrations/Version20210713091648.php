<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210713091648 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE societe ADD type_id INT NOT NULL');
        $this->addSql('ALTER TABLE societe ADD CONSTRAINT FK_19653DBDC54C8C93 FOREIGN KEY (type_id) REFERENCES type_societe (id)');
        $this->addSql('CREATE INDEX IDX_19653DBDC54C8C93 ON societe (type_id)');
        $this->addSql('ALTER TABLE type_societe DROP FOREIGN KEY FK_31445248FCF77503');
        $this->addSql('DROP INDEX IDX_31445248FCF77503 ON type_societe');
        $this->addSql('ALTER TABLE type_societe DROP societe_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE societe DROP FOREIGN KEY FK_19653DBDC54C8C93');
        $this->addSql('DROP INDEX IDX_19653DBDC54C8C93 ON societe');
        $this->addSql('ALTER TABLE societe DROP type_id');
        $this->addSql('ALTER TABLE type_societe ADD societe_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE type_societe ADD CONSTRAINT FK_31445248FCF77503 FOREIGN KEY (societe_id) REFERENCES societe (id)');
        $this->addSql('CREATE INDEX IDX_31445248FCF77503 ON type_societe (societe_id)');
    }
}
