<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="AnnouncementBar.Announcements.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Administrator Access</title>
    <link rel="stylesheet" href="styles/style.css" />
    <link rel="stylesheet" href="styles/admin.css" />
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab|Pontano+Sans|Vollkorn" rel="stylesheet"/>
</head>
<body>
    <form id="form1" name="myForm" runat="server">
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
        <div class="master-wrap">
            <asp:Label runat="server" ID="welcome"></asp:Label><asp:Label runat="server" ID="empNum"></asp:Label>
            <asp:Button runat="server" ID="logout" Text="Logout" CssClass="buttons" OnClick="Logout_Click" />
            <h2>Current Announcements</h2>
            <asp:Table id="listAnnouncements" runat="server">
                <asp:TableHeaderRow runat="server">
                    <asp:TableHeaderCell runat="server">AnnouncementID</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">AnnouncementText</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">Date</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">Employee#</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <ul id="listAnnouncementId" runat="server">
                            <li></li>
                        </ul> 
                    </asp:TableCell>
                        <asp:TableCell runat="server">
                        <ul id="listAnnouncementText" runat="server">
                            <li></li>
                        </ul>
                    </asp:TableCell>
                        <asp:TableCell runat="server">
                        <ul id="listAnnouncementDate" runat="server">
                            <li></li>
                        </ul>
                    </asp:TableCell>
                        <asp:TableCell runat="server">
                        <ul id="listEmployeeId" runat="server">
                            <li></li>
                        </ul>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <div class="crudWrap">
                <div class="crud">
                    <h2>Create New Announcement</h2>
                    <div>
                        <asp:Label runat="server">Announcement ID</asp:Label>
                    </div>
                    <asp:TextBox runat="server" ID="createAnnouncementIdUser" ClientIDMode="Static"></asp:TextBox>
                    <br />
                    <div>
                        <asp:Label runat="server">Announcement Text</asp:Label>
                    </div>
                    <asp:TextBox runat="server" ID="createAnnouncementTextUser" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button runat="server" ID="createAnnouncement" Text="Add Announcement" CssClass="buttons" OnClientClick="return processFormCreate();" OnClick="CreateAnnouncement_Click"/>
                </div>
                <div class="crud">
                    <h2>Delete Current Announcement</h2>
                    <div>
                        <asp:Label runat="server">Announcement ID</asp:Label>
                    </div>
                    <asp:TextBox runat="server" ID="deleteAnnouncementIdUser"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button runat="server" ID="deleteAnnouncement" Text="Delete Announcement" CssClass="buttons" OnClientClick="return processFormDelete();" OnClick="DeleteAnnoucement_Click" />
                </div>
                <div class="crud">
                    <h2>Update Current Announcement</h2>
                    <div>
                        <asp:Label runat="server">Announcement ID</asp:Label>
                    </div>
                    <asp:TextBox runat="server" ID="updateAnnouncementIdUser"></asp:TextBox>
                    <br />
                    <div>
                        <asp:Label runat="server">Announcement Text</asp:Label>
                    </div>
                    <asp:TextBox runat="server" ID="updateAnnouncementTextUser" TextMode="MultiLine"></asp:TextBox>    
                    <br />
                    <br />
                    <asp:Button runat="server" ID="updateAnnouncement" Text="Update Announcement" CssClass="buttons" OnClientClick="return processFormUpdate();" OnClick="UpdateAnnouncement_Click" />
                </div>
            </div>
            <asp:Label runat="server" ID="adminChangeMessage"></asp:Label>
        </div>
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
    </form>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript">
        function processFormCreate() {

            var annId = /^[0-9]{1,3}$/;

            var idValid = document.getElementById('createAnnouncementIdUser').value;

            var userId = document.getElementById('adminChangeMessage');

            if (annId.test(idValid) === false) {
                userId.innerText = "Please Enter an ID Number from 1 to 3 digits.";
                return false;
            }
        }
        function processFormDelete() {

            var annId = /^[0-9]{1,3}$/;

            var idValid = document.getElementById('deleteAnnouncementIdUser').value;

            var userId = document.getElementById('adminChangeMessage');

            if (annId.test(idValid) === false) {
                userId.innerText = "Please Enter an ID Number from 1 to 3 digits.";
                return false;
            }

        }
        function processFormUpdate() {

            var annId = /^[0-9]{1,3}$/;

            var idValid = document.getElementById('updateAnnouncementIdUser').value;

            var userId = document.getElementById('adminChangeMessage');

            if (annId.test(idValid) === false) {
                userId.innerText = "Please Enter an ID Number from 1 to 3 digits.";
                return false;
            }

        }
    </script>
</body>
</html>
