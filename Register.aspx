<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="Register.aspx.cs" Inherits="JobTask.Register" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#txtdateofbirth").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: '-70:+0'
            });
        });
    </script>



    <style>
        .container {
            margin: 5% 20%;
            border: 1px solid;
        }

        .row {
            display: grid;
            margin: 0px 5%;
        }

        .col-12 {
            width: 100%;
            display: flex;
            margin: 2% 0%;
        }

        .col-4 {
            width: 30%;
            text-align: right;
        }

        .col-8 {
            width: 70%;
        }

        .form-group {
            display: inline;
            margin: 3%;
        }

            .form-group label {
                margin-right: 12%;
            }

        .form-text {
            width: 85%;
            height: 120%;
        }

        .btn {
            background-color: #2196f3;
            border: none;
            color: white;
            padding: 6px;
            border-radius: 5px;
        }

        h3 {
            background: #c1c1c1;
            margin-top: 0px;
            padding: 15px;
        }
    </style>

    <script>


        function mobcheck() {

            var mob = document.getElementById("txtmobile").value;
            var moblen = mob.length;

            if (moblen != 10) {
                alert("Mobile no is not correct");
                document.getElementById("txtmobile").value = "";
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="main">
                <div class="container">
                    <div class="agile">
                        <div>
                            <div class="text">
                                <div class="wrapper">
                                    <center>
                                        <h3>REGISTRATION </h3>
                                    </center>
                                    <center>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="col-4">
                                                    <label>First Name</label>
                                                </div>
                                                <div class="col-8">
                                                    <asp:TextBox runat="server" CssClass="form-text" ID="txtfname" required=""></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="col-4">
                                                    <label>Last Name</label>
                                                </div>
                                                <div class="col-8">
                                                    <asp:TextBox runat="server" CssClass="form-text" ID="txtlname" required="" data-parsley-required="field is required"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="col-4">
                                                    <label>E-Mail Address</label>
                                                </div>
                                                <div class="col-8">
                                                    <asp:TextBox runat="server" CssClass="form-text" ID="txtemail" required="" type="Email"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="col-4">
                                                    <label>Mobile No.</label>
                                                </div>
                                                <div class="col-8">
                                                    <asp:TextBox runat="server" CssClass="form-text" ID="txtmobile" required="" onchange="mobcheck();" type="number"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="col-4">
                                                    <label>Gender</label>
                                                </div>
                                                <div class="col-8">
                                                    <asp:RadioButtonList ID="RdblGender" runat="server" CssClass="form-text">
                                                        <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                                        <asp:ListItem Text="FeMale" Value="F"></asp:ListItem>
                                                    </asp:RadioButtonList>

                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="col-4">
                                                    <label>City</label>
                                                </div>
                                                <div class="col-8">
                                                    <asp:DropDownList ID="ddlcity" runat="server" required="" CssClass="form-text" Style="padding: 5px;" DataTextField="CityName" DataValueField="CityID">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="col-4">
                                                    <label>Date Of Birth</label>
                                                </div>
                                                <div class="col-8">
                                                    <asp:TextBox runat="server" CssClass="datepicker form-control input-sm form-text" ID="txtdateofbirth"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="col-4">
                                                    <label>Image</label>
                                                </div>
                                                <div class="col-8">
                                                    <asp:FileUpload ID="fuimage" runat="server" CssClass="form-text" />
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="col-4">
                                                </div>
                                                <div class="col-8">
                                                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn form-text" OnClientClick="return matchpwd()" OnClick="btnRegister_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </center>
                                </div>
                            </div>
                            <asp:GridView ID="gvuser" runat="server" AutoGenerateColumns="false" DataKeyNames="ID"
                                EmptyDataText="No records has been added.">
                                <%--OnRowDataBound="gvuser_RowDataBound" OnRowEditing="gvuser_RowEditing" OnRowCancelingEdit="gvuser_RowCancelingEdit"--%>
                                <%--OnRowUpdating="gvuser_RowUpdating" OnRowDeleting="gvuser_RowDeleting"--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="First Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfiName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtfirName" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllaname" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtlsname" runat="server" Text='<%# Eval("LastName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEmailID" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobile No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMbl" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtmobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Gender">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgndr" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtlgender" runat="server" Text='<%# Eval("Gender") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date of birth">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%# Eval("Dateofbirth") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtdatebirth" runat="server" Text='<%# Eval("Dateofbirth") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcity" runat="server" Text='<%# Eval("CityID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtcty" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Photo">
                                        <ItemTemplate>
                                            <asp:Label ID="lblimg" runat="server" Text='<%# Eval("Photo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtimage" runat="server" Text='<%# Eval("Photo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
