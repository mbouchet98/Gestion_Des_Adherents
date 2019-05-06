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
    public partial class Club : System.Web.UI.Page
    {
        ConnectionStringSettings connectSetting = ConfigurationManager.ConnectionStrings["ConnectionBDD"];
        protected void Page_Load(object sender, EventArgs e)
        {

            string resultat = getDataClub();

            lblClub.Text = "Les Clubs";
            ClubId.Controls.Add(new LiteralControl(resultat));
           

            if (!IsPostBack)
            {
                DropDownListId.DataSource = GetData("spGetClub", null);
                DropDownListId.DataBind();

                ListItem liClub = new ListItem("Select Id/Club", "-1");
                DropDownListId.Items.Insert(0, liClub);
          
                DropDownList1IdSupp.DataSource = GetData("spGetClub", null);
                DropDownList1IdSupp.DataBind();

                ListItem liClub2 = new ListItem("Select Id/Club", "-1");
                DropDownList1IdSupp.Items.Insert(0, liClub2);
            }
        }
        public string getDataClub()
        {
            string html = "<table class='table table-bordered' style='width: 1000px;  margin: auto;  '><thead><tr><th>Id</th><th>NomSport</th><th>NbAdherantMax</th><th>prix</th></tr></thead>";

            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);

            con.Open();
            DataTable table = new DataTable();
            string Query = "SELECT * FROM CLUB order by nomSport ASC";
            using (var cmd = new SqlCommand(Query, con))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                adapter.Fill(table);
                foreach (DataRow row in table.Rows)
                {
                    string Id = row["Id"].ToString();
                    string NomSport = row["NomSport"].ToString();
                    string NbAdherantMax = row["NbAdherantMax"].ToString();
                    string prix = row["prix"].ToString();

                    html += "<tbody><tr><td>" + Id + "</td><td>" + NomSport + "</td><td>" + NbAdherantMax + "</td><td>" + prix + "</td></tr></tbody>";
                }

                html += "</table>";
            }
            con.Close();
            return html;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nomSportRecup = nomSport.Value;
            string NbAdherantMaxRecup = NbAdhMax.Value;
            string prixRecup = Prix.Value;
            try
            {
                insertClub(NbAdherantMaxRecup, nomSportRecup, prixRecup);
                Response.Redirect("Club.aspx");
            }
            catch
            {
                Response.Write("Club/Sport n'a pas pu être ajouté");
            }
        }

        public void insertClub(string NbAdherantMaxRecup, string nomSportRecup, string prixRecup)
        {
            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);
            con.Open();
            string Query = "insert into CLUB(NbAdherantMax, nomSport, prix) values('" + NbAdherantMaxRecup + "','" + nomSportRecup + "','" + prixRecup + "')";
            using (var cmd = new SqlCommand(Query, con))
            {
                cmd.ExecuteNonQuery();
            }
            con.Close();
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

        protected void modifierclub_Click(object sender, EventArgs e)
        {
            string nomSportRecup = nomSportinput.Value;
            string IdRecup = DropDownListId.SelectedValue;
            string NbAdherantMaxRecup = NbAdherantInput.Value;
            string prixRecup = PrixInput.Value;
            try
            {
                UpdateClub(IdRecup, nomSportRecup, NbAdherantMaxRecup, prixRecup);
                Response.Redirect("Club.aspx");
            }
            catch
            {
                Response.Write("Club/Sport n'a pas pu être modifier");
            }
        }

        public void UpdateClub(string IdRecup, string nomSportRecup, string NbAdherantMaxRecup, string prixRecup)
        {

            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);
            con.Open();
            string Query = "Update CLUB set  nomSport='" + nomSportRecup + "', NbAdherantMax='" + NbAdherantMaxRecup + "', prix='" + prixRecup + "' where id='" + IdRecup + "'";
            using (var cmd = new SqlCommand(Query, con))
            {

                cmd.ExecuteNonQuery();

            }

            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string IdClub = DropDownList1IdSupp.SelectedValue;
            try
            {
                DeleteClub(IdClub);
                Response.Redirect("Club.aspx");
            }
            catch
            {

                Response.Write("Sport non Supp");
            }
        }

        public void DeleteClub(string IdClub)
        {
            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);
            con.Open();

            string Query3 = "Delete from ADHERANT where Id_Club='" + IdClub + "'";
            using (var cmd3 = new SqlCommand(Query3, con))
            {
                cmd3.ExecuteNonQuery();
            }
            string Query4 = "Delete from CATEGORIE where Id_Club2='" + IdClub + "'";
            using (var cmd4 = new SqlCommand(Query4, con))
            {
                cmd4.ExecuteNonQuery();
            }
            string Query = "Delete from CLUB where Id='" + IdClub + "'";
            using (var cmd = new SqlCommand(Query, con))
            {
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }
    }
}