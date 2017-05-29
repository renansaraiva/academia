<%@ Page Language="C#" MasterPageFile="~/view/_masterpage/bodyup.master" AutoEventWireup="true" CodeBehind="inserir.aspx.cs" Inherits="bodyup.view.aluno.inserir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
	<%= "<link rel='stylesheet' href='http" + (Request.IsSecureConnection ? "s" : "") + "://" + Request.ServerVariables["SERVER_NAME"] + ":" + Request.ServerVariables["SERVER_PORT"] + (Request.ApplicationPath != "/" ? Request.ApplicationPath : "") + "/view/_style/bodyup.aluno.inserir.css' />"%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">

	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>

			<div id="titulo">
				<div id="titulo2">Gerenciamento de Alunos - Inserção de Aluno</div>
			</div>
			
			<div id="col1_1">
				
				<div class="window1">
					<div class="windowtop">Inserção de Aluno</div>
					<div class="windowbody">
					
						<fieldset>
			
							<legend>
							Preencha os dados do aluno nos campos abaixo, e depois clique em "Confirmar"<br />
							Campos em <font color="darkred">vermelho</font> são de preenchimento obrigatório
							</legend>
							
							<label class="obrigatorio">
								Matrícula:
								<asp:TextBox ID="TextBoxMatricula" runat="server" Width="80px" MaxLength="10" onkeyup="jm_integermask(this);" />
							</label>
						    
							<label class="obrigatorio">
								CPF:
								<asp:TextBox ID="TextBoxCpf" runat="server" Width="90px" MaxLength="11" onkeyup="jm_integermask(this);" />
							</label>
						
							<label class="obrigatorio">
								Nome:
								<asp:TextBox ID="TextBoxNome" runat="server" Width="300px" />
							</label>
							
							<label class="obrigatorio">
								Endereço:
								<asp:TextBox ID="TextBoxEndereco" runat="server" Width="500px" />
							</label>
							
							<label class="obrigatorio">
								CEP:
								<asp:TextBox ID="TextBoxCep" runat="server" Width="70" MaxLength="8" onkeyup="jm_integermask(this);" />
							</label>
							
							<label class="obrigatorio">
								UF:
								<asp:DropDownList ID="DropDownListIdEstado" runat="server" Width="50" DataSourceID="SqlDataSourceListarEstado" DataTextField="Uf" DataValueField="Id" AppendDataBoundItems="true">
									<asp:ListItem />
								</asp:DropDownList>
							</label>
									
							<label class="obrigatorio">
								Telefone:
								<asp:TextBox ID="TextBoxTelefone" runat="server" Width="100" MaxLength="12" />
							</label>
							
							<label>
								E-mail:
								<asp:TextBox ID="TextBoxEmail" runat="server" Width="300" MaxLength="256" />
							</label>
							
							<label class="obrigatorio">
								Data Nasc.:
								<asp:TextBox ID="TextBoxDataNasc" runat="server" Width="100" MaxLength="10" />
							</label>
							
							<label class="obrigatorio">
								Atividade:
								<asp:DropDownList ID="DropDownListIdAtividade" runat="server" Width="150" DataSourceID="SqlDataSourceListarAtividade" DataTextField="Nome" DataValueField="Id" AppendDataBoundItems="true">
									<asp:ListItem />
								</asp:DropDownList>
							</label>
							
							<div class="botao">
								<asp:Button ID="ButtonConfirmar" runat="server" Text="Confirmar" OnClick="ButtonConfirmar_Click" />
								<asp:Button ID="ButtonCancelar" runat="server" Text="Cancelar" OnClick="ButtonCancelar_Click" />
							</div>			
						
						</fieldset>
					
					</div>
					<div class="windowbottom">&nbsp;</div>
				</div>
				
			</div>
			
			<div class="wrapper"><!-- faz com que o div middle fique do mesmo tamanho vertical do maior dos N divs de coluna --></div>
    
		</ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:SqlDataSource runat="server" id="SqlDataSourceListarEstado" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Estado]" />
    <asp:SqlDataSource runat="server" id="SqlDataSourceListarAtividade" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Atividade]" />

</asp:Content>