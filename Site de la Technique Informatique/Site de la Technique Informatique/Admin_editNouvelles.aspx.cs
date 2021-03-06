﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site_de_la_Technique_Informatique.Model;
using System.Data;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.Validation;
using System.Web.Services;
using System.Drawing;

namespace Site_de_la_Technique_Informatique
{
    public partial class temp_editNouvelles : ErrorHandling
    {
        public int id = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            msgError.ForeColor = Color.Red;
            SavoirSiPossedeAutorizationPourLaPage(false, true, false, false, false);
        }

        public IQueryable<Nouvelle> getNouvelles()
        {
            List<Nouvelle> listeNouvelle = new List<Nouvelle>();
            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {
                Nouvelle ok = new Nouvelle();

                listeNouvelle = (from nouvelles in lecontexte.NouvelleSet orderby nouvelles.dateNouvelle descending select nouvelles).ToList();
            }

            return listeNouvelle.AsQueryable();
        }

        public IQueryable<Nouvelle> getEditNouvelles()
        {
            List<Nouvelle> listeNouvelle = new List<Nouvelle>();
            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {
                Nouvelle ok = new Nouvelle();

                listeNouvelle = (from nouvelles in lecontexte.NouvelleSet where nouvelles.IDNouvelle == id select nouvelles).ToList();
            }

            return listeNouvelle.AsQueryable();
        }

        protected void lnkEditNews_Command(object sender, CommandEventArgs e)
        {
            panelNouvelles.Visible = false;
            btnNewNouvelle.Visible = false;
            lviewEditNews.Visible = true;
            msgError.Visible = false;
            id = Convert.ToInt32(e.CommandArgument);
            lviewEditNews.DataBind();
            lviewNouvelles.DataBind();
            ((TextBox)lviewEditNews.Items[0].FindControl("txtContenuNouvelle")).Text = Server.HtmlDecode(((TextBox)lviewEditNews.Items[0].FindControl("txtContenuNouvelle")).Text);

        }

        // Le nom du paramètre id doit correspondre à la valeur DataKeyNames définie sur le contrôle
        public void lviewEditNews_UpdateItem(int idNouvelle)
        {
            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {
                string newsid = ((Label)lviewEditNews.Items[0].FindControl("idNews")).Text;
                Model.Nouvelle lanewsAUpdate = ((Model.Nouvelle)lecontexte.NouvelleSet.Find(Convert.ToInt32(newsid)));
                lanewsAUpdate.texteNouvelle = ((TextBox)lviewEditNews.Items[0].FindControl("txtContenuNouvelle")).Text;
                lanewsAUpdate.titreNouvelle = ((TextBox)lviewEditNews.Items[0].FindControl("txtTitreNouvelle")).Text;
                if (((CheckBox)lviewEditNews.Items[0].FindControl("chkMajor")).Checked)
                {
                    lanewsAUpdate.dateNouvelle = DateTime.Now;
                }

                lecontexte.SaveChanges();
                lviewNouvelles.DataBind();
                lviewEditNews.DataBind();
                msgError.Text = "Nouvelle éditée avec succès";
                msgError.Visible = true;
                this.reset_Page();
            }
        }

        protected void btnAjouter_Click(object sender, EventArgs e)
        {
            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {
                if (Request.Cookies["TIID"] != null)
                {
                    bool isValid = true;
                    string lesErreurs = "";

                    //Checker le tittre
                    if (txtTitreAjout.Text.Trim().Count() < 3)
                    {
                        lesErreurs += "Le titre est trop court <br/>";
                        isValid = false;
                    }

                    //Checker le texte
                    if (txtNouvelleAjout.Text.Trim().Count() < 10)
                    {
                        lesErreurs += "Le texte de la nouvelle est trop court <br/>";
                        isValid = false;
                    }

                    if (isValid == true)
                    {
                        Model.Nouvelle lanewsAUpdate = new Model.Nouvelle();
                        lanewsAUpdate.texteNouvelle = txtNouvelleAjout.Text;
                        lanewsAUpdate.titreNouvelle = txtTitreAjout.Text;
                        lanewsAUpdate.dateNouvelle = DateTime.Now;
                        lanewsAUpdate.ProfesseurIDUtilisateur = Convert.ToInt32(Server.HtmlEncode(Request.Cookies["TIID"].Value));
                        lecontexte.NouvelleSet.Add(lanewsAUpdate);
                        lecontexte.SaveChanges();
                        lviewNouvelles.DataBind();
                        lviewEditNews.DataBind();
                        msgError.Text = "Nouvelle ajoutée avec succès";
                        msgError.ForeColor = Color.Green;
                        msgError.Visible = true;
                        this.reset_Page();

                        lblMessageErreur.Text = "";
                    }
                    else
                    {
                        lblMessageErreur.Text = lesErreurs;
                        lblMessageErreur.ForeColor = Color.Red;
                    }
                }
            }
        }

        protected void btnNewNouvelle_Click(object sender, EventArgs e)
        {
            panelNouvelles.Visible = false;
            btnNewNouvelle.Visible = false;
            panelAjoutNews.Visible = true;
            msgError.Visible = false;
        }

        protected void btnAnnuler_Click(object sender, EventArgs e)
        {
            msgError.Visible = false;
            this.reset_Page();
        }

        protected void reset_Page()
        {
            panelNouvelles.Visible = true;
            btnNewNouvelle.Visible = true;
            panelAjoutNews.Visible = false;
            lviewEditNews.Visible = false;
            txtTitreAjout.Text = "";
            txtNouvelleAjout.Text = "";
        }

        protected void btnSupprimer_Click(object sender, EventArgs e)
        {
            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {
                string newsid = ((Label)lviewEditNews.Items[0].FindControl("idNews")).Text;
                Model.Nouvelle lanewsAUpdate = ((Model.Nouvelle)lecontexte.NouvelleSet.Find(Convert.ToInt32(newsid)));
                lecontexte.NouvelleSet.Remove(lanewsAUpdate);
                lecontexte.SaveChanges();
                lviewNouvelles.DataBind();
                lviewEditNews.DataBind();
                msgError.Text = "Nouvelle Supprimée avec Succès";
                msgError.ForeColor = Color.Green;
                msgError.Visible = true;
                this.reset_Page();
            }
        }
    }
}