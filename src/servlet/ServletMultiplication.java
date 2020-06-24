package servlet;

import com.yue.Matrix;
import javafx.scene.transform.MatrixType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ServletMultiplication")
public class ServletMultiplication extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
		String data=request.getParameter("al");
		System.out.println(data);
		Matrix cal=new Matrix();
		String result=cal.caculate(data);
		System.out.println("result="+result);
		out.print(result);
		out.flush();
		out.close();


    }

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
