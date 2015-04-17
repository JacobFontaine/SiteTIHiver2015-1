﻿//code C# page Validation Inscription-employeur
//Écrit par Cédric Archambault
//
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site_de_la_Technique_Informatique.Model;
using System.ComponentModel.DataAnnotations;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Web.UI.HtmlControls;
using Newtonsoft.Json;
using System.Drawing;
using System.IO;

namespace Site_de_la_Technique_Informatique
{
    public partial class Admin_Validation_Inscription_Employeur : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Cette class chercher la liste des étudiant inscription dont leur courriel n'a pas été validé depuis plus de 24 h.
        //Écrit par Cédric Archambault 17 avril 2015
        //Intrants:Vide
        //Extrants:IQueryable<Etudiant> List
        public String GetCourrielEmployeurNonValiderList()
        {
            try
            {
                using (LeModelTIContainer leContext = new LeModelTIContainer())
                {
                    DateTime dt = DateTime.Now.AddHours(-24);
                    return (from cl in leContext.UtilisateurSet.OfType<Employeur>() where cl.valideCourriel == false && cl.compteActif == false && cl.dateInscription < dt select cl).Count().ToString();
                }

            }
            catch (Exception ex)
            {

            }
            return "";
        }
        //Cette class chercher la liste des Employeurs inscription dont leur courriel à été validé, mais leur compte n'est pas acctiver.
        //Écrit par Cédric Archambault 27 février 2015
        //Intrants:Vide
        //Extrants:IQueryable<Etudiant> List
        public IQueryable<Employeur> GetUtilisateurEmployeurList()
        {
            try
            {
                using (LeModelTIContainer leContext = new LeModelTIContainer())
                {
                    List<Employeur> employeurList = (from cl in leContext.UtilisateurSet.OfType<Employeur>() where cl.valideCourriel == true && cl.compteActif == false orderby cl.IDEmployeur descending select cl).ToList();


                    if (employeurList.Count == 0)
                    {

                        divAucunNouvelleInscription.Visible = true;
                    }
                    else
                    {
                        divAucunNouvelleInscription.Visible = false;
                    }

                    return employeurList.AsQueryable();

                }
            }
            catch (Exception ex)
            {

            }
            return null;
        }
        //Cette class Efface tous les comptes étudiants sélectionner
        //Écrit par Cédric Archambault 27 février 2015
        //Intrants:Vide
        //Extrants:Vide
        protected void lnkSupprimerTous()
        {
            try
            {
                using (LeModelTIContainer leContext = new LeModelTIContainer())
                {
                    ListView listv = lviewValidationInscription;
                    foreach (ListViewDataItem item in listv.Items)
                    {
                        CheckBox chSelectionner = (CheckBox)item.FindControl("chSelectionner");
                        Label lblId = (Label)item.FindControl("lblId");
                        if (chSelectionner != null && lblId != null && chSelectionner.Checked)
                        {
                            int id = int.Parse(lblId.Text);
                            Etudiant etudiant = (from cl in leContext.UtilisateurSet.OfType<Etudiant>() where cl.IDEtudiant == id select cl).FirstOrDefault();
                            File.Delete("~Photos/Profils/" + etudiant.pathPhotoProfil);
                            leContext.UtilisateurSet.Remove(etudiant);
                        }
                    }
                    leContext.SaveChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception ex)
            {

            }
        }
        //Cette class refuser un étudiant.
        //Écrit par Cédric Archambault 27 février 2015
        //Intrants:Objet Etudiant
        //Extrants:vide
        protected void lnkRefuser_Click(object sender, EventArgs e)
        {
            try
            {
                using (LeModelTIContainer leContext = new LeModelTIContainer())
                {
                    LinkButton lnkAccepter = (LinkButton)sender;
                    int idEtudiant = int.Parse(lnkAccepter.CommandArgument);
                    Etudiant etudiant = (from cl in leContext.UtilisateurSet.OfType<Etudiant>() where cl.IDEtudiant == idEtudiant select cl).FirstOrDefault();
                    leContext.UtilisateurSet.Remove(etudiant);
                    File.Delete("~Photos/Profils/" + etudiant.pathPhotoProfil);
                    leContext.SaveChanges();
                    Response.Redirect(Request.RawUrl);

                }
            }
            catch (Exception ex)
            {

            }
        }

        //Cette class Accepter tous les comptes étudiants sélectionner
        //Écrit par Cédric Archambault 27 février 2015
        //Intrants:Vide
        //Extrants:Vide
        protected void lnkAccepterTous()
        {
            try
            {
                using (LeModelTIContainer leContext = new LeModelTIContainer())
                {

                    ListView listv = lviewValidationInscription;
                    foreach (ListViewDataItem item in listv.Items)
                    {
                        CheckBox chSelectionner = (CheckBox)item.FindControl("chSelectionner");
                        Label lblId = (Label)item.FindControl("lblId");
                        if (chSelectionner != null && lblId != null && chSelectionner.Checked)
                        {
                            int id = int.Parse(lblId.Text);
                            Employeur employeur = (from cl in leContext.UtilisateurSet.OfType<Employeur>() where cl.IDEmployeur == id select cl).FirstOrDefault();
                            envoie_courriel_confirmation(employeur);
                            employeur.compteActif = true;//Ative le compte.
                        }
                    }
                    leContext.SaveChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception ex)
            {

            }
        }
        //Cette class Accepter un étudiant.
        //Écrit par Cédric Archambault 27 février 2015
        //Intrants:Objet Etudiant
        //Extrants:vide
        protected void lnkAccepter_Click(object sender, EventArgs e)
        {
            try
            {
                using (LeModelTIContainer leContext = new LeModelTIContainer())
                {
                    LinkButton lnkAccepter = (LinkButton)sender;
                    int iDEmployeur = int.Parse(lnkAccepter.CommandArgument);
                    Employeur employeur = (from cl in leContext.UtilisateurSet.OfType<Employeur>() where cl.IDEmployeur == iDEmployeur select cl).FirstOrDefault();
                    employeur.compteActif = false;//Ative le compte.
                    leContext.SaveChanges();
                    envoie_courriel_confirmation(employeur);
                    Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception ex)
            {

            }
        }
        //Cette class sélectionne tous les étudiants à l'écran.
        //Écrit par Cédric Archambault 27 février 2015
        //Intrants:Objet Etudiant
        //Extrants:vide
        protected void checkTous()
        {
            try
            {
                using (LeModelTIContainer leContext = new LeModelTIContainer())
                {
                    ListView listv = lviewValidationInscription;
                    CheckBox chSelectionnerTous = (CheckBox)listv.FindControl("chSelectionnerTous");
                    if (chSelectionnerTous != null)
                    {
                        foreach (ListViewDataItem item in listv.Items)
                        {
                            CheckBox chSelectionner = (CheckBox)item.FindControl("chSelectionner");
                            if (chSelectionner != null)
                            {
                                if (chSelectionnerTous.Checked)
                                {
                                    chSelectionner.Checked = true;
                                }
                                else
                                {
                                    chSelectionner.Checked = false;
                                }
                            }
                        }
                    }
                    leContext.SaveChanges();

                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void lnkRefuserTousHaut_Click(object sender, EventArgs e)
        {
            lnkSupprimerTous();
            Response.Redirect(Request.RawUrl);
        }

        protected void lnkAccepterTousHaut_Click(object sender, EventArgs e)
        {
            lnkAccepterTous();
            Response.Redirect(Request.RawUrl);
        }

        protected void chSelectionnerTous_CheckedChanged(object sender, EventArgs e)
        {
            checkTous();
        }

        protected void lnkEffacerInscriptionCourrielNonValider_Click(object sender, EventArgs e)
        {
            try
            {
                using (LeModelTIContainer leContext = new LeModelTIContainer())
                {
                    DateTime dt = DateTime.Now.AddHours(-24);
                    List<Employeur> etudiantList = (from cl in leContext.UtilisateurSet.OfType<Employeur>() where cl.valideCourriel == false && cl.compteActif == false && cl.dateInscription < dt select cl).ToList();

                    if (etudiantList.Count > 0)
                    {
                        foreach (var etudiant in etudiantList)
                        {
                            leContext.UtilisateurSet.Remove(etudiant);
                        }
                        leContext.SaveChanges();
                    }

                }
            }
            catch (Exception ex)
            {

            }
        }
        //Cette class permet d'envoyer un courriel de confirmation de l'inscription.
        //Écrit par Cédric Archambault 18 février 2015
        //Intrants:Etudiant
        //Extrants:Aucun
        public void envoie_courriel_confirmation(Employeur employeur)
        {
            // METTRE ICI LE EMAIL DE LA PERSONNE QUI VA RÉPONDRE AUX MESSAGES DES FUTURS ÉTUDIANTS 

            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(employeur.courriel);

            // Informations de l'en-tête du message 
            // 1- Email de la personne qui contacte le département 
            // 2- Nom / Prénom de la personne qui contacte le département 
            mail.From = new System.Net.Mail.MailAddress(employeur.courriel, "Cgep", System.Text.Encoding.UTF8);

            // Sujet de l'email envoyé
            mail.Subject = "Inscription TI Cegep de Granby";

            mail.SubjectEncoding = System.Text.Encoding.UTF8;

            // Email de qui provient l'email (donc va chercher l'email de la personne dans le textbox)


            // Corps du message : contient ce que la personne a écrit dans le module seulement

            mail.Body = "Chère " + employeur.nomEmployeur +  ", l'administrateur a activé votre compte. ";



            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = System.Net.Mail.MailPriority.High;
            System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("mariephilippe.gill@gmail.com", "(pap!er)");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
            }
            catch (Exception ex)
            {
                Exception logEx = ex;
                throw new Exception("Erreur d'envoie de message : " + ex.ToString() + "Inner exception de l'erreur: " + logEx.InnerException + "Essai d'envoi à : ");
            }


        }



    }
}