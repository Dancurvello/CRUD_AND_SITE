<br>
<!--#include file="wpg_cnx.asp"-->
<!--#include file="FuncaoUpload.asp"-->
<!--#include file="valida.asp"-->
<%
Function ZerosEsquerda(Num,tam)
	Dim Zero
	Num = Trim(Num)
	Zero = ""
	For i = Len(Num) To tam - 1
	    Zero = "0" & Zero
	Next
	ZerosEsquerda = Trim(Zero & Num)
End Function

' Chamando Funções, que fazem o Upload funcionar
byteCount = Request.TotalBytes
RequestBin = Request.BinaryRead(byteCount)
Set UploadRequest = CreateObject("Scripting.Dictionary")
BuildUploadRequest RequestBin

'RECEBENDO DADOS DOS FORMULÁRIOS
'RECEBENDO CAMPOS DO FORMULÁRIO
'opc          = request.querystring("opc")


cod          = UploadRequest.Item("hfcod").Item("Value")
botao         = UploadRequest.Item("botao").Item("Value")
curso         = UploadRequest.Item("curso").Item("Value")
anexo         = UploadRequest.Item("anexo").Item("Value")
texto         = UploadRequest.Item("texto").Item("Value")
modulo         = UploadRequest.Item("modulo").Item("Value")

'
'Laço que efetua toda operacao do anexo.
'
	' Recuperando os Dados Digitados ----------------------

	caminho     = UploadRequest.Item("anexo").Item("FileName")
	nome        =  Right(caminho,Len(caminho)-InstrRev(caminho,"\"))
	arquivo     = UploadRequest.Item("anexo").Item("Value")
'TESTANDO SE FOI SELECIONADO ALGUM ARQUIVO E 
	if trim(arquivo) <> "" then
        pasta = Server.MapPath("upload\")
		response.write pasta
        arq = year(date)&month(date)&day(date)&hour(now)&minute(now)&second(now)&"."&right(nome,3)

		nome_arquivo = arq
		nome_arquivo = "/"&nome_arquivo
		'Response.Write x & "<br>"
		if x = 1 then
			arquivo = arq
			
		else
			arquivo = arquivo & "§" & arq
		end if
		Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
		'Response.Write pasta & nome_arquivo & "<br>"
		Set MyFile = ScriptObject.CreateTextFile(pasta & nome_arquivo)
		
		For i = 1 to LenB(arquivo)
		MyFile.Write chr(AscB(MidB(arquivo,i,1)))
		Next
		MyFile.Close
		arquivo = ""
	end if
session.LCID = 1046




if botao = "Incluir" then
' INCLUINDO OS DADOS RECEBIDOS NA TABELA

   sql = "insert into tb_modulo (ds_modulo,anexo,cd_curso,texto)"
   sql = sql & " values('"&modulo&"','"& arq &"','"&curso&"','"&texto&"')"
   response.write sql
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