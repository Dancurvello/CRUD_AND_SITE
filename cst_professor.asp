<!--#include file="topo.asp"-->  
<!--#include file="wpg_cnx.asp"-->
<!--#include file="valida.asp"-->  
<%

sql = "select * from tb_professor order by ds_professor "
set rs = conexao.execute(sql)

%>
  <script>
function Excluir(cod)
   {
	 if(confirm("Confirma exclusão?"))
	  {
	    parent.location = "manu_professor.asp?opc=exc&cod=" + cod ;
      }
   
   } 
 	
 </script>

<div class="container">
<form action="frm_professor.asp" method=post>
<button type="submit" class="btn btn-primary">Adicionar</button>

  <h4>Professor</h4>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Nome</th>
        <th>CPF</th>
        <th>Data Nascimento</th>
        <th>E-mail</th>
        <th>foto</th>
        <th>#</th>		
      </tr>
    </thead>
    <tbody>
<%
'AQUI COMEÇA O DO WHILE ONDE TRARÁ AS LINHAS DE ACORDO COM O SELECT FEITO
do while not rs.eof%>
      <tr>
        <td>
 <a href="frm_professor.asp?evt=alt&cod=<%=rs("cd_professor")%>">
<img src="imagens/mudanca.png" width=10%>
        </a>		
		</td>
        <td><%=rs("ds_professor")%></td>
        <td><%=rs("cpf")%></td>
        <td><%=rs("data_nascimento")%></td>
        <td><%=rs("email")%></td>
        <td>
        <a href="imagens/<%=rs("foto")%>" target="blank"> <%=rs("foto")%> </a></td>
        <!--esse target bank é igual vc clicar no link e "abrir em uma nova guia"--> 
        <td>
 <a href="javascript:Excluir(<%=rs("cd_professor")%>)">
 <img src="imagens/lixeira-de-reciclagem.png" width=10%>
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