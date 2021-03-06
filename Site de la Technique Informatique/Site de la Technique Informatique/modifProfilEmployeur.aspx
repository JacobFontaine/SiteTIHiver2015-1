﻿<%--Cette classe permet aux étudiants de modifier leur profil (photo de profil, nom, prénom, courriel, mot de passe)
Écrit par Marie-Philippe Gill, Février 2015
Intrants: MasterPage
Extrants: --%>

<%-- CÉDRIC : 
    - Changer la photo de profil 
    - Changer l'email (codé, je n'ai pas pu tester cette partie, connexion non fonctionnelle)
    - Envoi du courriel de validation au changement de l'email 
    - Changement du mot de passe
    - Gestion des messages d'erreur? 

    Marie-Philippe: 
    - Changement du nom (Fonctionne)
    - Changement du prénom (fonctionne)
--%>

<%@ Page Title="Modification de votre profil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="modifProfilEmployeur.aspx.cs" Inherits="Site_de_la_Technique_Informatique.modifProfilEmployeur" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Css/Inscription.css" rel="stylesheet" />
    <!--Afficher les erreurs de input-->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".has-error").removeClass("has-error");
            $(".has-feedback").removeClass("has-feedback");
            var idValue = '<%=this.lvModifProfilEmployeur.ClientID%>';
            var IDS = JSON.parse('<%= this.idsEnErreurTab%>');
            var MSGS = '<%= this.msgsEnErreur%>';

            for (index = 0; index < IDS.length; ++index) {
                var id = IDS[index];
                var msg = MSGS[index];
                   
                var element ="dv" + id;

                $("#" + element).addClass("has-error");
                $("#" + element).addClass("has-feedback");
                if(id=="NouveauMotDePasse"){
                    element = "dvConfirmationNouveauMotDePasse";
                    $("#" + element).addClass("has-error");
                    $("#" + element).addClass("has-feedback");
                }

            }

        });
    </script>
    <!--ToolTips-->
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    <!--Modal-->
    <script type="text/javascript">
        function openModal() {
            $('#myModal').modal('show');
        }
    </script>

    <script type="text/javascript">
        function copieImgData() {
            document.getElementById("<%=ImgExSrc.ClientID%>").value = ContentPlaceHolder1_lvModifProfilEtudiant_showDataURL_0.src;
        }
    </script>
    <script type="text/javascript">
        window.transfertDataImg = function (dataURL) {
            $("#ContentPlaceHolder1_lvModifProfilEtudiant_showDataURL_0").attr("src", dataURL);
            document.getElementById("<%=ImgExSrc.ClientID%>").value = dataURL;
        };
    </script>
    <script type="text/javascript">
        window.closeModal = function () {
            $('#maPhotoProfile').modal('hide');
            $('#maPhotoProfile').modal('hide');
            $('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
        };
    </script>
    <!-- jQuery -->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField runat="server" ID="ImgExSrc" />
    <asp:ScriptManagerProxy ID="smProxy" runat="server" />
    <div class="container">
        <div class="col-lg-2"></div>
        <div class="col-lg-6 col-centered">

            <div class="container-fluid">

                <div class="control-group form-group">
                            <div class="controls">
                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                <asp:ListView ID="lvModifProfilEmployeur" runat="server"
                    ItemType="Site_de_la_Technique_Informatique.Model.Employeur"
                    SelectMethod="SelectEmployeur"
                    UpdateMethod="UpdateEmployeur">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </LayoutTemplate>
                    <EmptyDataTemplate>
                        <table class="emptyTable">
                            <tr>
                                <td>Lol
                                </td>
                                <td>Cet employeur n'existe pas.
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="row row-centered">
                            <div class="col-lg-9 col-centered">
                                <h1>Modification du profil</h1>
                            </div>
                        </div>

                        <div class="control-group form-group" id="divNom">
                            <div class="controls">
                                <label>Nom de l'entreprise:</label><br />
                                <asp:TextBox ID="txtNom" runat="server" placeholder="Nom" Text='<%#BindItem.nomEmployeur %>' CssClass="form-control"/>

                            </div>
                        </div>

                        <div class="control-group form-group" id="dvCourriel">
                            <div class="controls">
                                <label>Courriel:</label>
                                <asp:TextBox ID="txtCourriel" runat="server" CssClass="form-control" placeholder="courriel@exemple.qc.ca" Text='<%#BindItem.courriel %>' />
                                <asp:Label ID="lblCourriel" runat="server" Text="" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-8">
                                <h4>Changer votre mot de passe</h4>
                            </div>
                        </div>
                        <div class="control-group form-group" id="dvMotDePasse">
                            <div class="controls">
                                <label>Mot de passe actuel:</label>
                                <asp:TextBox ID="txtMotDePasse" runat="server" CssClass="form-control" Text="" TextMode="Password" />
                                <asp:Label ID="lblMotDePasse" runat="server" Text="" />
                            </div>
                        </div>
                        <div class="control-group form-group" id="dvNouveauMotDePasse">
                            <div class="controls">
                                <label>Nouveau mot de passe:</label>
                                <asp:TextBox ID="txtNouveauMotDePasse" runat="server" CssClass="form-control" Text="" TextMode="Password" />
                                <asp:Label ID="lblNouveauMotDePasse" runat="server" Text="" />
                            </div>
                        </div>
                        <div class="control-group form-group" id="dvConfirmationNouveauMotDePasse">
                            <div class="controls">
                                <label>Confirmation du nouveau mot de passe:</label>
                                <asp:TextBox ID="txtConfirmationNouveauMotDePasse" runat="server" CssClass="form-control" Text="" TextMode="Password" />
                                <asp:Label ID="lblConfirmationNouveauMotDePasse" runat="server" Text="" />
                            </div>
                        </div>
                        <div class="row"></div>
                        <div class="col-lg-offset-8 col-lg-8 ">
                            <asp:Button ID="btnSave" runat="server" Text="Sauvegarder" CssClass="btn btn-primary" CommandName="Update" OnClientClick="copieImgData()" />
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>
</asp:Content>
