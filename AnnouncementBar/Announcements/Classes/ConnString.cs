using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess.Client;

namespace AnnouncementBar.Announcements.Classes
{
    public class ConnString
    {
        //fields
        private static string host = "calvin.humber.ca";
        private static string username = OracleLogin.username;
        private static string password = OracleLogin.password;
        private static string port = "1521";
        private static string sid = "grok";

        public static string connectionString = OracleConnString(host, port, sid, username, password);
        private OracleConnection conn = new OracleConnection(connectionString);
        private OracleCommand cmd;
        private string _message;

        public string Message
        {
            get { return _message; }
            set { _message = value; }
        }

        public void Add(AnnouncementTable announcement)
        {
            string command = "INSERT INTO NET_ANNOUNCEMENTS (announce_id, announce_text, emp_id) VALUES (:id, :a_text, :e_id)";
            int rows;

            conn.Open();

            cmd = new OracleCommand(command, conn);
            cmd.Parameters.Add(new OracleParameter("id", announcement.announce_id));
            cmd.Parameters.Add(new OracleParameter("a_text", announcement.announce_text));
            cmd.Parameters.Add(new OracleParameter("e_id", announcement.emp_id));

            rows = cmd.ExecuteNonQuery();

            conn.Close();

            Message = rows.ToString() + " row(s) have been added.";
        }

        public void Update(AnnouncementTable announcement)
        {
            string command = "UPDATE NET_ANNOUNCEMENTS SET announce_id = :id, announce_text = :a_text, announce_date = SYSDATE, emp_id = :e_id WHERE announce_id = :id";
            int rows;

            conn.Open();

            cmd = new OracleCommand(command, conn);
            cmd.Parameters.Add(new OracleParameter("id", announcement.announce_id));
            cmd.Parameters.Add(new OracleParameter("a_text", announcement.announce_text));
            cmd.Parameters.Add(new OracleParameter("e_id", announcement.emp_id));

            rows = cmd.ExecuteNonQuery();

            conn.Close();

            Message = rows.ToString() + " row(s) have been updated.";
        }

        public void Delete(AnnouncementTable announcement)
        {
            string command = "DELETE FROM NET_ANNOUNCEMENTS WHERE announce_id = :id";
            int rows;

            conn.Open();

            cmd = new OracleCommand(command, conn);
            cmd.Parameters.Add(new OracleParameter("id", announcement.announce_id));

            rows = cmd.ExecuteNonQuery();

            conn.Close();

            Message = rows.ToString() + " row(s) have been deleted.";
        }

        //Method from Chris Hulbert Wesite
        public static string OracleConnString(string host, string port, string servicename, string user, string pass)
        {
            return String.Format(
              "Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST={0})" +
              "(PORT={1}))(CONNECT_DATA=(SERVICE_NAME={2})));User Id={3};Password={4};",
              host,
              port,
              servicename,
              user,
              pass);
        }
    }
}