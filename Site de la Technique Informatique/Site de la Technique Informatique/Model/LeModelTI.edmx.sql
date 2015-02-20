
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/13/2015 15:32:39
-- Generated from EDMX file: C:\Users\Raphael Brouard\Source\Repos\SiteTIHiver2015\Site de la Technique Informatique\Site de la Technique Informatique\Model\LeModelTI.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ProjetDeux_2015_2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'DateEvenementVerTICSet'
CREATE TABLE [dbo].[DateEvenementVerTICSet] (
    [IDDateEvenementVerTIC] int IDENTITY(1,1) NOT NULL,
    [dateDescription] nvarchar(max)  NOT NULL,
    [evenement] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'VerTICSet'
CREATE TABLE [dbo].[VerTICSet] (
    [IDVerTIC] int IDENTITY(1,1) NOT NULL,
    [descriptionLicence] nvarchar(2000)  NOT NULL,
    [descriptionLibre] nvarchar(2000)  NOT NULL,
    [caractéristiquesPortable] nvarchar(2000)  NOT NULL,
    [autrePortable] nvarchar(2000)  NOT NULL
);
GO

-- Creating table 'LogSet'
CREATE TABLE [dbo].[LogSet] (
    [IDLog] int IDENTITY(1,1) NOT NULL,
    [dateLog] datetime  NOT NULL,
    [actionLog] nvarchar(1000)  NOT NULL,
    [typeLog] smallint  NOT NULL,
    [UtilisateurIDUtilisateur] int  NULL
);
GO

-- Creating table 'UtilisateurSet'
CREATE TABLE [dbo].[UtilisateurSet] (
    [IDUtilisateur] int IDENTITY(1,1) NOT NULL,
    [courriel] nvarchar(200)  NOT NULL,
    [hashMotDePasse] nvarchar(200)  NOT NULL,
    [dateInscription] datetime  NOT NULL
);
GO

-- Creating table 'OffreEmploiSet'
CREATE TABLE [dbo].[OffreEmploiSet] (
    [IDOffreEmploi] int IDENTITY(1,1) NOT NULL,
    [titreOffre] nvarchar(200)  NOT NULL,
    [descriptionOffre] nvarchar(2000)  NOT NULL,
    [dateOffre] datetime  NOT NULL,
    [dateExpiration] datetime  NULL,
    [dateDebutOffre] datetime  NOT NULL,
    [pathPDSDescription] nvarchar(200)  NULL,
    [salaire] decimal(18,0)  NOT NULL,
    [nbHeureSemaine] smallint  NOT NULL,
    [adresseTravail] nvarchar(200)  NOT NULL,
    [noTelephone] nvarchar(10)  NOT NULL,
    [noTelecopieur] nvarchar(10)  NULL,
    [courrielOffre] nvarchar(max)  NOT NULL,
    [personneRessource] nvarchar(max)  NOT NULL,
    [EmployeurIDUtilisateur] int  NOT NULL,
    [VilleIDVille] int  NOT NULL
);
GO

-- Creating table 'VilleSet'
CREATE TABLE [dbo].[VilleSet] (
    [IDVille] int IDENTITY(1,1) NOT NULL,
    [nomVille] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'ConsultationForumSet'
CREATE TABLE [dbo].[ConsultationForumSet] (
    [IDConsultationForum] int IDENTITY(1,1) NOT NULL,
    [dateConsulte] nvarchar(max)  NOT NULL,
    [EnteteForumIDEnteteForum] int  NOT NULL
);
GO

-- Creating table 'CoursSet'
CREATE TABLE [dbo].[CoursSet] (
    [IDCours] int IDENTITY(1,1) NOT NULL,
    [nomCours] nvarchar(200)  NOT NULL,
    [noCours] nvarchar(20)  NOT NULL,
    [noSessionCours] smallint  NOT NULL,
    [descriptionCours] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EvenementSet'
CREATE TABLE [dbo].[EvenementSet] (
    [IDEvenement] int IDENTITY(1,1) NOT NULL,
    [titreEvenement] nvarchar(250)  NOT NULL,
    [descriptionEvenement] nvarchar(max)  NOT NULL,
    [datePublication] datetime  NOT NULL,
    [dateDebutEvenement] datetime  NOT NULL,
    [dateFinEvenement] datetime  NULL,
    [ProfesseurIDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'ParutionMediaSet'
CREATE TABLE [dbo].[ParutionMediaSet] (
    [IDParutionMedia] int IDENTITY(1,1) NOT NULL,
    [pathFichierPDF] nvarchar(200)  NOT NULL,
    [descriptionParution] nvarchar(max)  NOT NULL,
    [dateParution] datetime  NOT NULL,
    [ProfesseurIDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'FAQSet'
CREATE TABLE [dbo].[FAQSet] (
    [IDFAQ] int IDENTITY(1,1) NOT NULL,
    [texteQuestion] nvarchar(50)  NOT NULL,
    [texteReponse] nvarchar(500)  NOT NULL,
    [ProfesseurIDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'NouvelleSet'
CREATE TABLE [dbo].[NouvelleSet] (
    [IDNouvelle] int IDENTITY(1,1) NOT NULL,
    [titreNouvelle] nvarchar(250)  NOT NULL,
    [texteNouvelle] nvarchar(max)  NOT NULL,
    [pathPhotoNouvelle] nvarchar(200)  NULL,
    [dateNouvelle] datetime  NOT NULL,
    [ProfesseurIDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'SectionForumSet'
CREATE TABLE [dbo].[SectionForumSet] (
    [IDSectionForum] int IDENTITY(1,1) NOT NULL,
    [titreSection] nvarchar(30)  NOT NULL,
    [descriptionSection] nvarchar(500)  NOT NULL
);
GO

-- Creating table 'EnteteForumSet'
CREATE TABLE [dbo].[EnteteForumSet] (
    [IDEnteteForum] int IDENTITY(1,1) NOT NULL,
    [titreEnteteForum] nvarchar(30)  NOT NULL,
    [dateEnteteForum] datetime  NOT NULL,
    [SectionForumIDSectionForum] int  NOT NULL,
    [MembreIDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'MessageForumSet'
CREATE TABLE [dbo].[MessageForumSet] (
    [IDMessageForum] int IDENTITY(1,1) NOT NULL,
    [texteMessage] nvarchar(2000)  NOT NULL,
    [dateMessage] datetime  NOT NULL,
    [EnteteForumIDEnteteForum] int  NOT NULL,
    [MembreIDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'UtilisateurSet_Employeur'
CREATE TABLE [dbo].[UtilisateurSet_Employeur] (
    [IDEmployeur] int IDENTITY(1,1) NOT NULL,
    [nomEmployeur] nvarchar(200)  NOT NULL,
    [compteActif] bit  NOT NULL,
    [valideCourriel] bit  NOT NULL,
    [IDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'UtilisateurSet_Membre'
CREATE TABLE [dbo].[UtilisateurSet_Membre] (
    [IDMembre] int IDENTITY(1,1) NOT NULL,
    [nom] nvarchar(15)  NOT NULL,
    [prenom] nvarchar(15)  NOT NULL,
    [pathPhotoProfil] nvarchar(200)  NULL,
    [photoDescription] nvarchar(500)  NULL,
    [temoignage] nvarchar(1000)  NULL,
    [dateTemoignage] datetime  NULL,
    [compteActif] bit  NOT NULL,
    [IDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'UtilisateurSet_Professeur'
CREATE TABLE [dbo].[UtilisateurSet_Professeur] (
    [IDProfesseur] int IDENTITY(1,1) NOT NULL,
    [presentation] nvarchar(2000)  NULL,
    [IDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'UtilisateurSet_Admin'
CREATE TABLE [dbo].[UtilisateurSet_Admin] (
    [IDAdmin] int IDENTITY(1,1) NOT NULL,
    [IDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'UtilisateurSet_Etudiant'
CREATE TABLE [dbo].[UtilisateurSet_Etudiant] (
    [IDEtudiant] int IDENTITY(1,1) NOT NULL,
    [dateNaissance] datetime  NOT NULL,
    [valideTemoignage] bit  NOT NULL,
    [valideCourriel] bit  NOT NULL,
    [pathCV] nvarchar(200)  NOT NULL,
    [IDUtilisateur] int  NOT NULL
);
GO

-- Creating table 'ProfesseurCours'
CREATE TABLE [dbo].[ProfesseurCours] (
    [Professeur_IDUtilisateur] int  NOT NULL,
    [Cours_IDCours] int  NOT NULL
);
GO

-- Creating table 'MembreConsultationForum'
CREATE TABLE [dbo].[MembreConsultationForum] (
    [Membre_IDUtilisateur] int  NOT NULL,
    [ConsultationForum_IDConsultationForum] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IDDateEvenementVerTIC] in table 'DateEvenementVerTICSet'
ALTER TABLE [dbo].[DateEvenementVerTICSet]
ADD CONSTRAINT [PK_DateEvenementVerTICSet]
    PRIMARY KEY CLUSTERED ([IDDateEvenementVerTIC] ASC);
GO

-- Creating primary key on [IDVerTIC] in table 'VerTICSet'
ALTER TABLE [dbo].[VerTICSet]
ADD CONSTRAINT [PK_VerTICSet]
    PRIMARY KEY CLUSTERED ([IDVerTIC] ASC);
GO

-- Creating primary key on [IDLog] in table 'LogSet'
ALTER TABLE [dbo].[LogSet]
ADD CONSTRAINT [PK_LogSet]
    PRIMARY KEY CLUSTERED ([IDLog] ASC);
GO

-- Creating primary key on [IDUtilisateur] in table 'UtilisateurSet'
ALTER TABLE [dbo].[UtilisateurSet]
ADD CONSTRAINT [PK_UtilisateurSet]
    PRIMARY KEY CLUSTERED ([IDUtilisateur] ASC);
GO

-- Creating primary key on [IDOffreEmploi] in table 'OffreEmploiSet'
ALTER TABLE [dbo].[OffreEmploiSet]
ADD CONSTRAINT [PK_OffreEmploiSet]
    PRIMARY KEY CLUSTERED ([IDOffreEmploi] ASC);
GO

-- Creating primary key on [IDVille] in table 'VilleSet'
ALTER TABLE [dbo].[VilleSet]
ADD CONSTRAINT [PK_VilleSet]
    PRIMARY KEY CLUSTERED ([IDVille] ASC);
GO

-- Creating primary key on [IDConsultationForum] in table 'ConsultationForumSet'
ALTER TABLE [dbo].[ConsultationForumSet]
ADD CONSTRAINT [PK_ConsultationForumSet]
    PRIMARY KEY CLUSTERED ([IDConsultationForum] ASC);
GO

-- Creating primary key on [IDCours] in table 'CoursSet'
ALTER TABLE [dbo].[CoursSet]
ADD CONSTRAINT [PK_CoursSet]
    PRIMARY KEY CLUSTERED ([IDCours] ASC);
GO

-- Creating primary key on [IDEvenement] in table 'EvenementSet'
ALTER TABLE [dbo].[EvenementSet]
ADD CONSTRAINT [PK_EvenementSet]
    PRIMARY KEY CLUSTERED ([IDEvenement] ASC);
GO

-- Creating primary key on [IDParutionMedia] in table 'ParutionMediaSet'
ALTER TABLE [dbo].[ParutionMediaSet]
ADD CONSTRAINT [PK_ParutionMediaSet]
    PRIMARY KEY CLUSTERED ([IDParutionMedia] ASC);
GO

-- Creating primary key on [IDFAQ] in table 'FAQSet'
ALTER TABLE [dbo].[FAQSet]
ADD CONSTRAINT [PK_FAQSet]
    PRIMARY KEY CLUSTERED ([IDFAQ] ASC);
GO

-- Creating primary key on [IDNouvelle] in table 'NouvelleSet'
ALTER TABLE [dbo].[NouvelleSet]
ADD CONSTRAINT [PK_NouvelleSet]
    PRIMARY KEY CLUSTERED ([IDNouvelle] ASC);
GO

-- Creating primary key on [IDSectionForum] in table 'SectionForumSet'
ALTER TABLE [dbo].[SectionForumSet]
ADD CONSTRAINT [PK_SectionForumSet]
    PRIMARY KEY CLUSTERED ([IDSectionForum] ASC);
GO

-- Creating primary key on [IDEnteteForum] in table 'EnteteForumSet'
ALTER TABLE [dbo].[EnteteForumSet]
ADD CONSTRAINT [PK_EnteteForumSet]
    PRIMARY KEY CLUSTERED ([IDEnteteForum] ASC);
GO

-- Creating primary key on [IDMessageForum] in table 'MessageForumSet'
ALTER TABLE [dbo].[MessageForumSet]
ADD CONSTRAINT [PK_MessageForumSet]
    PRIMARY KEY CLUSTERED ([IDMessageForum] ASC);
GO

-- Creating primary key on [IDUtilisateur] in table 'UtilisateurSet_Employeur'
ALTER TABLE [dbo].[UtilisateurSet_Employeur]
ADD CONSTRAINT [PK_UtilisateurSet_Employeur]
    PRIMARY KEY CLUSTERED ([IDUtilisateur] ASC);
GO

-- Creating primary key on [IDUtilisateur] in table 'UtilisateurSet_Membre'
ALTER TABLE [dbo].[UtilisateurSet_Membre]
ADD CONSTRAINT [PK_UtilisateurSet_Membre]
    PRIMARY KEY CLUSTERED ([IDUtilisateur] ASC);
GO

-- Creating primary key on [IDUtilisateur] in table 'UtilisateurSet_Professeur'
ALTER TABLE [dbo].[UtilisateurSet_Professeur]
ADD CONSTRAINT [PK_UtilisateurSet_Professeur]
    PRIMARY KEY CLUSTERED ([IDUtilisateur] ASC);
GO

-- Creating primary key on [IDUtilisateur] in table 'UtilisateurSet_Admin'
ALTER TABLE [dbo].[UtilisateurSet_Admin]
ADD CONSTRAINT [PK_UtilisateurSet_Admin]
    PRIMARY KEY CLUSTERED ([IDUtilisateur] ASC);
GO

-- Creating primary key on [IDUtilisateur] in table 'UtilisateurSet_Etudiant'
ALTER TABLE [dbo].[UtilisateurSet_Etudiant]
ADD CONSTRAINT [PK_UtilisateurSet_Etudiant]
    PRIMARY KEY CLUSTERED ([IDUtilisateur] ASC);
GO

-- Creating primary key on [Professeur_IDUtilisateur], [Cours_IDCours] in table 'ProfesseurCours'
ALTER TABLE [dbo].[ProfesseurCours]
ADD CONSTRAINT [PK_ProfesseurCours]
    PRIMARY KEY CLUSTERED ([Professeur_IDUtilisateur], [Cours_IDCours] ASC);
GO

-- Creating primary key on [Membre_IDUtilisateur], [ConsultationForum_IDConsultationForum] in table 'MembreConsultationForum'
ALTER TABLE [dbo].[MembreConsultationForum]
ADD CONSTRAINT [PK_MembreConsultationForum]
    PRIMARY KEY CLUSTERED ([Membre_IDUtilisateur], [ConsultationForum_IDConsultationForum] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UtilisateurIDUtilisateur] in table 'LogSet'
ALTER TABLE [dbo].[LogSet]
ADD CONSTRAINT [FK_UtilisateurLog]
    FOREIGN KEY ([UtilisateurIDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet]
        ([IDUtilisateur])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UtilisateurLog'
CREATE INDEX [IX_FK_UtilisateurLog]
ON [dbo].[LogSet]
    ([UtilisateurIDUtilisateur]);
GO

-- Creating foreign key on [EmployeurIDUtilisateur] in table 'OffreEmploiSet'
ALTER TABLE [dbo].[OffreEmploiSet]
ADD CONSTRAINT [FK_EmployeurOffreEmploi]
    FOREIGN KEY ([EmployeurIDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Employeur]
        ([IDUtilisateur])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeurOffreEmploi'
CREATE INDEX [IX_FK_EmployeurOffreEmploi]
ON [dbo].[OffreEmploiSet]
    ([EmployeurIDUtilisateur]);
GO

-- Creating foreign key on [VilleIDVille] in table 'OffreEmploiSet'
ALTER TABLE [dbo].[OffreEmploiSet]
ADD CONSTRAINT [FK_OffreEmploiVille]
    FOREIGN KEY ([VilleIDVille])
    REFERENCES [dbo].[VilleSet]
        ([IDVille])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OffreEmploiVille'
CREATE INDEX [IX_FK_OffreEmploiVille]
ON [dbo].[OffreEmploiSet]
    ([VilleIDVille]);
GO

-- Creating foreign key on [Professeur_IDUtilisateur] in table 'ProfesseurCours'
ALTER TABLE [dbo].[ProfesseurCours]
ADD CONSTRAINT [FK_ProfesseurCours_Professeur]
    FOREIGN KEY ([Professeur_IDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Professeur]
        ([IDUtilisateur])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Cours_IDCours] in table 'ProfesseurCours'
ALTER TABLE [dbo].[ProfesseurCours]
ADD CONSTRAINT [FK_ProfesseurCours_Cours]
    FOREIGN KEY ([Cours_IDCours])
    REFERENCES [dbo].[CoursSet]
        ([IDCours])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfesseurCours_Cours'
CREATE INDEX [IX_FK_ProfesseurCours_Cours]
ON [dbo].[ProfesseurCours]
    ([Cours_IDCours]);
GO

-- Creating foreign key on [ProfesseurIDUtilisateur] in table 'EvenementSet'
ALTER TABLE [dbo].[EvenementSet]
ADD CONSTRAINT [FK_ProfesseurEvenement]
    FOREIGN KEY ([ProfesseurIDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Professeur]
        ([IDUtilisateur])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfesseurEvenement'
CREATE INDEX [IX_FK_ProfesseurEvenement]
ON [dbo].[EvenementSet]
    ([ProfesseurIDUtilisateur]);
GO

-- Creating foreign key on [ProfesseurIDUtilisateur] in table 'ParutionMediaSet'
ALTER TABLE [dbo].[ParutionMediaSet]
ADD CONSTRAINT [FK_ProfesseurParutionMedia]
    FOREIGN KEY ([ProfesseurIDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Professeur]
        ([IDUtilisateur])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfesseurParutionMedia'
CREATE INDEX [IX_FK_ProfesseurParutionMedia]
ON [dbo].[ParutionMediaSet]
    ([ProfesseurIDUtilisateur]);
GO

-- Creating foreign key on [ProfesseurIDUtilisateur] in table 'FAQSet'
ALTER TABLE [dbo].[FAQSet]
ADD CONSTRAINT [FK_ProfesseurFAQ]
    FOREIGN KEY ([ProfesseurIDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Professeur]
        ([IDUtilisateur])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfesseurFAQ'
CREATE INDEX [IX_FK_ProfesseurFAQ]
ON [dbo].[FAQSet]
    ([ProfesseurIDUtilisateur]);
GO

-- Creating foreign key on [ProfesseurIDUtilisateur] in table 'NouvelleSet'
ALTER TABLE [dbo].[NouvelleSet]
ADD CONSTRAINT [FK_ProfesseurNouvelle]
    FOREIGN KEY ([ProfesseurIDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Professeur]
        ([IDUtilisateur])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfesseurNouvelle'
CREATE INDEX [IX_FK_ProfesseurNouvelle]
ON [dbo].[NouvelleSet]
    ([ProfesseurIDUtilisateur]);
GO

-- Creating foreign key on [SectionForumIDSectionForum] in table 'EnteteForumSet'
ALTER TABLE [dbo].[EnteteForumSet]
ADD CONSTRAINT [FK_SectionForumEnteteForum]
    FOREIGN KEY ([SectionForumIDSectionForum])
    REFERENCES [dbo].[SectionForumSet]
        ([IDSectionForum])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SectionForumEnteteForum'
CREATE INDEX [IX_FK_SectionForumEnteteForum]
ON [dbo].[EnteteForumSet]
    ([SectionForumIDSectionForum]);
GO

-- Creating foreign key on [EnteteForumIDEnteteForum] in table 'MessageForumSet'
ALTER TABLE [dbo].[MessageForumSet]
ADD CONSTRAINT [FK_EnteteForumMessageForum]
    FOREIGN KEY ([EnteteForumIDEnteteForum])
    REFERENCES [dbo].[EnteteForumSet]
        ([IDEnteteForum])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EnteteForumMessageForum'
CREATE INDEX [IX_FK_EnteteForumMessageForum]
ON [dbo].[MessageForumSet]
    ([EnteteForumIDEnteteForum]);
GO

-- Creating foreign key on [EnteteForumIDEnteteForum] in table 'ConsultationForumSet'
ALTER TABLE [dbo].[ConsultationForumSet]
ADD CONSTRAINT [FK_EnteteForumConsultationForum]
    FOREIGN KEY ([EnteteForumIDEnteteForum])
    REFERENCES [dbo].[EnteteForumSet]
        ([IDEnteteForum])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EnteteForumConsultationForum'
CREATE INDEX [IX_FK_EnteteForumConsultationForum]
ON [dbo].[ConsultationForumSet]
    ([EnteteForumIDEnteteForum]);
GO

-- Creating foreign key on [MembreIDUtilisateur] in table 'EnteteForumSet'
ALTER TABLE [dbo].[EnteteForumSet]
ADD CONSTRAINT [FK_MembreEnteteForum]
    FOREIGN KEY ([MembreIDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Membre]
        ([IDUtilisateur])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembreEnteteForum'
CREATE INDEX [IX_FK_MembreEnteteForum]
ON [dbo].[EnteteForumSet]
    ([MembreIDUtilisateur]);
GO

-- Creating foreign key on [Membre_IDUtilisateur] in table 'MembreConsultationForum'
ALTER TABLE [dbo].[MembreConsultationForum]
ADD CONSTRAINT [FK_MembreConsultationForum_Membre]
    FOREIGN KEY ([Membre_IDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Membre]
        ([IDUtilisateur])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ConsultationForum_IDConsultationForum] in table 'MembreConsultationForum'
ALTER TABLE [dbo].[MembreConsultationForum]
ADD CONSTRAINT [FK_MembreConsultationForum_ConsultationForum]
    FOREIGN KEY ([ConsultationForum_IDConsultationForum])
    REFERENCES [dbo].[ConsultationForumSet]
        ([IDConsultationForum])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembreConsultationForum_ConsultationForum'
CREATE INDEX [IX_FK_MembreConsultationForum_ConsultationForum]
ON [dbo].[MembreConsultationForum]
    ([ConsultationForum_IDConsultationForum]);
GO

-- Creating foreign key on [MembreIDUtilisateur] in table 'MessageForumSet'
ALTER TABLE [dbo].[MessageForumSet]
ADD CONSTRAINT [FK_MembreMessageForum]
    FOREIGN KEY ([MembreIDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Membre]
        ([IDUtilisateur])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembreMessageForum'
CREATE INDEX [IX_FK_MembreMessageForum]
ON [dbo].[MessageForumSet]
    ([MembreIDUtilisateur]);
GO

-- Creating foreign key on [IDUtilisateur] in table 'UtilisateurSet_Employeur'
ALTER TABLE [dbo].[UtilisateurSet_Employeur]
ADD CONSTRAINT [FK_Employeur_inherits_Utilisateur]
    FOREIGN KEY ([IDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet]
        ([IDUtilisateur])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IDUtilisateur] in table 'UtilisateurSet_Membre'
ALTER TABLE [dbo].[UtilisateurSet_Membre]
ADD CONSTRAINT [FK_Membre_inherits_Utilisateur]
    FOREIGN KEY ([IDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet]
        ([IDUtilisateur])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IDUtilisateur] in table 'UtilisateurSet_Professeur'
ALTER TABLE [dbo].[UtilisateurSet_Professeur]
ADD CONSTRAINT [FK_Professeur_inherits_Membre]
    FOREIGN KEY ([IDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Membre]
        ([IDUtilisateur])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IDUtilisateur] in table 'UtilisateurSet_Admin'
ALTER TABLE [dbo].[UtilisateurSet_Admin]
ADD CONSTRAINT [FK_Admin_inherits_Utilisateur]
    FOREIGN KEY ([IDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet]
        ([IDUtilisateur])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IDUtilisateur] in table 'UtilisateurSet_Etudiant'
ALTER TABLE [dbo].[UtilisateurSet_Etudiant]
ADD CONSTRAINT [FK_Etudiant_inherits_Membre]
    FOREIGN KEY ([IDUtilisateur])
    REFERENCES [dbo].[UtilisateurSet_Membre]
        ([IDUtilisateur])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------