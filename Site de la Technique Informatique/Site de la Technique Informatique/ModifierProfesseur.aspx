﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifierProfesseur.aspx.cs" Inherits="Site_de_la_Technique_Informatique.ModifierProfesseur" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Css/Inscription.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta content="IE=edge" http-equiv="X-UA-Compatible" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="A basic example of Cropper." />
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, jQuery, image cropping, web development" />
    <meta name="author" content="Fengyuan Chen" />
    <title>Cropper</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link href="Cropper/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Cropper/css/cropper.css" rel="stylesheet" />
    <link href="Cropper/css/docs.css" rel="stylesheet" />
    
    <link rel="stylesheet" href="../Css/Inscription.css" />
    
    <script type="text/javascript">
        function openModal() {
            $('#myModal').modal('show');
        }
    </script>
    <script type="text/javascript">
        function copieImgData() {
            document.getElementById("<%=ImgExSrc.ClientID%>").value = ContentPlaceHolder1_lvProfesseur_showDataURL_0.src;
        }
    </script>
    <script type="text/javascript">
        window.transfertDataImg = function (dataURL) {
            $("#ContentPlaceHolder1_lvProfesseur_showDataURL_0").attr("src", dataURL);
        };
    </script>
    <script type="text/javascript">
        window.closeModal = function () {
            $('#maPhotoProfile').modal('hide');
        };
       function closeDivs() {
            document.getElementById("ContentPlaceHolder1_divSuccess").style.visibility = "hidden";
            document.getElementById("ContentPlaceHolder1_divWarning").style.visibility = "hidden";
       };
       function keepTab() {
           document.getElementById("aDelete").click();
       };
       
    </script>
    <!-- jQuery -->
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:HiddenField runat="server" ID="ImgExSrc" />
    <asp:ScriptManagerProxy ID="smProxy" runat="server" />

    <div class="container">
        <ul class="nav nav-tabs">
            <li role="presentation" class="active"><a href="#informations" id="aInfos" aria-controls="informations" role="tab" data-toggle="tab" onclick="closeDivs()">Informations générales</a></li>
            <li role="presentation" class="" ><a href="#cours" id="aCours" aria-controls="cours" role="tab" data-toggle="tab" onclick="closeDivs()">Mes Cours</a></li>
            <li role="presentation" class=""><a href="#delete" id="aDelete" aria-controls="cours" role="tab" data-toggle="tab" onclick="closeDivs()">Supprimer mon profil</a></li>
        </ul>

        <div class="row row-centered">
            <h2>Modifier mon profil</h2>
        </div>

        <div class="tab-content">

            <div class="row">
                <div class="col-md-3 col-md-offset-8" style="position:absolute">
                <div class="alert alert-success" runat="server" id="divSuccess"  >
                    <p>Les modifications ont été effectuées.</p>
                </div>
                    </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-md-offset-8" style="position:absolute; ">
                <div class="alert alert-warning" runat="server" id="divWarning"  >
                    <p>Veuillez porter attention à ces champs:</p><br/>
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </div>
                    </div>
            </div>

            <div role="tabpanel" class="tab-pane fade in active" id="informations">
                <div class="row row-centered">
                    <h3>Informations générales</h3>
                    <asp:ListView ID="lvProfesseur" runat="server"
                        ItemType="Site_de_la_Technique_Informatique.Model.Professeur"
                        SelectMethod="lvProfesseur_GetData"
                        UpdateMethod="updateProfesseur">

                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />

                        </LayoutTemplate>

                        <EmptyDataTemplate>
                            QUI ES-TU, QUE VIENS-TU FAIRE ICI?
                        </EmptyDataTemplate>

                        <ItemTemplate>
                            <div class="row row-centered">
                                <div class="col-md-5 col-centered">
                                    <div class="control-group form-group">
                                        <div class="controls">
                                            <label>Courriel:</label>
                                            <asp:TextBox runat="server" ID="txtCourriel" CssClass="form-control" Text='<%#BindItem.courriel %>'></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row row-centered">
                                <div class="col-md-5 col-centered">
                                    <div class="control-group form-group">
                                        <div class="controls">
                                            <label>Texte de présentation:</label>
                                            <asp:TextBox runat="server" ID="txtPresentation" TextMode="MultiLine" CssClass="form-control" Text='<%#BindItem.presentation %>' MaxLength="2000"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="modif-photo">
                                <div class="row row-centered">
                                    <div class="col-md-5 col-centered">
                                        <div class="img-thumbnail img-photo preview-photo">

                                            <asp:Image ID="showDataURL" runat="server" ImageUrl='<%#Eval ("pathPhotoProfil", "~/Photos/Profils/{0}") %>' Width="125" Height="125" />
                                        </div>
                                        <div class="div-btnChangerPhoto">
                                            <asp:LinkButton ID="lnkProfilePhoto" runat="server" Text="Changer la photo du profil" CssClass="btn btn-primary btnChangerPhoto" data-toggle="modal" data-target="#maPhotoProfile" />

                                        </div>


                                        <div class="modal" id="maPhotoProfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="myModalLabelProfile">Photo profil</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <iframe runat="server" id="ifrImage" src='<%=".."+Request.ApplicationPath +"/Jquery/Cropper/Cropper.aspx"%>' width="570" height="625" scrolling="no" frameborder="0"></iframe>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                    </div>
                                </div>
                            </div>

                            <div class="row row-centered">
                                <div class="col-md-5 col-centered">
                                    <div class="control-group form-group">
                                        <div class="controls">
                                            <label>Description de la photo:</label>
                                            <asp:TextBox runat="server" ID="txtDescPhoto" TextMode="MultiLine" CssClass="form-control" Text='<%#BindItem.photoDescription  %>' MaxLength="500"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row row-centered" style="margin-bottom: 20px;">
                                <div class="col-md-1 col-md-push-2 col-centered">
                                    <asp:LinkButton ID="lnkSauvegarderModifs" Text="Sauvegarder" runat="server" CssClass="btn btn-default" Style="float: right;" CommandName="Update" OnClientClick="copieImgData()" />
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:ListView>

                    <div class="row row-centered">
                        <h4>Changer mon mot de passe</h4>
                    </div>
                    <div class="row row-centered">
                        <div class="col-md-5 col-centered">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Ancien mot de passe:</label>
                                    <asp:TextBox runat="server" ID="txtAncienMp" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row row-centered">
                        <div class="col-md-5 col-centered">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Nouveau mot de passe:</label>
                                    <asp:TextBox runat="server" ID="txtNouveauMp" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row row-centered">
                        <div class="col-md-5 col-centered">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Confirmer le nouveau mot de passe:</label>
                                    <asp:TextBox runat="server" ID="txtNouveauMpConfirm" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row row-centered" style="margin-bottom: 20px;">
                        <div class="col-md-1 col-md-push-2 col-centered">
                            <asp:LinkButton ID="lnkSaveNewPassword" runat="server" CssClass="btn btn-default" Style="float: right;" Text="Sauvegarder" OnClick="lnkSaveNewPassword_Click"></asp:LinkButton>
                        </div>
                    </div>
                </div>

                

            </div>
            <div role="tabpanel" class="tab-pane fade" id="cours">
                <p>test2</p>


            </div>
            <div role="tabpanel" class="tab-pane fade" id="delete">
                <div class="row-centered">
                    <div class="col-md-8 col-centered" style="text-align: center">
                        <h3>déjà tanné d'être ici? :'(</h3>
                        <p>Si vous désactivez votre profil, vous ne pourrez plus vous connecter. Êtes-vous certain de vouloir désactiver votre compte?</p>
                    </div>
                </div>
                <div class="row-centered" style="margin-top: 25px;">
                    <div class="col-md-1 col-md-push-5">
                        <asp:LinkButton ID="lnkDeleteProfil" runat="server" Text="Désactiver mon profil" CssClass="btn btn-danger" OnClick="lnkDeleteProfil_Click" />
                    </div>
                </div>
            </div>
        </div>






    </div>

    <div class="modal fade" id="popupDelete" role="dialog" aria-labelledby="popupDelete" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upDelete" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">
                                <asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                          

                            <div class="container-fluid">
                                  <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                                <div class="row" style="margin-top:5px;">
                                    <div class="col-md-6 ">
                                        <div class="control-group form-group">
                                            <div class="controls">
                                                <label>Mot de passe:</label>
                                                <asp:TextBox runat="server" ID="txtDeletePass" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                <div class="row">
                                    <div class="col-md-push-8 col-md-1" >
                                        <asp:LinkButton ID="lnkDeletePass" runat="server" Text="Désactiver mon Compte" CssClass="btn btn-danger" OnClick="lnkDeletePass_Click"  ></asp:LinkButton>
                                    </div>
                                </div>
                                            
                                        
                                    </div>
                                </div>
                            

                        
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Annuler</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>


</asp:Content>
