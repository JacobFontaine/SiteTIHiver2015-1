﻿<%@ Page Title="Foire aux questions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Site_de_la_Technique_Informatique.FAQ" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Carousel -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Foire aux questions (FAQ)
                    
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Accueil</a>
                    </li>
                    <li class="active">Foire aux questions</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-lg-12">
                <asp:ListView ID="lviewFAQ" runat="server"
                    ItemType="Site_de_la_Technique_Informatique.Model.FAQ"
                    SelectMethod="SelectFAQ">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse<%# Eval("IDFAQ") %>" runat="server">
                                        <asp:Label ID="lblQuestionFAQ" runat="server" Text='<%# BindItem.texteQuestion %>'></asp:Label>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse<%# Eval("IDFAQ").ToString() %>" class="panel-collapse collapse" runat="server">
                                    <div class="panel-body">
                                        <asp:Label ID="lblReponseFAQ" runat="server" Text='<%# BindItem.texteReponse %>'></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
        </div>
        <!-- /.panel-group -->



</asp:Content>
