import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/search")
public class MainServlet extends HttpServlet {
    String clr;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("firstpagecopy.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taglist = req.getParameter("taglist");
        String[] tagArr = taglist.split(",");

        for (int i=0; i<tagArr.length-1; i++) {

            if ((tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
            ) {
                //


            } else
            if ((tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                ) {
                //


            } else

            if ((tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                || (tagArr[i].equalsIgnoreCase("breakbeat"))
                ) {
                //


            } else

            if ((tagArr[i].equalsIgnoreCase("breakbeat"))
                    || (tagArr[i].equalsIgnoreCase("breakbeat"))
                    || (tagArr[i].equalsIgnoreCase("breakbeat"))
                    || (tagArr[i].equalsIgnoreCase("breakbeat"))
                    || (tagArr[i].equalsIgnoreCase("breakbeat"))
                    || (tagArr[i].equalsIgnoreCase("breakbeat"))
                    ) {
                //


            } else

            if ((tagArr[i].equalsIgnoreCase("breakbeat"))
                    || (tagArr[i].equalsIgnoreCase("breakbeat"))
                    || (tagArr[i].equalsIgnoreCase("breakbeat"))
                    || (tagArr[i].equalsIgnoreCase("breakbeat"))
                    || (tagArr[i].equalsIgnoreCase("breakbeat"))
                    || (tagArr[i].equalsIgnoreCase("breakbeat"))
                    ) {
                //


            }

        }


        resp.setContentType("application/text");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(clr);
    }

}