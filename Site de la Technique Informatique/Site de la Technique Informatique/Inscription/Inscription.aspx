﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inscription.aspx.cs" Inherits="Site_de_la_Technique_Informatique.Inscription.Inscription" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="../Css/Inscription.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="cropper.css" rel="stylesheet">
    <link href="css/docs.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row row-centered">
            <div class="col-lg-5 col-centered">
                <h1>Inscription</h1>
            </div>
        </div>
        <asp:ListView ID="lviewFormulaireInscription" runat="server"
            ItemType="Site_de_la_Technique_Informatique.Model.Etudiant"
            SelectMethod="GetUtilisateurEtudiant"
            UpdateMethod="CreerUtilisateurEtudiant">
            <ItemTemplate>
                <div class="row row-centered">
                    <div class="col-lg-5 col-centered">
                        <div class="control-group form-group champs-requis">
                            Tous les champs sont requis.
                        </div>
                        <div class="control-group form-group">
                            <div class="controls">
                                <label>Prénom:</label>
                                <asp:TextBox ID="txtPrenom" runat="server" CssClass="form-control" placeholder="Prénom" Text='<%#BindItem.prenom %>' name="fname" />
                            </div>
                        </div>
                        <div class="control-group form-group">
                            <div class="controls">
                                <label>Nom:</label>
                                <asp:TextBox ID="txtNom" runat="server" CssClass="form-control" placeholder="Nom" Text='<%#BindItem.nom %>' name="lname" />
                            </div>
                        </div>
                        <div class="control-group form-group">
                            <div class="controls">
                                <label>Date de naissance:</label>
                                <div class="row">
                                    <div class="col-xs-2">
                                        <asp:TextBox ID="txtDateNaissanceJour" runat="server" CssClass="form-control inputJourMois" placeholder="JJ" />
                                    </div>
                                    <div class="col-xs-2">
                                        <asp:TextBox ID="txtDateNaissanceMois" runat="server" CssClass="form-control inputJourMois" placeholder="mm" />
                                    </div>
                                    <div class="col-xs-3">
                                        <asp:TextBox ID="txtDateNaissanceAnnee" runat="server" CssClass="form-control" placeholder="AAAA" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="control-group form-group">
                            <div class="controls">
                                <label>Courriel:</label>
                                <asp:TextBox ID="txtCourriel" runat="server" CssClass="form-control" placeholder="courriel@exemple.qc.ca" Text='<%#BindItem.courriel %>' Font-Names="email" />
                            </div>
                        </div>
                        <div class="control-group form-group">
                            <div class="controls">
                                <label>Mot de passe:</label>
                                <asp:TextBox ID="txtMotDePasse" runat="server" TextMode="password" CssClass="form-control" Text='<%#BindItem.hashMotDePasse %>' />
                            </div>
                        </div>
                        <div class="control-group form-group">
                            <div class="controls">
                                <label>Confirmation du mot de passe:</label>
                                <asp:TextBox ID="txtConfirmationMotDePasse" runat="server" TextMode="password" CssClass="form-control" />
                            </div>

                        </div>
                        <asp:UpdatePanel ID="upCondition" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                            <ContentTemplate>

                                <div class="control-group form-group">
                                    <div class="controls">
                                        <asp:CheckBox ID="cbCondition" runat="server" OnCheckedChanged="cbCondition_CheckedChanged" AutoPostBack="true" />
                                        <asp:LinkButton ID="lnkConditions" runat="server" Text="Conditions" data-toggle="modal" data-target="#mesConditions" />
                                    </div>

                                </div>
                                <asp:LinkButton ID="lnkAnnuler" Text="Annuler" runat="server" CssClass="btn btn-default" />
                                <asp:LinkButton ID="lnkEnvoyer" Text="Envoyer" runat="server" CssClass="btn btn-default" CommandName="Update" Enabled="false" />

                                <!-- Modal Termes et conditions-->
                                <div class="modal fade" id="mesConditions" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Termes et conditions</h4>
                                            </div>
                                            <div class="modal-body">
                                                bla bla bla...
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                                                <asp:LinkButton ID="lnkAcccepter" runat="server" CssClass="btn btn-primary" Text="Accepter" OnClick="lnkAcccepter_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Fin Termes et condition-->
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="cbCondition" />
                            </Triggers>
                        </asp:UpdatePanel>

                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>

    </div>
    
</asp:Content>
