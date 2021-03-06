//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Membre : Utilisateur
    {
        public Membre()
        {
            this.EnteteForum = new HashSet<EnteteForum>();
            this.ConsultationForum = new HashSet<ConsultationForum>();
            this.MessageForum = new HashSet<MessageForum>();
        }
    
        public int IDMembre { get; set; }
        public string nom { get; set; }
        public string prenom { get; set; }
        public string pathPhotoProfil { get; set; }
        public string photoDescription { get; set; }
        public string temoignage { get; set; }
        public Nullable<System.DateTime> dateTemoignage { get; set; }
        public int compteActif { get; set; }
    
        public virtual ICollection<EnteteForum> EnteteForum { get; set; }
        public virtual ICollection<ConsultationForum> ConsultationForum { get; set; }
        public virtual ICollection<MessageForum> MessageForum { get; set; }
    }
}
