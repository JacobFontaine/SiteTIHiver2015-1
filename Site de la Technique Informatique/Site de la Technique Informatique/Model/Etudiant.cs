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
    
    public partial class Etudiant : Membre
    {
        public int IDEtudiant { get; set; }
        public System.DateTime dateNaissance { get; set; }
        public bool valideTemoignage { get; set; }
        public bool valideCourriel { get; set; }
        public string pathCV { get; set; }
    }
}
