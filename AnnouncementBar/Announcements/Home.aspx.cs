using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnnouncementBar.Announcements.Classes;
using Oracle.ManagedDataAccess.Client;

namespace AnnouncementBar.Announcements
{
    public partial class Home : System.Web.UI.Page
    {
        OracleConnection conn = new OracleConnection();
        string connectionString = AnnouncementBar.Announcements.Classes.ConnString.connectionString;

        //valid admin accounts
        string user1 = "batman";
        string user2 = "butler";

        protected void Page_Load(object sender, EventArgs e)
        {

            OracleConnection conn = new OracleConnection
            {
                ConnectionString = AnnouncementBar.Announcements.Classes.ConnString.connectionString
            };

            try
            {
                conn.Open();

                string command = "SELECT * FROM NET_ANNOUNCEMENTS ORDER BY announce_id DESC";
                OracleCommand cmd = new OracleCommand(command, conn);

                OracleDataReader reader = cmd.ExecuteReader();

                dbText.InnerHtml = " ";
                dbDate.InnerHtml = " ";


                while (reader.Read())
                {
                    dbText.InnerHtml += "<span class='textShow dbText'>" + reader["announce_text"] + "</span>";
                    dbDate.InnerHtml += "<span class='showDate dbDate'>" + reader["announce_date"] + "</span>";
                }
            }
            catch (OracleException ex)
            {
                adminError.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            conn.ConnectionString = connectionString;

            conn.Open();

            string command = "SELECT * FROM NET_EMPLOYEES WHERE LOWER(emp_username) = LOWER(:username) AND emp_password = :password";

            OracleCommand cmd = new OracleCommand(command, conn);
            cmd.Parameters.Add(new OracleParameter("username", userLogin.Text));
            cmd.Parameters.Add(new OracleParameter("password", passLogin.Text));

            OracleDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Session["loggedIn"] = reader["emp_username"].ToString();
                }
            }
            else
            {
                Session.Abandon();
                failLogin.Text = "Username and Password incorrect.";
            }

            conn.Close();


            if ((userLogin.Text == "batman") && (passLogin.Text == "manbat"))
            {
                Session["loggedIn"] = user1;
                Response.Redirect("Admin.aspx");
            }
            else if ((userLogin.Text == "butler") && (passLogin.Text == "moreteasir"))
            {
                Session["loggedIn"] = user2;
                Response.Redirect("Admin.aspx");
            }
        }
    }
}