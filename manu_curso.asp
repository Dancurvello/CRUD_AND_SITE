<br>
<!--#include file="wpg_cnx.asp"-->
<!--#include file="funcoes.asp"-->
<!--#include file="valida.asp"-->
<%
session.LCID = 1046
'RECEBENDO CAMPOS DO FORMULÁRIO
opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")
professor       =  request.form("professor")
ativo       =  request.form("ativo")
resumo        =  request.form("resumo")
curso        =  request.form("curso")



if botao = "Incluir" then
' INCLUINDO OS DADOS RECEBIDOS NA TABELA

   sql = "insert into tb_curso (ds_curso,ativo,cd_professor,resumo)"
   sql = sql & " values('"&curso&"',"&ativo&","&professor&",'"&resumo&"')"
   'response.write sql
   'response.end
   conexao.execute(sql)
%>
<script>
    alert("curso incluído com sucesso!")
    parent.location = "cst_curso.asp"
</script>
<%
elseif botao = "Alterar" then
' ALTERANDO OS DADOS RECEBIDOS NA TABELA
    sql = "update tb_curso set"
    sql = sql & " ds_curso = '"&curso&"',"
    sql = sql & " ativo = '"&ativo&"',"
    sql = sql & " cd_professor = '"&professor&"',"
    sql = sql & " resumo = '"&resumo&"'"
    sql = sql & " where cd_curso = "&cod
response.write sql
'response.end
    conexao.execute(sql)
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_curso.asp"
</script>
<%
elseif opc <> "" then
' DELETANDO REGISTRO SELECIONADO
   cod = request.querystring("cod")
   sql = "delete from tb_curso where cd_curso="&cod
  'response.write sql
  'response.end
  conexao.execute(sql)
%>
<script>
    alert("curso excluído com sucesso!")
    parent.location = "cst_curso.asp"
</script>
<%
end if
%>