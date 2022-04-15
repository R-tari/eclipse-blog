<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
   <%@ page import="board.BoardDAO"%><!-- 사용자 라이브러리 -->
<%@ page import="board.Board"%><!-- 사용자 라이브러리 -->
<%@ page import="java.io.PrintWriter"%>
<!-- 자바에서 자바스크립트 사용 -->
<%@ page import="java.util.ArrayList"%>
<!-- 자바에서 자바스크립트 사용 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>잡다한 김치냉장고</title>
</head>
<style>
    *
    {
        box-sizing: board-box;
        margin:none; 
        padding:none;
    }

    a
    {
        text-decoration: none;
        color:inherit;
    }


    .wrap
    {
        text-align:center;
        margin: 0 auto;
    }

    .container
    {
        width:100%;
    }

    h1
    {
        color:rgb(43, 38, 38);
        text-shadow: 5px 3px 2px rgb(189, 201, 167);
        font-weight: 700;
        line-height: 200px;
    }

    .header .container
    {
        height:200px;
        background-color: rgb(201, 171, 137);
        board-radius:5px;

    }
</style>
<body>
    
    <div class="wrap">

        <header class="header">
            <div class="container">
                <h1>알타리의 잡다한 김치냉장고</h1>
            </div>
        </header>

        <section class="sec">
		
		<table>
					<thead>
						<tr>
							
							<th>제목</th>
							<th>미리보기</th>							
						</tr>	
					</thead>
					<tbody>
								<%
				BoardDAO boardDAO = new BoardDAO();
					
					ArrayList<Board> list = boardDAO.getList();
					for(int idx=0;idx<list.size();idx++){
			%>
					<tr>
						<td><%= list.get(idx).getNum() %></td>
						<td><a
							href="view.jsp?Num=<%= list.get(idx).getNum() %>"
							style="color: #000; text-decoration: none"><%= list.get(idx).getTitle() %></a></td>
						<td><%= list.get(idx).getTxt() %></td>

					</tr>
					<%
						}
						%>

					</tbody>					
				</table>


        </section>

        <footer class="footer">
            <address>
                이 페이지는 평가목적으로 제작되었으며 영리목적이 없음을 알립니다.
            </address>
        </footer>

    </div>


</body>
</html>
