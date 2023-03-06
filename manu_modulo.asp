<br>
<!--#include file="wpg_cnx.asp"-->
<!--#include file="funcoes.asp"-->
<%
session.LCID = 1046
'RECEBENDO CAMPOS DO FORMULÁRIO
opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")
modulo       =  request.form("modulo")
anexo       =  request.form("anexo")
curso        =  request.form("curso")
texto        =  request.form("texto")



if botao = "Incluir" then
' INCLUINDO OS DADOS RECEBIDOS NA TABELA

   sql = "insert into tb_modulo (ds_modulo,anexo,cd_curso,texto)"
   sql = sql & " values('"&modulo&"','"&anexo&"','"&curso&"','"&texto&"')"
   'response.write sql
   'response.end
   conexao.execute(sql)
%>
<script>
    alert("modulo incluído com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%
elseif botao = "Alterar" then
' ALTERANDO OS DADOS RECEBIDOS NA TABELA
    sql = "update tb_modulo set"
    sql = sql & " ds_modulo = '"&modulo&"',"
    sql = sql & " anexo = '"&anexo&"',"
    sql = sql & " cd_curso = '"&curso&"',"
    sql = sql & " texto = '"&texto&"'"
    sql = sql & " where cd_curso = "&cod
response.write sql
'response.end
    conexao.execute(sql)
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%
elseif opc <> "" then
' DELETANDO REGISTRO SELECIONADO
   cod = request.querystring("cod")
   sql = "delete from tb_modulo where cd_modulo="&cod
  'response.write sql
  'response.end
  conexao.execute(sql)
%>
<script>
    alert("modulo excluído com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%
end if
%>