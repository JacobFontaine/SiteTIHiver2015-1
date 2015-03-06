﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AjoutProfesseur.aspx.cs" Inherits="Site_de_la_Technique_Informatique.AjoutProfesseur" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../Css/Inscription.css" />
    <div class="container">
        <asp:ListView runat="server" ID="lvInscriptionProf"
            ItemType="Site_de_la_Technique_Informatique.Model.Professeur"
             SelectMethod="getProfesseur"
             UpdateMethod="creerProfesseur"
            >
            <ItemTemplate>

            
        <div class="row">
            <div class="col-md-12">
            <div class="col-md-4">
                
                <h2>Ajouter un Professeur</h2>

                
                <fieldset>
                     <div class="control-group form-group champs-requis">
                            Tous les champs sont requis.
                        </div>
                    <h4>Informations Personnelles</h4>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Prénom:</label>
                        <asp:TextBox runat="server" ID="txtPrenom" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Nom:</label>
                        <asp:TextBox runat="server" ID="txtNom" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                     </fieldset>
                </div>
                </div>
           
            <div class="col-md-12">
            <div class="col-md-4">
               <br />
                <fieldset>
                <h4>Informations de connexion</h4>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Courriel:</label>
                        <asp:TextBox runat="server" ID="txtCourriel" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Le mot de passe sera généré automatiquement et sera envoyé à l'adresse courriel</label>
                         </div>
                </div>
                    </fieldset>
                </div>
                </div>
            <div class="col-md-12">
                <div class="col-md-4">
                <asp:LinkButton ID="lnkAnnuler" Text="Annuler" runat="server" CssClass="btn btn-default" />
                <asp:LinkButton ID="lnkEnvoyer" Text="Envoyer" runat="server" CssClass="btn btn-default" CommandName="Update" />
                    </div>
            </div>
            
        </div>
                </ItemTemplate>

        </asp:ListView>
        <asp:Label ID="lblMessages" runat="server" Text ="" />
    </div>
</asp:Content>