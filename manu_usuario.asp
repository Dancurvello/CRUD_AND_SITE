<br>
<!--#include file="wpg_cnx.asp"-->
<!--#include file="funcoes.asp"-->
<%
session.LCID = 1046
'RECEBENDO CAMPOS DO FORMULÁRIO
opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")
usuario       =  request.form("usuario")
senha       =  request.form("senha")



if botao = "Incluir" then
' INCLUINDO OS DADOS RECEBIDOS NA TABELA

   sql = "insert into tb_usuario (ds_usuario,senha)"
   sql = sql & " values('"&usuario&"','"&senha&"')"
   'response.write sql
   'response.end
   conexao.execute(sql)
%>
<script>
    alert("usuario incluido com sucesso!")
    parent.location = "cst_usuario.asp"
</script>
<%
elseif botao = "Alterar" then
' ALTERANDO OS DADOS RECEBIDOS NA TABELA
    sql = "update tb_curso set"
    sql = sql & " ds_usuario = '"&usuario&"',"
    sql = sql & " senha = '"&senha&"'"
    sql = sql & " where cd_curso = "&cod
response.write sql
'response.end
    conexao.execute(sql)
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_usuario.asp"
</script>
<%
elseif opc <> "" then
' DELETANDO REGISTRO SELECIONADO
   cod = request.querystring("cod")
   sql = "delete from tb_usuario where cd_usuario="&cod
  'response.write sql
  'response.end
  conexao.execute(sql)
%>
<script>
    alert("usuario excluído com sucesso!")
    parent.location = "cst_usuario.asp"
</script>
<%
end if
%>