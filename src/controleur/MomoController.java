package controleur;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/momo-controller")
public class MomoController extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public MomoController()
    {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setHeader("Content-Type", "application/json");
        response.setHeader("Access-Control-Allow-Origin", "*");
        String amount = request.getParameter("amount");
        String number = request.getParameter("number");
        response.getWriter().println(payement(amount, number));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }

    private static String payement(String amount, String number) throws IOException
    {
        String url = "https://developer.mtn.cm/OnlineMomoWeb/faces/transaction/transactionRequest.xhtml?idbouton=2&typebouton=PAIE&_amount=" + amount + "&_tel=" + number + "&_clP=&_email=thecamelgeek@gmail.com&submit.x=104&submit.y=70";
        try
        {
            InputStream is = (new URL(url)).openConnection().getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(is));

            StringBuilder builder = new StringBuilder();
            String line = "";
            while ((line = reader.readLine()) != null)
            {
                System.out.println("je suis dans le payement ");
                builder.append(line + "\n");
            }
            return builder.toString();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        return null;
    }
}