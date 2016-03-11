package g02_member.controller.store;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
@WebServlet("/XMLServlet.do")
public class XMLServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("test123");
		response.setCharacterEncoding("UTF-8");
		System.out.println("test123");
		XMLService service = new XMLService();
		Document address = service.select();
		Format format = Format.getPrettyFormat();		              
		format.setIndent("");
		PrintWriter out = response.getWriter();
		XMLOutputter xml = new XMLOutputter();
		out.write(xml.outputString(address));
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
}
