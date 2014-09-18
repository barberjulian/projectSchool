using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
// Add your comments here
using System.Net.Mail;
/// <summary>
/// Summary description for clsBusinessLayer
/// </summary>
public class clsBusinessLayer
{
    public static bool SendEmail(string Sender, string Recipient, string bcc, string cc,
    string Subject, string Body)
    {
        try
        {

            // Add your comments here
            MailMessage MyMailMessage = new MailMessage();

            // Add your comments here
            MyMailMessage.From = new MailAddress(Sender);

            // Add your comments here
            MyMailMessage.To.Add(new MailAddress(Recipient));

            // Add your comments here
            if (bcc != null && bcc != string.Empty)
            {
                // Add your comments here
                MyMailMessage.Bcc.Add(new MailAddress(bcc));
            }

            // Add your comments here
            if (cc != null && cc != string.Empty)
            {
                // Add your comments here
                MyMailMessage.CC.Add(new MailAddress(cc));
            }

            // Add your comments here
            MyMailMessage.Subject = Subject;

            // Add your comments here
            MyMailMessage.Body = Body;

            // Add your comments here
            MyMailMessage.IsBodyHtml = true;

            // Add your comments here
            MyMailMessage.Priority = MailPriority.Normal;

            // Add your comments here
            SmtpClient MySmtpClient = new SmtpClient();

            // Add your comments here
            MySmtpClient.Port = 25;
            MySmtpClient.Host = "127.0.0.1";

            // Add your comments here
            MySmtpClient.Send(MyMailMessage);

            // Return 
            return true;
        }
        catch (Exception ex)
        {

            // Return data
            return false;
        }

    }
    
    public clsBusinessLayer()
	{

	}
}