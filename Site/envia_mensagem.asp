<!--#include file="wpg_cnx.asp"-->  
<%
'recebendo os parametros enviado pelo form através do Request.form


nome     = request.form("nome")
email    = request.form("email")
assunto  = request.form("assunto")
mensagem = request.form("mensagem")

'inserir no bando de dados através do INSERT

sql = "insert into tb_contato (nome,assunto,email,mensagem) values ('"&nome&"','"&assunto&"','"&email&"','"&mensagem&"')"
'response.write sql
'response.end
conexao.execute(sql)

' enviar mensagem e redirecionar para a index
%>
<script>
  alert("Mensagem enviada com sucesso, em breve entraremos em contato.")
  parent.location = "index.asp"
</script>