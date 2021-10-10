using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace JobTask
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtdateofbirth.Text = DateTime.Today.ToString("dd/MM/yyyy");
            if (!IsPostBack)
            {
                //BindUserGrid();
                DataTable dt = new DataTable();
                dt = binddt("Select * from OCTY");
                ddlcity.DataSource = dt;
                ddlcity.DataBind();
                ddlcity.Items.Insert(0, "---Select---");

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DB_Con"].ToString());
                SqlCommand cmd = new SqlCommand("select * from OEMP", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gvuser.DataSource = ds;
                gvuser.DataBind();
            }

        }

        //private void BindUserGrid()
        //{
            
        //}

        public DataTable binddt(string s)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DB_Con"].ToString());

            try
            {
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = s;
                con.Open();
                cmd.ExecuteScalar();
                sda.Fill(dt);
                con.Close();
                cmd.Dispose();
            }
            catch (Exception e1)
            {

            }
            return dt;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fliename = "";
            if (fuimage.HasFile)
            {
               fliename = Path.GetFileName(fuimage.PostedFile.FileName);
                fuimage.PostedFile.SaveAs(Server.MapPath("~/ImgUpload/") + fliename);

            }

            string str = "INSERT INTO OEMP(FirstName,LastName,Email,Mobile,Gender,Dateofbirth,CityID,Photo)VALUES('" + txtfname.Text + "','" + txtlname.Text + "','" + txtemail.Text + "','" + txtmobile.Text + "','" + RdblGender.Text + "','" + txtdateofbirth.Text + "','" + ddlcity.SelectedValue + "','" + fliename + "')";
            selectsql(str);
            Session["username"] = txtfname.Text;
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MSG", "alert('Register successfully.'); window.location = 'About.aspx';", true);
        }
        private void selectsql(string a)
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DB_Con"].ToString());

            try
            {
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = a;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                cmd.Dispose();
            }
            catch (Exception e1)
            {
                con.Close();
            }
        }

        //protected void gvuser_RowDataBound(object sender, GridViewRowEventArgs e)
        //{

        //}

        //protected void gvuser_RowEditing(object sender, GridViewEditEventArgs e)
        //{

        //}

        //protected void gvuser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{

        //}

        //protected void gvuser_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{

        //}

        //protected void gvuser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{

        //}
    }
}