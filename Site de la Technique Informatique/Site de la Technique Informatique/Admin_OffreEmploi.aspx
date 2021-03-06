﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="Admin_OffreEmploi.aspx.cs" Inherits="Site_de_la_Technique_Informatique.Admin_OffreEmploi" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<link href="Css/AdministrateurLesOffresEmploi.css" rel="stylesheet" />

        <h1 class="page-header">Offres d'emploi</h1>

  

        <asp:Button ID="btnVoirOffreEmploiNonValide" runat="server" Text="Offres d'emploi non-validés" CssClass="btn btnOffreEmploiSelectionne" OnClick="VoirOffreNonValide_Click" />
        <asp:Button ID="btnVoirOffreEmploiValide" runat="server" Text="Offres d'emploi validés" CssClass="btn btn-primary" OnClick="VoirOffreValide_Click" />
        

                <asp:ListView ID="lviewOffresDEmploi" runat="server"
                        ItemType="Site_de_la_Technique_Informatique.Model.OffreEmploi"
                        SelectMethod="GetLesOffresDEmploi"
                         OnItemDataBound="lviewOffresDEmploiDataBound">

                        <LayoutTemplate>
                            <div>
                                <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                            </div>
                        </LayoutTemplate>

                        <ItemTemplate>

        <!-- Page Heading/Breadcrumbs -->
        <div>
            
            <div class="col-lg-12">
                <h1 class="page-header">
            <asp:Label ID="lblTitreOffre" runat="server" Font-Size="20" Text='<%# Item.titreOffre %>'></asp:Label>
                </h1>
            </div>
        </div>

        <div class="row">
            
            <div class="col-lg-12">
                
                <div class="col-lg-6">
                    
                        
                     <asp:Label ID="lblAdresseVille" runat="server" Font-Size="14" Text='<%# Item.adresseTravail %>'></asp:Label>
            <br />
            <asp:Label ID="lblNbHeureSemaine" runat="server" Font-Size="14" Text='<%# Item.nbHeureSemaine + " heures par semaine" %>'></asp:Label>
            <br />

            <div runat="server" id="divDateExpiration" visible='<%# PasAfficherSiNull(Item,"dateExpiration") %>'>
                <asp:Label ID="lblDateExpiration" runat="server" Font-Size="14" Text='<%# "Expiration offre: " + String.Format("{0:dd/MM/yyyy}",Item.dateExpiration) %>'></asp:Label>
            <br />
                </div>

            <asp:Label ID="lblDateDebutOffre" runat="server" Font-Size="14" Text='<%# "Début offre: " + String.Format("{0:dd/MM/yyyy}",Item.dateDebutOffre) %>'></asp:Label>
            <br />
            <asp:Label ID="lblSalaire" runat="server" Font-Size="14" Text='<%# Item.salaire + " $/heure" %>'></asp:Label>
            <br />
            <asp:Label ID="lblNoTelephone" runat="server" Font-Size="14" Text='<%# "No de téléphone: " + Item.noTelephone %>'></asp:Label>

            <asp:Label ID="lblNoPoste" runat="server" Font-Size="14" Text='<%#  "  Ext: (" + Item.noPoste + ")" %>' Visible='<%# PasAfficherSiNull(Item,"noPoste") %>'></asp:Label>
            <br />
                        
            <div runat="server" id="divNoTelecopieur" visible='<%# PasAfficherSiNull(Item,"noTelecopieur") %>'>

            <asp:Label ID="lblNoTelecopieur" runat="server" Font-Size="14" Text='<%# "No de télécopieur: " + Item.noTelecopieur %>'></asp:Label>
            <br />

             </div>

                        
            <asp:Label ID="lblCourrielOffre" runat="server" Font-Size="14" Text='<%# "Courriel: " + Item.courrielOffre %>'></asp:Label>
            <br />
            <asp:Label ID="lblPersonneRessource" runat="server" Font-Size="14" Text='<%# "Personne resource: " + Item.personneRessource %>'></asp:Label>
                        <br />
             <div runat="server" id="divPDF" visible='<%# PasAfficherSiNull(Item,"pathPDFDescription") %>'>

            <asp:LinkButton ID="lnkPDF" Text="Version PDF" runat="server" CommandArgument='<%# Item.pathPDFDescription %>' OnClick="lnkPDF_Click"></asp:LinkButton>
                        <br />
                 
             </div>

                    </div>
                <div class="col-lg-6" style="font-weight:bold;">
            <asp:Label ID="lblDescriptionOffre" runat="server" Font-Size="14" Text='<%# Item.descriptionOffre %>'></asp:Label>
                </div>
                
            </div>
        </div>
                            <div id="divPourOffrePasValide" runat="server" visible='<%# VisibiliteBoutonValidation(true) %>' style="clear:both;">

                            <div style="float:left; padding-left:15px">
                                <br />
                                <asp:Button ID="btnAccepterOffre" runat="server" Text="Accepter" CssClass="btn btn-primary" CommandArgument='<%# Item.IDOffreEmploi %>' OnClick="AccepterOffreEmploi_Click" />
                                <asp:Button ID="btnRefuserOffre" runat="server" Text="Refuser" CssClass="btn btn-danger" CommandArgument='<%# Item.IDOffreEmploi %>' OnClick="SupprimerOffreEmploi_Click"/>

                            </div>
                            </div>
                                </div>


                            <div id="divPourOffreValide" runat="server" visible='<%# VisibiliteBoutonValidation(false) %>' style="clear:both;">

                            <div style="float:right; padding-right:35px">

                            <asp:Button ID="btnDeleterOffre" runat="server" Text="Supprimer l'offre d'emploi" CssClass="btn btn-danger" CommandArgument='<%# Item.IDOffreEmploi %>' OnClick="SupprimerOffreEmploi_Click"/>

                            </div>
                                </div>


                            <div style="clear:both; height:10px;">
                                
                            </div>
                        </ItemTemplate>

            <EmptyDataTemplate>
        <div>
            <div style="width:100%; text-align:center; padding-top:20px;">
                       <asp:Label ID="lblPasDeOffreIci" runat="server" Text="Il n'y a pas d'offre d'emploi pour le moment" style="font:bold; font-size:large"></asp:Label>
                </div>
        </div>
                
                </EmptyDataTemplate>
            
        </asp:ListView>

        <div style="text-align:center; width:100%;">
            
            <asp:DataPager ID="dataPagerDesOffresEmplois" runat="server" PagedControlID="lviewOffresDEmploi"
                            PageSize="4">
                            <Fields>
                                <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowNextPageButton="False" PreviousPageText="<<" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ShowLastPageButton="False" ShowPreviousPageButton="False" NextPageText=">>" />
                            </Fields>
                        </asp:DataPager>
                </div>

    <asp:HiddenField ID="hfieldVoirOffreValideOuNon" runat="server" Value="VoirNonValidé" />

</asp:Content>