<%
session.lcid = 1046

'Conectar ao banco de dados MySQL
'Criando o objeto de conexão

Set Conexao = Server.CreateObject("ADODB.Connection")
Conexao.Open = "Provider=MSDASQL.1;Password=@B4ncosql;Persist Security Info=True;User ID=root;Data Source=SistemaCadastro;Initial Catalog=cursoaspclassico"
Response.Write "<center><b>Conectado com sucesso ao banco de dados</center>"


%>