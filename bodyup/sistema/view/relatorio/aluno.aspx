<%@ Page Language="C#" MasterPageFile="~/view/_masterpage/bodyup.master" AutoEventWireup="true" CodeBehind="aluno.aspx.cs" Inherits="bodyup.view.relatorio.aluno" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
	<%= "<link rel='stylesheet' href='http" + (Request.IsSecureConnection ? "s" : "") + "://" + Request.ServerVariables["SERVER_NAME"] + ":" + Request.ServerVariables["SERVER_PORT"] + (Request.ApplicationPath != "/" ? Request.ApplicationPath : "") + "/view/_style/bodyup.relatorio.aluno.css' />"%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">

	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>

			<div id="titulo">
				<div id="titulo2">Relatórios - Lista de Alunos</div>
			</div>
			
			<div id="col1_1">
			
				<div class="window1">
					<div class="windowtop">Filtro</div>
					<div class="windowbody">
					
						<fieldset>
		        		
							<label>
								Matricula:
								<asp:TextBox ID="TextBoxFiltroMatricula" runat="server" Width="80px" MaxLength="10" onkeyup="jm_integermask(this);"/>
							</label>
							
							<label>
								CPF:
								<asp:TextBox ID="TextBoxFiltroCpf" runat="server" Width="90px" MaxLength="11" onkeyup="jm_integermask(this);" />
							</label>
							
							<label>
								Nome:
								<asp:TextBox ID="TextBoxFiltroNome" runat="server" Width="100px" />
							</label>
			
							<label>
								Data Nasc.:
								<asp:TextBox ID="TextBoxFiltroDataNasc" runat="server" Width="100px" MaxLength="10" />
							</label>
		        			
							<label>
								Atividade:
								<asp:TextBox ID="TextBoxFiltroNomeAtividade" runat="server" />
							</label>
			                
						</fieldset>
			            
						<div class="botao">
							<asp:Button ID="ButtonFiltrar" runat="server" Text="Filtrar" OnClick="ButtonFiltrar_Click" />
							<asp:Button ID="ButtonMostrarTodos" runat="server" Text="Mostrar Todos" OnClick="ButtonMostrarTodos_Click" />
						</div>
					
					</div>
					<div class="windowbottom">&nbsp;</div>
				</div>
			
			</div>

			<div id="col1_1">
				
				<div class="window1">
					<div class="windowtop">Lista de Alunos</div>
					<div class="windowbody">
					
						<rsweb:ReportViewer ID="ReportViewer1" runat="server" ShowFindControls="False" ShowRefreshButton="False" Width="100%" Height="300px">
							<LocalReport ReportPath="view/relatorio/aluno.rdlc">
								<DataSources>
									<rsweb:ReportDataSource DataSourceId="SqlDataSourceListarAluno" Name="DefaultDataSet" />
								</DataSources>
							</LocalReport>
						</rsweb:ReportViewer>
			               
					</div>
					<div class="windowbottom">&nbsp;</div>
				</div>
				
			</div>
			
			<div class="wrapper"><!-- faz com que o div middle fique do mesmo tamanho vertical do maior dos N divs de coluna --></div>
    
		</ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:SqlDataSource runat="server" id="SqlDataSourceListarAluno" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ViewAluno]" />

</asp:Content>