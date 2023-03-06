<!--#include file="topo.asp"-->  
<!--#include file="wpg_cnx.asp"-->
<!--#include file="valida.asp"-->  
<%

sql = "select * from tb_usuario order by ds_usuario "

set rs = conexao.execute(sql)

%>
  <script>
function Excluir(cod)
   {
	 if(confirm("Confirma exclusão?"))
	  {
	    parent.location = "manu_usuario.asp?opc=exc&cod=" + cod ;
      }
   
   } 
 	
 </script>

<div class="container">
<form action="frm_usuario.asp" method=post>
<button type="submit" class="btn btn-primary">Adicionar</button>

  <h4>Usuário</h4>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Usuario</th>
        <th>#</th>		
      </tr>
    </thead>
    <tbody>
<%
'AQUI COMEÇA O DO WHILE ONDE TRARÁ AS LINHAS DE ACORDO COM O SELECT FEITO
do while not rs.eof%>
      <tr>
        <td>
 <a href="frm_usuario.asp?evt=alt&cod=<%=rs("cd_usuario")%>">
<img src="imagens/alt.jpg" %>
        </a>		
		</td>
        <td><%=rs("ds_usuario")%></td>
                      
        <td>
 <a href="javascript:Excluir(<%=rs("cd_usuario")%>)">
 <img src="imagens/excluir.jpg" %>
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