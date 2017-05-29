<%@ Page Language="C#" MasterPageFile="~/view/_masterpage/bodyup.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="bodyup.view.aluno.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" Runat="Server">
	<%= "<link rel='stylesheet' href='http" + (Request.IsSecureConnection ? "s" : "") + "://" + Request.ServerVariables["SERVER_NAME"] + ":" + Request.ServerVariables["SERVER_PORT"] + (Request.ApplicationPath != "/" ? Request.ApplicationPath : "") + "/view/_style/bodyup.aluno.index.css' />"%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">

	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>

			<div id="titulo">
				<div id="titulo2">Gerenciamento de Alunos</div>
			</div>

			<div id="col2_1">
				
				<div class="window2">
					<div class="windowtop">Lista de Alunos</div>
					<div class="windowbody">
				    
						<asp:GridView ID="GridViewAluno" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" EmptyDataText="Não existem alunos cadastrados" DataSourceID="SqlDataSourceListarAluno" DataKeyNames="Id" PageSize="20" OnRowCreated="GridViewAluno_RowCreated" CssClass="gridview">
							<Columns>
								
								<asp:CommandField ShowSelectButton="True" />
								
								<asp:TemplateField HeaderText="Mat." SortExpression="Matricula">
									<HeaderStyle CssClass="headerstyle" Width="60px" />
									<ItemStyle CssClass="itemstyle" />
									<ItemTemplate><%# Eval("Matricula") %></ItemTemplate>
								</asp:TemplateField>
								
								<asp:TemplateField HeaderText="Nome" SortExpression="Nome">
									<HeaderStyle CssClass="headerstyle" Width="200px" />
									<ItemStyle CssClass="itemstyle" />
									<ItemTemplate><%# Eval("Nome") %></ItemTemplate>
								</asp:TemplateField>
								
								<asp:TemplateField HeaderText="Atividade" SortExpression="NomeAtividade">
									<HeaderStyle CssClass="headerstyle" Width="110px" />
									<ItemStyle CssClass="itemstyle" />
									<ItemTemplate><%# Eval("NomeAtividade") %></ItemTemplate>
								</asp:TemplateField>
								
								<asp:TemplateField HeaderText="Nasc." SortExpression="DataNasc">
									<HeaderStyle CssClass="headerstyle" Width="70px" />
									<ItemStyle CssClass="itemstyle" />
									<ItemTemplate><%# Eval("DataNasc", "{0:dd/MM/yyyy}") %></ItemTemplate>
								</asp:TemplateField>
								
							</Columns>
							<PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" PageButtonCount="5" />
							<PagerStyle CssClass="pagerstyle" />
							<SelectedRowStyle CssClass="selecteditemstyle" />
							<EmptyDataRowStyle CssClass="emptydatarowstyle" />
						</asp:GridView>
			            
						<div class="botao">
							<asp:Button ID="ButtonInserir" runat="server" Text="Inserir" OnClick="ButtonInserir_Click" />
						</div>
			               
					</div>
					<div class="windowbottom">&nbsp;</div>
				</div>
			    
				<br />
			    
				<div class="window2">
					<div class="windowtop">Lista de Alunos</div>
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
			
			<div id="col2_2">
				
				<asp:Repeater ID="RepeaterAluno" runat="server" DataSourceID="SqlDataSourceObterAluno">
					<ItemTemplate>
			    
						<div class="window2">
							<div class="windowtop">Aluno Selecionado</div>
							<div class="windowbody">		
				    
								<div class="campo">
									<div class="titulo">Matricula:</div>
									<div class="valor"><%# Eval("Matricula") %></div>
								</div>
						        
								<div class="campo">
    								<div class="titulo">CPF:</div>
    								<div class="valor"><%# Eval("Cpf") %></div>
								</div>
								
								<div class="campo">    
									<div class="titulo">Nome:</div>
									<div class="valor"><%# Eval("Nome") %></div>
								</div>
				                
								<div class="campo">    
									<div class="titulo">Endereço:</div>
									<div class="valor"><%# Eval("Endereco") %></div>
								</div>
							        				    
								<div class="campo">
									<div class="titulo">CEP:</div>
									<div class="valor"><%# Eval("Cep") %></div>
								</div>
							    
								<div class="campo">    				    
									<div class="titulo">Estado:</div>
									<div class="valor"><%# Eval("UfEstado") %></div>
								</div>
							        				
								<div class="campo">    				    
									<div class="titulo">Telefone:</div>
									<div class="valor"><%# Eval("Telefone") %></div>
								</div>
							    
								<div class="campo">    				    
									<div class="titulo">E-mail:</div>
									<div class="valor"><%# Eval("Email") %></div>
								</div>
							    
								<div class="campo">    				    
									<div class="titulo">Data Nasc.:</div>
									<div class="valor"><%# Eval("DataNasc", "{0:dd/MM/yyyy}") %></div>
								</div>
							    
								<div class="campo">    				    
									<div class="titulo">Atividade:</div>		        
									<div class="valor"><%# Eval("NomeAtividade") %></div>
								</div>
							    
								<div class="botao">
									<asp:Button ID="ButtonAlterar" runat="server" Text="Alterar" OnClick="ButtonAlterar_Click" />
									<asp:Button ID="ButtonExcluir" runat="server" Text="Excluir" OnClick="ButtonExcluir_Click" />
								</div>	
					    			    
							</div>
							<div class="windowbottom">&nbsp;</div>
						</div>
			    
					</ItemTemplate>
				</asp:Repeater>
				
			</div>
			
			<div class="wrapper"><!-- faz com que o div middle fique do mesmo tamanho vertical do maior dos N divs de coluna --></div>
    
		</ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:SqlDataSource runat="server" id="SqlDataSourceListarAluno" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ViewAluno]" />
	<asp:SqlDataSource runat="server" id="SqlDataSourceObterAluno" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ViewAluno] WHERE ([Id] = @id)">
		<SelectParameters>
			<asp:ControlParameter ControlID="GridViewAluno" Name="id" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

</asp:Content>