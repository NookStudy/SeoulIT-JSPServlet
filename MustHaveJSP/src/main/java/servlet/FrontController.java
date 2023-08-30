package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 	annotation을 통한 요청명 mapping으로 *를 통해 여러 요청명을 한번에 mapping한다.
 	즉, .one으로 끝나는 모든 요청에 대해 매핑처리한다.
 */
@WebServlet("*.one")
public class FrontController extends HttpServlet{
	/*
	 	get방식으로 들어오는 요청을 처리하기 위해 doGet메서드를 오버라이딩해야한다.
	 	만약 서블잇이 이메서드가 정의됮 않았다면 405에러가 발생한다.
	 	즉, 해당 방식의 요청을 처리할 수 없다는 의미이다.
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//request내장객체를 통해 현재요청된 URL을 얻어온다.
		//즉, 웹브라우저의 주소표시줄에 있는 전체경로명에서 
		//	HOST(현시점localhost)를 제외한 나머지 경로를 얻어 올수 있다. 
		String uri= req.getRequestURI();
		//URL의 마지막 /의 인덱스를 얻어온다.
		int lastSlash = uri.lastIndexOf("/");
		//앞에서 얻어온 index를 통해 URL을 자른다. 즉 마지막에 있는 요청명만 남긴다. 
		String commmandStr= uri.substring(lastSlash);
		//마지막 요청명을 통해 요청을 판단한 후 해당 요청을 처리할 메서드를 호출한다.
		//이 때 사용자의 요청정보를 담은 request객체를 인수로 전달한다.
		//즉, 모든 요청을 메서드로 전달하는 것이다.
		if(commmandStr.equals("/regist.one"))
			registFunc(req);
		else if (commmandStr.equals("/login.one")) {
			loginFunc(req);
		}else if (commmandStr.equals("/freeboard.one")) {
			freeboardFunc(req);
		}
		
		req.setAttribute("uri",uri);
		req.setAttribute("commandStr",commmandStr);
		//View로 포워드한다.
		req.getRequestDispatcher("/13Servlet/FrontController.jsp").forward(req,resp);
	}
	
	void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue","<h4>회원가입</h4>");
	}
	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue","<h4>로그인</h4>");
	}
	void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue","<h4>자유게시판</h4>");
	}
}
