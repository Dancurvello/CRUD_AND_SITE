<!--#include file="topo.asp"-->  
<!--#include file="wpg_cnx.asp"-->
<!--#include file="valida.asp"-->  
<%

sql = "select * from tb_curso a inner join tb_professor b on a.cd_professor=b.cd_professor order by ds_curso "

set rs = conexao.execute(sql)

%>
  <script>
function Excluir(cod)
   {
	 if(confirm("Confirma exclusão?"))
	  {
	    parent.location = "manu_curso.asp?opc=exc&cod=" + cod ;
      }
   
   } 
 	
 </script>

<div class="container">
<form action="frm_curso.asp" method=post>
<button type="submit" class="btn btn-primary">Adicionar</button>

  <h4>curso</h4>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Curso</th>
        <th>Professor</th>
        <th>Resumo</th>
        <th>Ativo</th>
        <th>#</th>		
      </tr>
    </thead>
    <tbody>
<%
'AQUI COMEÇA O DO WHILE ONDE TRARÁ AS LINHAS DE ACORDO COM O SELECT FEITO
do while not rs.eof%>
      <tr>
        <td>
 <a href="frm_curso.asp?evt=alt&cod=<%=rs("cd_curso")%>">
<img src="imagens/mudanca.png" width=5%>
        </a>		
		</td>
        <td><%=rs("ds_curso")%></td>
        <td><%=rs("ds_professor")%></td>
        <td><%=rs("resumo")%></td>
        <td>
        <%
        if cint(rs("ativo")) = 1 then
            response.write "<font color=blue>Ativo</font>"

            else
            response.Write "<font color=red>Inativo</font>"
        end if
        %></td>
        
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