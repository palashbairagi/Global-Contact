package mailse;
import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.*;

@SuppressWarnings("serial")
public class mailservlet1 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		try {
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

			final String sender = request.getParameter("sender");
			String receiver = request.getParameter("receiver");
			String subject = request.getParameter("subject");
			String msg = request.getParameter("message");
			final String password = request.getParameter("password");

			Session session = Session.getInstance(props,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(sender, password);
						}
					});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sender));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(receiver, false));
			message.setSubject(subject);
			message.setText(msg);
			Transport.send(message);
			out.println("Mail has been sent");
			out.println("<a href=message.jsp>Home</a>");
		} catch (Exception ex) {
			out.print("<script type='text/javascript'>alert('Unable to send mail')</script>");
		}
	}
}