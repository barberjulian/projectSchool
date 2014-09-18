using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Net;
using System.Data;


public class clsDataLayer
{
    
    // This function verifies a user in the tblUser table
    public static dsUser VerifyUser(string Database, string UserName, string UserPassword)
    {
        // Create dataset object
        dsUser DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;

        // Create database connection
        sqlConn = new OleDbConnection("PROVIDER=Microsoft.Jet.OLEDB.4.0;" +
                                      "Data Source=" + Database);

        // Open database
        sqlDA = new OleDbDataAdapter("Select SecurityLevel from tblUserLogin " +
                                      "where UserName like '" + UserName + "' " +
                                      "and UserPassword like '" + UserPassword + "'", sqlConn);

        // Allocates memory
        DS = new dsUser();

        // Fill dataset
        sqlDA.Fill(DS.tblUserLogin);

        // Return data
        return DS;

    }

    //This function saves the user data
    public static bool SaveUser(string Database, string UserID, string UserPassword, string SecurityLevel)
    {
        bool userSaved;
        OleDbTransaction myTransaction = null;

        try
        {
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + Database);

            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;

            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;

            strSQL = "Insert into tblUserLogin " +
                     "(UserName, UserPassword, SecurityLevel) values ('" +
                     UserID + "', '" + UserPassword + "', '" + SecurityLevel + "')";

            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;

            command.ExecuteNonQuery();

            myTransaction.Commit();
            conn.Close();
            userSaved = true;
        }

        catch (Exception ex)
        {
            userSaved = false;
        }
        return userSaved;
    }
    
    // This function saves the personnel data
    public static bool SavePersonnel(string Database, string FirstName, string LastName,
    string PayRate, string StartDate, string EndDate)
    {
        bool recordSaved;
        OleDbTransaction myTransaction = null;

        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.Jet.OLEDB.4.0;" +
            "Data Source=" + Database);
            
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;

            //Create new transaction
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            
            strSQL = "Insert into tblPersonnel " +
                     "(FirstName, LastName) values ('" +
                     FirstName + "', '" + LastName + "')";

            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;

            command.ExecuteNonQuery();

            strSQL = "Update tblPersonnel " +
                     "Set PayRate=" + PayRate + ", " +
                     "StartDate='" + StartDate + "', " +
                     "EndDate='" + EndDate + "' " +
                     "Where ID=(Select Max(ID) From tblPersonnel)";

            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;

            command.ExecuteNonQuery();

            //Commit transaction if all insert/update statements execute
            myTransaction.Commit();

            conn.Close();
            recordSaved = true;
        }
        catch (Exception ex)
        {
            //Rollback if failure
            myTransaction.Rollback();
            recordSaved = false;
        }
        return recordSaved;
    }
    
    // This function gets the user activity from the tblUserActivity
    public static dsUserActivity GetUserActivity(string Database)
    {
        dsUserActivity DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;

        sqlConn = new OleDbConnection("PROVIDER=Microsoft.Jet.OLEDB.4.0;" +
            "Data Source=" + Database);

        sqlDA = new OleDbDataAdapter("select * from tblUserActivity", sqlConn);

        DS = new dsUserActivity();

        sqlDA.Fill(DS.tblUserActivity);

        return DS;
    }

    // This function saves the user activity
    public static void SaveUserActivity(string Database, string FormAccessed)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.Jet.OLEDB.4.0;" +
            "Data Source=" + Database);
        conn.Open();
        OleDbCommand command = conn.CreateCommand();
        string strSQL;

        strSQL = "Insert into tblUserActivity (UserIP, FormAccessed) values ('" +
            GetIP4Address() + "', '" + FormAccessed + "')";

        command.CommandType = CommandType.Text;
        command.CommandText = strSQL;
        command.ExecuteNonQuery();
        conn.Close();
    }

    // This function gets the IP Address
    public static string GetIP4Address()
    {
        string IP4Address = string.Empty;

        foreach (IPAddress IPA in
                    Dns.GetHostAddresses(HttpContext.Current.Request.UserHostAddress))
        {
            if (IPA.AddressFamily.ToString() == "InterNetwork")
            {
                IP4Address = IPA.ToString();
                break;
            }
        }

        if (IP4Address != string.Empty)
        {
            return IP4Address;
        }

        foreach (IPAddress IPA in Dns.GetHostAddresses(Dns.GetHostName()))
        {
            if (IPA.AddressFamily.ToString() == "InterNetwork")
            {
                IP4Address = IPA.ToString();
                break;
            }
        }

        return IP4Address;
    }

    public static dsPersonnel GetPersonnel(string Database)
    {
        dsPersonnel DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;

        // Connect to database
        sqlConn = new OleDbConnection("PROVIDER=Microsoft.Jet.OLEDB.4.0;" +
            "Data Source=" + Database);

        sqlDA = new OleDbDataAdapter("select * from tblPersonnel", sqlConn);

        DS = new dsPersonnel();
        // Fill dataset 
        sqlDA.Fill(DS.tblPersonnel);
        // Return data
        return DS;
    }

    public static dsPersonnel GetPersonnel(string Database, string searchVal)
    {
        dsPersonnel DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;

        sqlConn = new OleDbConnection("PROVIDER=Microsoft.Jet.OLEDB.4.0;" +
            "Data Source=" + Database);

        sqlDA = new OleDbDataAdapter("select * from tblPersonnel WHERE LastName LIKE '%"+searchVal+"%' ", sqlConn);

        DS = new dsPersonnel();

        // Fill dataset 
        sqlDA.Fill(DS.tblPersonnel);

        // Return data
        return DS;
    }

public clsDataLayer(){
}
}