<!--#include file="topo.asp"-->  
<!--#include file="wpg_cnx.asp"-->  
<%

sql = "select * from tb_modulo a inner join tb_curso b on a.cd_curso=b.cd_curso order by ds_modulo "

set rs = conexao.execute(sql)

%>
  <script>
function Excluir(cod)
   {
	 if(confirm("Confirma exclus�o?"))
	  {
	    parent.location = "manu_modulo.asp?opc=exc&cod=" + cod ;
      }
   
   } 
 	
 </script>

<div class="container">
<form action="frm_modulo.asp" method=post>
<button type="submit" class="btn btn-primary">Adicionar</button>

  <h4>Modulo</h4>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Modulo</th>
        <th>Curso</th>
        <th>Texto</th>
        <th>Anexo</th>
        <th>#</th>		
      </tr>
    </thead>
    <tbody>
<%
'AQUI COME�A O DO WHILE ONDE TRAR� AS LINHAS DE ACORDO COM O SELECT FEITO
do while not rs.eof%>
      <tr>
        <td>
 <a href="frm_modulo.asp?evt=alt&cod=<%=rs("cd_modulo")%>">
<img src="imagens/alt.jpg" %>
        </a>		
		</td>
        <td><%=rs("ds_modulo")%></td>
        <td><%=rs("ds_curso")%></td>
        <td><%=rs("texto")%></td>    
        <td>
        <a href="imagens/<%=rs("anexo")%>" target="blank"> <%=rs("anexo")%> </a></td>
        <td>
 <a href="javascript:Excluir(<%=rs("cd_curso")%>)">
 <img src="imagens/lixeira-de-reciclagem.png" width=5%>
        </a>		
		</td>

      </tr>
<%
'LOOP DEPOIS DA LINHA PARA QUE SE REPITA ENQUANTO TIVER REGISTROS NO SELECT FEITO
rs.movenext
loop
%>	  
    </tbody>
  </table>

  </div>
</form>

</div>
</body>
</html>