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
nome        =  request.form("nome")
cpf        =  request.form("cpf")
email        =  request.form("email")
nascimento        =  request.form("nascimento")
endereco      =  request.form("endereco")
cidade      =  request.form("cidade")
curriculo        =  request.form("curriculo")
foto       =  request.form("foto")


if botao = "Incluir" then
' INCLUINDO OS DADOS RECEBIDOS NA TABELA

   sql = "insert into tb_professor (ds_professor,cpf,data_nascimento,endereco,cidade,curriculo,email,foto)"
   sql = sql & " values('"&nome&"','"&cpf&"','"&data_banco(nascimento)&"','"&endereco&"','"&cidade&"','"&curriculo&"','"&email&"','"&foto&"')"
   'response.write sql
   'response.end
   conexao.execute(sql)
%>
<script>
    alert("Professor incluído com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%
elseif botao = "Alterar" then
' ALTERANDO OS DADOS RECEBIDOS NA TABELA
    sql = "update tb_professor set"
    sql = sql & " ds_professor = '"&nome&"',"
    sql = sql & " cpf = '"&cpf&"',"
    sql = sql & " data_nascimento = '"&data_banco(nascimento)&"',"
    sql = sql & " endereco = '"&endereco&"',"
    sql = sql & " cidade = '"&cidade&"',"
    sql = sql & " curriculo = '"&curriculo&"',"
    sql = sql & " foto = '"&foto&"',"
    sql = sql & " email = '"&email&"'"
    sql = sql & " where cd_professor = "&cod
'response.write sql
'response.end
    conexao.execute(sql)
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%
elseif opc <> "" then
' DELETANDO REGISTRO SELECIONADO
   cod = request.querystring("cod")
   sql = "delete from tb_professor where cd_professor="&cod
  'response.write sql
  'response.end
  conexao.execute(sql)
%>
<script>
    alert("Professor excluído com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%
end if
%>