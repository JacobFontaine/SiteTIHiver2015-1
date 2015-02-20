﻿//code C# page d'inscription
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

namespace Site_de_la_Technique_Informatique.Inscription
{
    public partial class Inscription : System.Web.UI.Page
    {

        protected void Page_Load()
        {

        }
        //Cette classe permet de créer un nouveau membre Utilisateur vide pour afficher dans le listeview.
        //Écrit par Cédric Archambault 17 février 2015
        //Intrants: aucun
        //Extrants:Utilisateur
        public Etudiant GetUtilisateurEtudiant()
        {

            try
            {
                using (LeModelTIContainer leContext = new LeModelTIContainer())
                {
                    List<Etudiant> listEtudiant = (from cl in leContext.UtilisateurSet.OfType<Etudiant>() select cl).ToList();
                    Etudiant nouveauEtudiant = new Etudiant();
                    listEtudiant.Add(nouveauEtudiant);

                    return listEtudiant.Last();
                }
            }
            catch (Exception ex)
            {

            }
            return null;
        }
        //Cette class permet de valider l'utilisateur qui est a l'écran et sauvegarder dans la BD
        //Écrit par Cédric Archambault 17 février 2015
        //Intrants:Etudiant
        //Extrants:Aucun
        public void CreerUtilisateurEtudiant(Etudiant etudiantACreer)
        {
            try
            {
                using (LeModelTIContainer leContext = new LeModelTIContainer())
                {
                    Etudiant etudiantACreerCopie = new Etudiant();
                    ListViewItem lviewItem = lviewFormulaireInscription.Items[0];
                    //Valider la date de naissance
                    TextBox txtDateNaissanceJour = (TextBox)lviewItem.FindControl("txtDateNaissanceJour");
                    TextBox txtDateNaissanceMois = (TextBox)lviewItem.FindControl("txtDateNaissanceMois");
                    TextBox txtDateNaissanceAnnee = (TextBox)lviewItem.FindControl("txtDateNaissanceAnnee");

                    String strDateNaissance = txtDateNaissanceAnnee.Text + "/" + txtDateNaissanceMois.Text + "/" + txtDateNaissanceJour.Text;

                    DateTime dateNaissance;
                    DateTime.TryParse(strDateNaissance, out dateNaissance);
                    etudiantACreerCopie.dateNaissance = (DateTime)dateNaissance;
                    //Validation

                    TryUpdateModel(etudiantACreerCopie);
                    var contextVal = new ValidationContext(etudiantACreerCopie, serviceProvider: null, items: null);
                    var resultatsValidation = new List<ValidationResult>();
                    var isValid = Validator.TryValidateObject(etudiantACreerCopie, contextVal, resultatsValidation, true);

                    //Pénom validation
                    if (etudiantACreerCopie.prenom == "" || etudiantACreerCopie.prenom == null)
                    {
                        ValidationResult vald = new ValidationResult("Le prénom est requis.", new[] { "nom" });
                        isValid = false;
                        resultatsValidation.Add(vald);
                    }
                    if (etudiantACreerCopie.prenom != null && etudiantACreerCopie.prenom.Length > 64)
                    {
                        ValidationResult vald = new ValidationResult("Le prénom doit avoir moins de 64 caractères.", new[] { "nom" });
                        isValid = false;
                        resultatsValidation.Add(vald);
                    }
                    //Nom validation
                    if (etudiantACreerCopie.nom == "" || etudiantACreerCopie.nom == null)
                    {
                        ValidationResult vald = new ValidationResult("Un nom est requis.", new[] { "nom" });
                        isValid = false;
                        resultatsValidation.Add(vald);
                    }
                    if (etudiantACreerCopie.nom != null && etudiantACreerCopie.nom.Length > 64)
                    {
                        ValidationResult vald = new ValidationResult("Le nom doit avoir moins de 64 caractères.", new[] { "nom" });
                        isValid = false;
                        resultatsValidation.Add(vald);
                    }
                    //Comparer les mots de passe
                    TextBox txtConfirmationMotDePasse = (TextBox)lviewItem.FindControl("txtConfirmationMotDePasse");
                    if (txtConfirmationMotDePasse != null && etudiantACreerCopie.hashMotDePasse != txtConfirmationMotDePasse.Text)
                    {
                        ValidationResult vald = new ValidationResult("Les mots de passes ne match pas.", new[] { "hashMotDepasse" });
                        isValid = false;
                        resultatsValidation.Add(vald);
                    }

                    //Classes validations

                    if (!isValid)
                    {
                        foreach (var ValdationResult in resultatsValidation)
                        {
                            String input = ValdationResult.MemberNames.FirstOrDefault();
                            input = input.First().ToString().ToUpper() + String.Join("", input.Skip(1));
                            if(input!="DateNaissance")
                            { 
                            TextBox txtError = (TextBox)lviewItem.FindControl("txt"+input);
                            txtError.CssClass += " has-error";
                            }
                            else
                            {

                            }
                        }
                    }
                    else
                    {
                        //Convertir le mot de passe en hashcode
                        etudiantACreerCopie.hashMotDePasse = GetSHA256Hash(etudiantACreerCopie.hashMotDePasse);
                        //Date inscription
                        etudiantACreerCopie.dateInscription = (DateTime)DateTime.Now;

                        etudiantACreerCopie.valideCourriel = false;
                        etudiantACreerCopie.compteActif = false;

                        leContext.UtilisateurSet.Add(etudiantACreerCopie);
                        leContext.SaveChanges();

                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        //Cette class permet des/active le bouton accepter par le checkbox
        //Écrit par Cédric Archambault 17 février 2015
        //Intrants:sende,e
        //Extrants:Aucun
        protected void cbCondition_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                activer_bouton_Accepter();
            }
            catch (Exception ex)
            {

            }
        }
        //Cette class permet des/active le bouton accepter par le link  Accepter
        //Écrit par Cédric Archambault 17 février 2015
        //Intrants:sende,e
        //Extrants:Aucun
        protected void lnkAcccepter_Click(object sender, EventArgs e)
        {
            try
            {
                ListViewItem lviewItem = lviewFormulaireInscription.Items[0];
                CheckBox cbCondition = (CheckBox)lviewItem.FindControl("cbCondition");
                cbCondition.Checked = true;
                activer_bouton_Accepter();
            }
            catch (Exception ex)
            {

            }
        }
        //Cette class permet des/active le bouton accepter
        //Écrit par Cédric Archambault 17 février 2015
        //Intrants:aucun
        //Extrants:Aucun
        protected void activer_bouton_Accepter()
        {
            ListViewItem lviewItem = lviewFormulaireInscription.Items[0];
            CheckBox cbCondition = (CheckBox)lviewItem.FindControl("cbCondition");
            LinkButton lnkEnvoyer = (LinkButton)lviewItem.FindControl("lnkEnvoyer");
            if (cbCondition.Checked == true)
            {
                lnkEnvoyer.Enabled = true;
                lnkEnvoyer.CssClass = "btn btn-primary";
            }
            else
            {
                lnkEnvoyer.Enabled = false;
                lnkEnvoyer.CssClass = "btn btn-default";
            }
        }
        //Cette class permet d'envoyer un courriel de confirmation de l'inscription.
        //Écrit par Cédric Archambault 18 février 2015
        //Intrants:Etudiant
        //Extrants:Aucun
        public void envoie_courriel_confirmation(Etudiant etudiant)
        {
            try
            {
                SmtpClient smtpClient = new SmtpClient("", 25);
                smtpClient.Credentials = new System.Net.NetworkCredential("test@cegepgranby.qc.ca", "Mot de passe");
                smtpClient.UseDefaultCredentials = true;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.EnableSsl = true;
                MailMessage courriel = new MailMessage();

                courriel.From = new MailAddress("nePasRepondre@cegepgranby.qc.ca", "Technique Informatique Cegep de Granby");
                courriel.To.Add(new MailAddress(etudiant.courriel));
                courriel.Subject = "Validation du courriel";

                //Hash code du courriel et de la date de création du compte, au cas ou le courriel est déja dans la bd.
                //Exemple: Deux futures étudiants de la même famille s'inscritent avec le même courriel.
                courriel.Body = "Bla bla bla" + etudiant.prenom + " " + etudiant.nom + "Valider votre courriel :" + GetSHA256Hash(etudiant.courriel + etudiant.dateInscription);
                smtpClient.Send(courriel);
            }
            catch (Exception ex)
            {

            }
        }
        //pour hasher le mot de passe
        public string GetSHA256Hash(string s)
        {

            if (string.IsNullOrEmpty(s))
            {
                throw new ArgumentException("Une valeur nulle ne peut être hashée.");
            }


            Byte[] data = System.Text.Encoding.UTF8.GetBytes(s);
            Byte[] hash = new SHA256CryptoServiceProvider().ComputeHash(data);
            string hashMdp = Convert.ToBase64String(hash);
            return hashMdp;
        }
    }
}