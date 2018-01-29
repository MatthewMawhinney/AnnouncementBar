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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FindEmpId();

            if (Session["loggedIn"] != null)
            {
                welcome.Text = "Welcome " + Session["loggedIn"] + ",  Employee #";
            }
            else
            {
                Response.Redirect("Home.aspx");
            }

            Show();
            
        }

        protected void FindEmpId()
        {
            OracleConnection conn = new OracleConnection
            {
                ConnectionString = AnnouncementBar.Announcements.Classes.ConnString.connectionString
            };

            int employee_id;

            conn.Open();

            string command = "SELECT emp_id FROM NET_EMPLOYEES WHERE emp_username = :auto_emp";
            OracleCommand cmd = new OracleCommand(command, conn);
            cmd.Parameters.Add(new OracleParameter("auto_emp", Session["loggedIn"]));


            OracleDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
               employee_id = Convert.ToInt32(reader["emp_id"]);
               empNum.Text = employee_id.ToString(); 
            }
            
            conn.Close();
            
        }

        protected void Show()
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

                listAnnouncementId.InnerHtml = " ";
                listAnnouncementText.InnerHtml = " ";
                listAnnouncementDate.InnerHtml = " ";
                listEmployeeId.InnerHtml = " ";


                while (reader.Read())
                {
                    listAnnouncementId.InnerHtml += "<li>" + reader["announce_id"] + "</li>";
                    listAnnouncementText.InnerHtml += "<li>" + reader["announce_text"] + "</li>";
                    listAnnouncementDate.InnerHtml += "<li>" + reader["announce_date"] + "</li>";
                    listEmployeeId.InnerHtml += "<li>" + reader["emp_id"] + "</li>";
                }
                reader.Close();

            }
            catch (OracleException ex)
            {
                adminChangeMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        protected void CreateAnnouncement_Click(object sender, EventArgs e)
        {
            AnnouncementTable announcement = new AnnouncementTable()
            {
                announce_id = Convert.ToInt32(createAnnouncementIdUser.Text),
                announce_text = createAnnouncementTextUser.Text,
                emp_id = Convert.ToInt32(empNum.Text) //Convert.ToInt32(createAnnouncementEmployeeUser.Text) //needs to equal emp_id for user logged in
            };
           
            ConnString db = new ConnString();
            try
            {
                db.Add(announcement);
                adminChangeMessage.Text = db.Message;
            }
            catch (OracleException ex)
            {
                if (ex.Message.Contains("ORA-00001"))
                {
                    adminChangeMessage.Text = "Announcement ID already exists. Please Select New ID.";
                }
                else if (ex.Message.Contains("ORA-01400"))
                {
                    adminChangeMessage.Text = "All Fields must be filled in.";
                }
                else if (ex.Message.Contains("ORA-12899"))
                {
                    adminChangeMessage.Text = "Announcement text must be under 200 Characters.";
                }
                else if (ex.Message.Contains("ORA-01407"))
                {
                    adminChangeMessage.Text = "Announcement Text cannot be left Blank.";
                }
                else
                {
                    adminChangeMessage.Text = ex.Message;
                }

            }

            Show();
        }

        protected void DeleteAnnoucement_Click(object sender, EventArgs e)
        {
            AnnouncementTable announcement = new AnnouncementTable()
            {
                announce_id = Convert.ToInt32(deleteAnnouncementIdUser.Text)
            };
            
            ConnString db = new ConnString();
            try
            {
                db.Delete(announcement);
                adminChangeMessage.Text = db.Message;
            }
            catch (OracleException ex)
            {
                if (ex.Message.Contains("ORA-00000"))
                {
                    adminChangeMessage.Text = "We've got a situation";
                }
                adminChangeMessage.Text = ex.Message;
            }

            Show();
        }

        protected void UpdateAnnouncement_Click(object sender, EventArgs e)
        {
            AnnouncementTable announcement = new AnnouncementTable()
            {
                announce_id = Convert.ToInt32(updateAnnouncementIdUser.Text),
                announce_text = updateAnnouncementTextUser.Text,
                emp_id = Convert.ToInt32(empNum.Text)
            };

            ConnString db = new ConnString();
            try
            {
                db.Update(announcement);
                adminChangeMessage.Text = db.Message;
            }
            catch (OracleException ex)
            {
                if (ex.Message.Contains("ORA-01407"))
                {
                    adminChangeMessage.Text = "Announcement Text cannot be left Blank.";
                }
                else if (ex.Message.Contains("ORA-12899"))
                {
                    adminChangeMessage.Text = "Announcement text must be under 200 Characters.";
                }
                else
                {
                    adminChangeMessage.Text = ex.Message;
                }

            }

            Show();
        }
    }
}