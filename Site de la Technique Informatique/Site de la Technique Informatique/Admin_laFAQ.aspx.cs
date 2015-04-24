﻿using Site_de_la_Technique_Informatique.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site_de_la_Technique_Informatique
{
    public partial class Admin_laFAQ : ErrorHandling
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.Attributes["style"] = "";
        }

        public IQueryable<Model.FAQ> getQuestionsFAQ()
        {
            // sert à remplir le listview 

            List<Model.FAQ> listeDesQuestions = new List<Model.FAQ>();

            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {
                try
                {
                    Model.FAQ premiereQuestion = new Model.FAQ();
                    premiereQuestion.IDFAQ = 0;
                    premiereQuestion.texteQuestion = "Sélectionnez une question";
                    premiereQuestion.texteReponse = "";
                    listeDesQuestions.Add(premiereQuestion);
                    listeDesQuestions.AddRange((from faq in lecontexte.FAQSet select faq).ToList());
                    
                }
                catch (Exception ex)
                {
                    lblMessage.Attributes["style"] = "color:red;";
                    lblMessage.Text += "ERREUR AVEC LE MEMBRE, " + ex.ToString();
                }
            }
            return listeDesQuestions.AsQueryable();
        }

        public Model.FAQ getQuestionAModifier()
        {
            Model.FAQ questionAModifier = null;

            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {
                try
                {
                    questionAModifier = (from faq in lecontexte.FAQSet select faq).FirstOrDefault();
                }
                catch (Exception ex)
                {
                    lblMessage.Attributes["style"] = "color:red;";
                    lblMessage.Text += "ERREUR AVEC LE MEMBRE, " + ex.ToString();
                }
            }
            return questionAModifier;
        }

        protected void ddlQuestionsFAQ_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Sert à afficher la question sélectionnée du dropdownlist dans le listview (et pouvoir par la suite la modifier ou la supprimer)

            TextBox txtQuestion = (TextBox)lviewModifFAQ.Items[0].FindControl("txtQuestion");
            TextBox txtReponse = (TextBox)lviewModifFAQ.Items[0].FindControl("txtReponse");
            try
            {
                using (LeModelTIContainer lecontexte = new LeModelTIContainer())
                {
                    int selectedValue = Convert.ToInt32(ddlQuestionsFAQ.SelectedValue);
                    if (selectedValue != 0)
                    {
                        Model.FAQ laFaq = (lecontexte.FAQSet.SingleOrDefault(m => m.IDFAQ == selectedValue));
                        txtQuestion.Text = laFaq.texteQuestion;
                        txtReponse.Text = laFaq.texteReponse;
                    }
                    else
                    {
                        txtQuestion.Text = "";
                        txtReponse.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text += "Une erreur est survenue lorsque l'on a tenté d'aller chercher le message. " + ex.InnerException;
            }
        }

        protected void btnAjouter_Click(object sender, EventArgs e)
        {
            // Sert à ajouter une question à la FAQ 

            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {
                try
                {
                    Model.FAQ nouvelleQuestion = new Model.FAQ();
                    string ajouterQuestion = txtAjouterQuestion.Text;
                    string ajouterReponse = txtAjouterReponse.Text;
                    nouvelleQuestion.texteQuestion = ajouterQuestion;
                    nouvelleQuestion.texteReponse = ajouterReponse;
                    lecontexte.FAQSet.Add(nouvelleQuestion);
                    nouvelleQuestion.ProfesseurIDUtilisateur = Convert.ToInt32(Server.HtmlEncode(Request.Cookies["TIID"].Value));
                    lecontexte.SaveChanges();
                }
                catch (Exception ex)
                {
                    lblMessage.Attributes["style"] = "color:red;";
                    lblMessage.Text += "Erreur lors du clic sur btn_Ajouter: " + ex.ToString();
                }
                lblMessage.Attributes["style"] = "color:green;";
                lblMessage.Text += "Vous avez bien ajouté votre question à la FAQ!";
                txtAjouterQuestion.Text = "";
                txtAjouterReponse.Text = "";
                ddlQuestionsFAQ.DataBind();
            }
        }


        protected void btnModifier_Click(object sender, EventArgs e)
        {
            // Sert à modifier une question de la FAQ

            try
            {
                using (LeModelTIContainer lecontexte = new LeModelTIContainer())
                {
                    int ID = Convert.ToInt32(ddlQuestionsFAQ.SelectedValue);
                    Model.FAQ questionAMod = (from question in lecontexte.FAQSet where question.IDFAQ == ID select question).FirstOrDefault();
                    TextBox txtQuestion = lviewModifFAQ.Items[0].FindControl("txtQuestion") as TextBox;
                    questionAMod.texteQuestion = txtQuestion.Text;
                    TextBox txtReponse = lviewModifFAQ.Items[0].FindControl("txtReponse") as TextBox;
                    questionAMod.texteReponse = txtReponse.Text;
                    lecontexte.SaveChanges();
                    ddlQuestionsFAQ.DataBind();
                    lviewModifFAQ.DataBind();
                    lblMessage.Attributes["style"] = "color:green;"; 
                    lblMessage.Text = "Vous avez bien modifié la question!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Attributes["style"] = "color:red;";
                lblMessage.Text += "Une erreur est survenue lorsque l'on a tenté de modifer la question de la FAQ : " + ex.InnerException;
            }
        }

        protected void btnSupprimer_Click(object sender, EventArgs e)
        {
            // Sert à supprimer une question de la FAQ 

            try
            {
                using (LeModelTIContainer lecontexte = new LeModelTIContainer())
                {
                    int ID = Convert.ToInt32(ddlQuestionsFAQ.SelectedValue);
                    Model.FAQ questionASupprimer = (from question in lecontexte.FAQSet where question.IDFAQ == ID select question).FirstOrDefault();
                    lecontexte.FAQSet.Remove(questionASupprimer);
                    lecontexte.SaveChanges();
                    ddlQuestionsFAQ.DataBind();
                    lviewModifFAQ.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Attributes["style"] = "color:red;";
                lblMessage.Text += "Une erreur est survenue lorsque l'on a tenté de supprimer une question de la FAQ : " + ex.InnerException;
            }
        }

    }
}