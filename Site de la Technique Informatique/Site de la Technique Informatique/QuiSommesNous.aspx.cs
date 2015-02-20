﻿// Page qui liste les professeurs du départements
// Écrit par Marie-Philippe Gill, Février 2015

using Site_de_la_Technique_Informatique.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site_de_la_Technique_Informatique
{
    public partial class QuiSommesNous : ErrorHandling
    {
        #region Évènements de la page
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion 


        #region Remplissage du Listview LvProfesseurs
        public IQueryable<Professeur> lvProfesseurs_GetData()
        {
            List<Professeur> listeProf = null;
            try
            {
                using (LeModelTIContainer lecontexte = new LeModelTIContainer())
                {
                    listeProf = (from prof in lecontexte.UtilisateurSet.OfType<Membre>().OfType<Professeur>() select prof).ToList();
                }
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException("Une erreur s'est produite dans lors du lvProfesseurs_GetData", ex);
            }
            return listeProf.AsQueryable();
        }

        #endregion

    }
}