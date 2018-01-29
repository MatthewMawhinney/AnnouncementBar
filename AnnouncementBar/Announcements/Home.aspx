<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AnnouncementBar.Announcements.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Arkham Hospital</title>
    <link rel="stylesheet" href="styles/style.css"/>
    <link rel="stylesheet" href="styles/home.css"/>
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab|Pontano+Sans|Vollkorn" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>

<body>
    <!-- HEADER SECTION -->
    <header>
        <div class="master-wrap">
            <img id="logoImg" class="effect-shine" alt="Arkham Hospital" src="images/home/Arkham.png"/>
            <nav id="main-nav">
                <ul>
                    <li>
                        <a class="effect-shine" href="#">Home</a>
                    </li>
                    <li>
                        <a class="effect-shine" href="#">Appointments</a>
                    </li>
                    <li>
                        <a class="effect-shine" href="#">Doctor Directory</a>
                    </li>
                    <li>
                        <a class="effect-shine" href="#">Departments</a>
                    </li>
                    <li>
                        <a class="effect-shine" href="#">Careers</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- MAIN SECTION -->
    <main runat="server">
        <div runat="server" class="master-wrap">
            <div id="announcement-bar">
                <div id="ann-title">
                    <h2>Arkham Announcements</h2>
                </div>
                <div class="announcements">
                    <div id="slider-prev" title="previous review"><i class="fa fa-chevron-left"></i></div>
                    <span runat="server" id="dbText" class="annText"></span>
                    <div id="slider-next" title="next review"><i class="fa fa-chevron-right"></i></div>
                </div>
                <div class="announcements-date">
                    <p>Posted on: </p>
                    <span runat="server" id="dbDate" class="annDate"></span>
                </div>
            </div>
            <asp:Label runat="server" ID="adminError"></asp:Label>
        <div runat="server" id="ImgBlockTop">
            <div runat="server" id="loginBlock">
                <form runat="server" id="homeLoginForm">
                    <h2>Administrator Login</h2>
                    <asp:Textbox runat="server" ID="userLogin" CssClass="block"></asp:Textbox>
                    <asp:Textbox runat="server" ID="passLogin" CssClass="block" TextMode="Password"></asp:Textbox>
                    <asp:Label runat="server" id="failLogin"></asp:Label>
                    <asp:Button runat="server" ID="buttonLogin" CssClass="block effect-shine" Text="LOGIN" OnClick="ButtonLogin_Click" />
                </form>
            </div>
            <h2 id="blockTop-title">YOUR HEALTH IS IN GOOD HANDS</h2>
        </div>

            <div id="services-block">
                <div class="services">
                        <img class="services-icon" alt="Emergency Responce Icon" src="images/icons/iconER.png"/>
                        <h3 class="services-title">Emergency Response</h3>
                    <div class="services-desc">Arkham Emergency Preparedness involves engaging all staff, physicians, volunteers and students to prevent
                        and manage emergency code events.</div>
                </div>
                <div class="services">
                        <img class="services-icon" alt="Scheduling Icon" src="images/icons/iconSchedule.png"/>
                        <h3 class="services-title">Scheduling</h3>
                    <div class="services-desc">Connect with Arkham Hospital any time of day or night to schedule an appointment with our highly skilled
                        doctors.
                    </div>
                </div>
                <div class="services">
                        <img class="services-icon" alt="Doctor Directory Icon" src="images/icons/iconDirectory.png"/>
                        <h3 class="services-title">Doctor Directory</h3>
                    <div class="services-desc">When it comes to choosing a doctor, it’s important to find a physician whose education, training, and
                        medical interests match your health needs.</div>
                </div>
                <div class="services">
                        <img class="services-icon" alt="Departments Icon" src="images/icons/iconDepartments.png"/>
                        <h3 class="services-title">Departments</h3>
                    <div class="services-desc">There are many hospital departments, staffed by a wide variety of skilled healthcare professionals.</div>
                </div>
                <div class="services">
                    <img class="services-icon" alt="Careers Icon" src="images/icons/iconCareers.png"/>
                    <h3 class="services-title">Careers</h3>
                    <div class="services-desc">Arkham Hospital is more than just a workplace. We are the last hope for some patients and the first choice
                        for many employees.</div>
                </div>
            </div>

            <div id="ImgBlockBot">
                <h2 id="blockBot-title">STATE OF THE ART FACILITY</h2>
            </div>

        </div>
    </main>

    <!-- FOOTER SECTION -->
    <footer>
        <div class="master-wrap">
            <div id="copyright">&copy;Copyright Arkham Hospital, 2017. All rights reserved.</div>
            <nav id="footer-nav">
                <ul>
                    <li>
                        <a class="effect-shine" href="#">Home</a>
                    </li>
                    <li>
                        <a class="effect-shine" href="#">Appointments</a>
                    </li>
                    <li>
                        <a class="effect-shine" href="#">Doctor Directory</a>
                    </li>
                    <li>
                        <a class="effect-shine" href="#">Departments</a>
                    </li>
                    <li>
                        <a class="effect-shine" href="#">Careers</a>
                    </li>
                </ul>
            </nav>
        </div>
    </footer>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
</body>
</html>
