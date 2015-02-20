﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Site_de_la_Technique_Informatique.Model;


namespace Site_de_la_Technique_Informatique.Classes
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlControl body = Master.FindControl("pageBody") as HtmlControl;
            body.Attributes.Add("data-spy", "scroll");
            body.Attributes.Add("data-target", ".scrolltarget");
            body.Attributes.Add("data-offset", "20");
            body.Attributes.Add("style", "position:relative; overflow:auto;");

            string caract = getCaracteristiquePortable();
            txtCaractPortatif.Text = caract;
            string autres = getAutresPortable();
            txtAutres.Text=autres;
            string licences = getLicences();
            txtLogicielLicenses.Text = licences;
            string libres = getLibres();
            txtLogicielLibres.Text = libres;
        }

        public String getCaracteristiquePortable()
        {
            string caracteristiquePortable="";
            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {

                caracteristiquePortable = (from description in lecontexte.VerTICSet select description.caractéristiquesPortable).FirstOrDefault();
            }
            return caracteristiquePortable;
        }
        public String getAutresPortable()
        {
            string autresPortable = "";
            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {

                autresPortable = (from autres in lecontexte.VerTICSet select autres.autrePortable).FirstOrDefault();
            }
            return autresPortable;
        }
        public String getLicences()
        {
            string licences = "";
            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {

                licences = (from licence in lecontexte.VerTICSet select licence.descriptionLicence).FirstOrDefault();
            }
            return licences;
        }
        public String getLibres()
        {
            string libres = "";
            using (LeModelTIContainer lecontexte = new LeModelTIContainer())
            {

                libres = (from libre in lecontexte.VerTICSet select libre.descriptionLibre).FirstOrDefault();
            }
            

            string caract = getCaracteristiquePortable();
            txtCaractPortatif.Text = caract;
            return libres;
        }

      

 
public IQueryable<DateEvenementVerTIC> lvEcheancier_GetData()
{
    var listeEvenements = new List<DateEvenementVerTIC>();
    using (LeModelTIContainer lecontexte = new LeModelTIContainer())
    {
        listeEvenements = (from cl in lecontexte.DateEvenementVerTICSet select cl).ToList();
    }

    if (listeEvenements.Count() == 0)
    {
        DateEvenementVerTIC eventTest = new DateEvenementVerTIC();
        eventTest.dateDescription = "14 février 2014";
        eventTest.evenement = "Date de Test";
        eventTest.IDDateEvenementVerTIC = 1;
        listeEvenements.Add(eventTest);
    }
    return listeEvenements.AsQueryable();
}

    }
}