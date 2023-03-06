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
   sql = "SELECT * from tb_modulo where cd_modulo = "&cod
'  Response.Write(sql)
'  Response.End()
   set rs = conexao.execute(sql)
   modulo = rs("ds_modulo")
   texto = rs("texto") 
   curso = rs("cd_curso") 
   anexo = rs("anexo")
      
   bot        = "Alterar"
else
   curso = 0
   bot       = "Incluir"
end if

%>

<div class="container">
<br><br>
  <form class="form-horizontal" action="manu_modulo_up.asp" method="post" enctype="multipart/form-data">

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Modulo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="nome" placeholder="Modulo" name="modulo" value="<%=modulo%>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Texto:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="nome" placeholder="Texto" name="texto" value="<%=texto%>">
      </div>
    </div>

<%
sql = "select * from tb_curso order by ds_curso"
set rs = conexao.execute(sql)
%>

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Curso:</b></label>
      <div class="col-sm-4">
      <select class="form-control" name="curso">
      <% do while not rs.eof %>
        <% if cint(curso) = rs("cd_curso") then %>
              <option value="<%=rs("cd_curso")%>" Selected><%=rs("ds_curso")%> </option>
        <% else %>
                <option value="<%=rs("cd_curso")%>" ><%=rs("ds_curso")%> </option>
        <% end if %>
        <%
        rs.movenext
        loop
        %>
        </select
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Anexo:</b></label>
      <div class="col-sm-4">
        <input type="file" class="form-control" id="nome" placeholder="Anexo" name="anexo">
      </div>
    </div>

    



    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" name="botao" value="<%=bot%>"><%=bot%></button>
      </div>
    </div>
	<input type="hidden" name="hfcod" value="<%=cod%>">	
  </form>
</div>

</body>
</html>