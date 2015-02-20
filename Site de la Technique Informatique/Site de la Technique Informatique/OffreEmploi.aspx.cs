﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site_de_la_Technique_Informatique.Model;
using System.Net;

namespace Site_de_la_Technique_Informatique
{
    public partial class OffreEmploi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Model.OffreEmploi offreEmploi;
            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {

                int idOffre = Int32.Parse(Session["IDOffreEmploi"].ToString());

                offreEmploi = (from offresEmploi in lecontexte.OffreEmploiSet
                               where offresEmploi.IDOffreEmploi == idOffre
                               select offresEmploi).FirstOrDefault();

                lblTitreOffre.Text = offreEmploi.titreOffre;
                lblAdresseVille.Text = offreEmploi.adresseTravail + ", " + offreEmploi.Ville.nomVille;
                lblNbHeureSemaine.Text = offreEmploi.nbHeureSemaine + " heures par semaine";
                lblDescriptionOffre.Text = offreEmploi.descriptionOffre;

                if (offreEmploi.dateExpiration == null)
                {
                    lblDateExpiration.Text = "Expiration de l'offre : Non définie";
                }
                else
                {
                    lblDateExpiration.Text = "Expiration de l'offre : " + offreEmploi.dateExpiration.ToString();
                }

                lblDateDebutOffre.Text = "Début de l'offre : " + offreEmploi.dateDebutOffre.ToString("dd/MM/yyyy");
                lblSalaire.Text = offreEmploi.salaire + " $/heure";
                lblNoTelephone.Text = "No de téléphone : " + offreEmploi.noTelephone;
                lblNoTelecopieur.Text = "No de télécopieur : " + offreEmploi.noTelecopieur;
                lblCourrielOffre.Text = "Courriel : " + offreEmploi.courrielOffre;
                lblPersonneRessource.Text = "Personne resource : " + offreEmploi.personneRessource;

                if (offreEmploi.pathPDFDescription == ""){
                    lnkPDF.Visible = false;
                }
                else
                {
                    lnkPDF.Visible = true;
                    ViewState["pathPDF"] = offreEmploi.pathPDFDescription;
                }

               
            }
        }

        protected void lnkPDF_Click(object sender, EventArgs e)
        {
            string FilePath = Server.MapPath(ViewState["pathPDF"].ToString());
            WebClient User = new WebClient();
            Byte[] FileBuffer = User.DownloadData(FilePath);
            if (FileBuffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }
        }
    }
}