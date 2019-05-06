using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace refonteFormulaire
{
    public partial class Categorie : System.Web.UI.Page
    {
        ConnectionStringSettings connectSetting = ConfigurationManager.ConnectionStrings["ConnectionBDD"];
        protected void Page_Load(object sender, EventArgs e)
        {
         
            string resultat = getDataCategorie();

            lblCategorie.Text = "Les Categories";
            CategorieId.Controls.Add(new LiteralControl(resultat));
            

            if (!IsPostBack)
            {
                DropDownListIdnomSport.DataSource = GetData("spGetClub", null);
                DropDownListIdnomSport.DataBind();

                ListItem liCate = new ListItem("Select Id/Sport", "-1");
                DropDownListIdnomSport.Items.Insert(0, liCate);
            
                DropDownListModId.DataSource = GetData("spGetCategorie", null );
                DropDownListModId.DataBind();

                ListItem lid = new ListItem("Select Id/Categorie", "-1");
                DropDownListModId.Items.Insert(0, lid);

                ModificationSport.DataSource = GetData("spGetClub", null);
                ModificationSport.DataBind();

                ListItem liSport = new ListItem("Select Sport/Club", "-1");
                ModificationSport.Items.Insert(0, liSport);

          
                DropDownList1IdSuppCate.DataSource = GetData("spGetCategorie", null);
                DropDownList1IdSuppCate.DataBind();

                ListItem liCate2 = new ListItem("Select Id/Categorie", "-1");
                DropDownList1IdSuppCate.Items.Insert(0, liCate2);
            }
        }

        public string getDataCategorie()
        {
            string html = "<table class='table table-bordered' style='width: 1000px; margin: auto;'><thead><tr><th>Id</th><th>Nom</th><th>Sport/Club</th></tr></thead>";
            
            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);

            con.Open();
            DataTable table = new DataTable();
            string Query = "SELECT Id_Cate, Label, nomSport FROM CATEGORIE inner join CLUB on CATEGORIE.Id_Club2 = CLUB.Id order by nomSport ASC";
            using (var cmd = new SqlCommand(Query, con))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                adapter.Fill(table);
                foreach (DataRow row in table.Rows)
                {
                    string Id_Cate = row["Id_Cate"].ToString();
                    string Label = row["Label"].ToString();
                    string monsport = row["nomSport"].ToString();

                    
                    html += "<tbody><tr><td>" + Id_Cate + "</td><td>" + Label + "</td><td>" + monsport + "</td></tr></tbody>";
                }

                html += "</table>";
            }
            con.Close();
            return html;
        }

        private DataSet GetData(string SPName, SqlParameter SSParameter)
        {
            string CS = ConfigurationManager.ConnectionStrings["ConnectionBDD"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter(SPName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (SSParameter != null)
            {
                da.SelectCommand.Parameters.Add(SSParameter);
            }

            DataSet DS = new DataSet();
            da.Fill(DS);

            return DS;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string NomCate = LableCateInpute.Value;
            string NomsportCateRecup = DropDownListIdnomSport.SelectedItem.Value;
            try
            {
                insertCategorie(NomsportCateRecup, NomCate);
                Response.Redirect("Categorie.aspx");
            }
            catch
            {
                Response.Write("La catecorie ne peut être ajpouté");
            }
        }

        public void insertCategorie(string NomsportCateRecup, string NomCate)
        {
            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);
            con.Open();
            string Query = "insert into CATEGORIE(Id_Club2, Label) values('" + NomsportCateRecup + "','" + NomCate + "')";
            using (var cmd = new SqlCommand(Query, con))
            {
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string IdRecup = DropDownListModId.SelectedValue;
            string LabelRecup = nomCateInput.Value;
            string Id_Club2Recup = ModificationSport.SelectedValue;
            try
            {
               UpdateCategorie(IdRecup, LabelRecup, Id_Club2Recup);
               Response.Redirect("Categorie.aspx");
            }
            catch
            {
                Response.Write("La Catégorie ne peut pas ête modifié");
            }
        }

        public void UpdateCategorie(string IdRecup, string LabelRecup, string Id_Club2Recup)
        {
            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);
            con.Open();
            string Query = "Update CATEGORIE set Label='" + LabelRecup + "', Id_Club2='" + Id_Club2Recup + "' where Id_Cate='" + IdRecup + "'";
            using (var cmd = new SqlCommand(Query, con))
            {
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string IdCategorie = DropDownList1IdSuppCate.SelectedValue;
            try
            {
                DeleteCategorie(IdCategorie);
                Response.Redirect("Categorie.aspx");
            }
            catch
            {
                Response.Write("Suppression impossible");
            }
        }

        public void DeleteCategorie(string IdCategorie)
        {
            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);
            con.Open();
            string Query3 = "Delete from ADHERANT where Id_Categorie='" + IdCategorie + "'";
            using (var cmd3 = new SqlCommand(Query3, con))
            {
                cmd3.ExecuteNonQuery();
            }
            string Query = "Delete from CATEGORIE where Id_Cate='" + IdCategorie + "'";
            using (var cmd = new SqlCommand(Query, con))
            {
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }
    }
}