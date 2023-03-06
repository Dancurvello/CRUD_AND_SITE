<!--#include file="topo.asp"-->  
<!--#include file="wpg_cnx.asp"-->  

<%
'RECEBENDO CÓDIGO COMO PARAMETRO E EVT PARA SABER SE VAI INCLUIR OU ALTERAR
cod = Request.QueryString("cod")
evt  = Request.QueryString("evt")
if cod <> "" then
   cod = cint(cod)
end if
if ucase(evt) = "ALT" then
   sql = "SELECT * from tb_usuario where cd_usuario = "&cod
'  Response.Write(sql)
'  Response.End()
   set rs = conexao.execute(sql)
   usuario = rs("ds_usuario")
   senha = rs("senha") 
  

   bot        = "Alterar"
else
   ativo = 0
   bot       = "Incluir"
end if

%>

<div class="container">
<br><br>
  <form class="form-horizontal" action="manu_usuario.asp" method="post">

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Usuario:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" placeholder="Usuario" name="usuario" value="<%=usuario%>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Senha:</b></label>
      <div class="col-sm-4">
        <input type="password" class="form-control" placeholder="Senha" name="senha" value="<%=senha%>">
      </div>
    </div>
        
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" name="Botao" value="<%=bot%>"><%=bot%></button>
      </div>
    </div>
	<input type="hidden" name="hfcod" value="<%=cod%>">	
  </form>
</div>

</body>
</html>