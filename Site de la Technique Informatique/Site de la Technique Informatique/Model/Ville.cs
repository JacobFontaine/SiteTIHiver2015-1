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
    
    public partial class Ville
    {
        public Ville()
        {
            this.OffreEmploiJeuSet = new HashSet<OffreEmploiJeuSet>();
        }
    
        public int IDVille { get; set; }
        public string nomVille { get; set; }
    
        public virtual ICollection<OffreEmploiJeuSet> OffreEmploiJeuSet { get; set; }
    }
}