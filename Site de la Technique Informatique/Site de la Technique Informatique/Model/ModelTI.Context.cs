﻿//------------------------------------------------------------------------------
// <auto-generated>
//    Ce code a été généré à partir d'un modèle.
//
//    Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//    Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Site_de_la_Technique_Informatique.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ModelTIContainer : DbContext
    {
        public ModelTIContainer()
            : base("name=ModelTIContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<AdminJeu> AdminJeu { get; set; }
        public DbSet<ConsultationForumJeu> ConsultationForumJeu { get; set; }
        public DbSet<CoursJeu> CoursJeu { get; set; }
        public DbSet<EnteteForumJeu> EnteteForumJeu { get; set; }
        public DbSet<EvenementJeu> EvenementJeu { get; set; }
        public DbSet<FAQJeu> FAQJeu { get; set; }
        public DbSet<LogJeu> LogJeu { get; set; }
        public DbSet<MessageForumJeu> MessageForumJeu { get; set; }
        public DbSet<NouvelleJeu> NouvelleJeu { get; set; }
        public DbSet<ParutionMediaJeu> ParutionMediaJeu { get; set; }
        public DbSet<SectionForumJeu> SectionForumJeu { get; set; }
        public DbSet<UtilisateurJeu> UtilisateurJeu { get; set; }
        public DbSet<UtilisateurJeu_Etudiant> UtilisateurJeu_Etudiant { get; set; }
        public DbSet<UtilisateurJeu_Professeur> UtilisateurJeu_Professeur { get; set; }
        public DbSet<VerTICJeu> VerTICJeu { get; set; }
        public DbSet<EmployeurJeu> EmployeurJeuSet { get; set; }
        public DbSet<OffreEmploiJeu> OffreEmploiJeuSet { get; set; }
        public DbSet<DateEvenementVerTICJeu> DateEvenementVerTICJeuSet { get; set; }
    }
}
