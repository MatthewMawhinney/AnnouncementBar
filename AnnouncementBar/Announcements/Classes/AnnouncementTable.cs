using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AnnouncementBar.Announcements.Classes
{
    public class AnnouncementTable : ConnString
    {
        //fields
        private int _announce_id;
        private string _announce_text;
        private string _announce_date;
        private int _emp_id;
        


        //properties
        public int announce_id
        {
            get { return _announce_id; }
            set { _announce_id = value; }
        }
        public string announce_text
        {
            get { return _announce_text; }
            set { _announce_text = value; }
        }
        public string announce_date
        {
            get { return _announce_date; }
            set { _announce_date = value; }
        }
        public int emp_id
        {
            get { return _emp_id; }
            set { _emp_id = value; }
        }

    }
}