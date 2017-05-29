<%@ Page Language="C#" MasterPageFile="~/view/_masterpage/bodyup.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="bodyup.view.relatorio.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
	<%= "<link rel='stylesheet' href='http" + (Request.IsSecureConnection ? "s" : "") + "://" + Request.ServerVariables["SERVER_NAME"] + ":" + Request.ServerVariables["SERVER_PORT"] + (Request.ApplicationPath != "/" ? Request.ApplicationPath : "") + "/view/_style/bodyup.relatorio.index.css' />"%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">

	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>

			<div id="titulo">
				<div id="titulo2">Relatórios</div>
			</div>

			<div id="col1_1">
				
				<div class="window1">
					<div class="windowtop">Relatórios Gerenciais</div>
					<div class="windowbody">
					
						<asp:RadioButtonList ID="RadioButtonListRelatorio" runat="server" AppendDataBoundItems="true">
							<asp:ListItem Text="Lista de Alunos" Value="1" />
							<asp:ListItem Text="Lista de Aniversariantes por Mês" Value="2" />
							<asp:ListItem Text="Lista de Alunos Devedores" Value="3" />
							<asp:ListItem Text="Lista de Alunos por Atividade" Value="4" />
						</asp:RadioButtonList>
					
						<div class="botao">
							<asp:Button ID="ButtonOk" runat="server" Text="Abrir Relatório Selecionado" OnClick="ButtonOk_Click" />
						</div>
			               
					</div>
					<div class="windowbottom">&nbsp;</div>
				</div>
				
			</div>
			
			<div class="wrapper"><!-- faz com que o div middle fique do mesmo tamanho vertical do maior dos N divs de coluna --></div>
    
		</ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>