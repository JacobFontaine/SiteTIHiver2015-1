﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Site_de_la_Technique_Informatique.Model;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Text.RegularExpressions;

namespace Site_de_la_Technique_Informatique.Model
{
    public partial class Utilisateur
    {
    }

    [MetadataType(typeof(UtilisateurValidation))]
    public partial class Utilisateur : IValidatableObject
    {
        public IEnumerable<ValidationResult> Validate(ValidationContext ValidationContext)
        {
            LeModelTIContainer leContext = new LeModelTIContainer();
            List<Utilisateur> listeUtilisateurs = (from cl in leContext.UtilisateurSet where cl.IDUtilisateur != this.IDUtilisateur select cl).ToList();
            var listeRetour = new List<ValidationResult>();



            foreach (Utilisateur member in listeUtilisateurs)
            {
                if (member.courriel == this.courriel )
                {
                    listeRetour.Add(new ValidationResult("Cette adresse courriel a déjà un compte associé"));
                    break;
                }

            }
            return listeRetour;
        }
    }
    
}
public partial class UtilisateurValidation
{

    [Key(),Required(ErrorMessage="Il y a eu un problème lors de l'inscription du membre")]
    public int IDUtilisateur { get; set; }


    [Required(ErrorMessage= "Le mot de passe est obligatoire")]
    public string hashMotDePasse { get; set; }
    public System.DateTime dateInscription { get; set; }



}