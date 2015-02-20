﻿<%@ Page Title="Nouvelles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nouvelles.aspx.cs" Inherits="Site_de_la_Technique_Informatique.Nouvelles" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Header Carousel -->
    <div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Nouvelles
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Default.aspx">Accueil</a>
                    </li>
                    <li class="active">Nouvelles</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <!-- Content Row -->
        <div class="row">
            <!-- Sidebar Column -->
            <div class="col-md-3">
                <div class="list-group">
                    <a href="default.aspx" class="list-group-item">Accueil</a>
                    <a href="QuiSommesNous.aspx" class="list-group-item">Nouvelles</a>
                    <a href="listeOffresEmploi.aspx" class="list-group-item">Offre d'emploi</a>
                    <a href="#" class="list-group-item">Parutions médias</a>
                    <a href="FAQ.aspx" class="list-group-item">FAQ</a>
                    <a href="#" class="list-group-item">Témoignages</a>
                </div>
            </div>
            <!-- Content Column -->
            <div class="col-md-9">
                <asp:ListView ID="lviewNouvelles" runat="server"
                    ItemType="Site_de_la_Technique_Informatique.Model.Nouvelle"
                    SelectMethod="getNouvelles">
                    <ItemTemplate>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse<%# Item.IDNouvelle %>"><%# Item.titreNouvelle %></a>
                                </h4>
                            </div>
                            <div id="collapse<%# Item.IDNouvelle %>" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p><%# Item.dateNouvelle.ToLongDateString() %></p>
                                    
                                    <p><%# Item.texteNouvelle %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
               
            </div>
            <!-- /.row -->
            <hr />
        </div>
        
    </div>
    <!-- /.container -->

</asp:Content>
