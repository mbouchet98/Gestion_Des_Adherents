using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.WebControls.Adapters;
using System.Web.UI.WebControls.Expressions;
namespace refonteFormulaire
{
    public partial class Adherant : System.Web.UI.Page
    {
        ConnectionStringSettings connectSetting = ConfigurationManager.ConnectionStrings["ConnectionBDD"];
        protected void Page_Load(object sender, EventArgs e)
        {
            string resultat = getDatasAdherant();

            lblAdhrant.Text = "Les Adherants";

            //AdherantId.Controls.Add(new LiteralControl(resultat));

            if (!IsPostBack)
            {
                selectSport3.DataSource = GetData("spGetClub", null);
                selectSport3.DataBind();

                ListItem liSport = new ListItem("Select Sport", "-1");
                selectSport3.Items.Insert(0, liSport);

                ListItem liCate = new ListItem("Select Categorie", "-1");
                selectSport6.Items.Insert(0, liCate);

                selectSport6.Enabled = false;

                //IdAdh.DataSource = GetData("spGatAdherant", null);
                //IdAdh.DataBind();

                //ListItem liAdh = new ListItem("Select Id/Adh", "-1");
                //IdAdh.Items.Insert(0, liAdh);

                DropDownList1IdSuppAdh.DataSource = GetData("spGatAdherant", null);
                DropDownList1IdSuppAdh.DataBind();

                ListItem liAdh2 = new ListItem("Select Id/Adh", "-1");
                DropDownList1IdSuppAdh.Items.Insert(0, liAdh2);


            }

        }

    

        public string getDatasAdherant()
        {
            string html = "";

            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);
            con.Open();

            DataTable table = new DataTable();
            string Query = "select Id_Adh, Nom, Prenom, Adresse, nomSport, Label, Email, DateNaissance From CATEGORIE Inner join ADHERANT on CATEGORIE.Id_Cate = ADHERANT.Id_Categorie inner join CLUB on ADHERANT.Id_Club = CLUB.Id order by Nom ASC;";
            using (var cmd = new SqlCommand(Query, con))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                adapter.Fill(table);
                foreach (DataRow row in table.Rows)
                {
                    string Id_Adh = row["Id_Adh"].ToString();
                    string Nom = row["Nom"].ToString();
                    string Prenom = row["Prenom"].ToString();
                    string Adresse = row["Adresse"].ToString();
                    string nomSport = row["nomSport"].ToString();
                    string maCategorie = row["Label"].ToString();
                    string Email = row["Email"].ToString();
                    string DateNaissance = row["DateNaissance"].ToString();

                   
                    LinkButton lnkLModi = new LinkButton();
                    lnkLModi.ID = "LinkButton" + Id_Adh;
                    lnkLModi.Text = "Modifier";
                    lnkLModi.CommandName = "Modifier";
                    lnkLModi.CommandArgument = Id_Adh;
                    lnkLModi.PostBackUrl = "#Modifier";
                    lnkLModi.Click += new EventHandler(LinkButton_Command);
            
                }
            }
            con.Close();
            return html;
        }

        public void LinkButton_Command(Object sender, EventArgs e)
        {
            PanelModificationAdh.Visible = true;
            PanelTableAdh.Visible = false;
            LinkButton btn = (LinkButton)(sender);
            string yourValue = btn.CommandArgument;

            List<string> lister = GetDataAdherantById(yourValue);
            string id = lister[0];
            string nomSport = lister[1];
            string Nom = lister[2];
            string Prenom = lister[3];
            string Adres = lister[4];
            string maCate = lister[5];
            string email = lister[6];
            string DateNaissance = lister[7];


            Modification2.DataSource = GetData("spGetClub", null);
            Modification2.DataBind();

            ListItem liSport = new ListItem("Select Sport", "-1");
            Modification2.Items.Insert(0, liSport);

            ListItem liCate = new ListItem("Select Categorie", "-1");
            ModCategorie2.Items.Insert(0, liCate);

            ModCategorie2.Enabled = false;


            Modification2.SelectedValue = nomSport;
            nom2.Value = Nom;
            prenom2.Value = Prenom;
            adresse2.Value = Adres;
            email2.Value = email;
            dateNaissance2.Value = DateNaissance;
            IdAdh.Value = id;

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

        protected void selectSport3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (selectSport3.SelectedIndex == 0)
            {
                selectSport6.SelectedIndex = 0;
                selectSport6.Enabled = false;

            }
            else
            {
                selectSport6.Enabled = true;
                SqlParameter parameter = new SqlParameter("@Id_Club2", selectSport3.SelectedValue);
                DataSet DS = GetData("spGetCategorieByClubId", parameter);

                selectSport6.DataSource = DS;
                selectSport6.DataBind();

                ListItem liCate = new ListItem("Select Categorie", "-1");
                selectSport6.Items.Insert(0, liCate);
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nomRecup = nom.Value;
            string prenomRecup = prenom.Value;
            string adresseRecup = adresse.Value;
            string emailRecup = email.Value;
            string dateNaissanceRecup = dateNaissance.Value;
            string idcategorieRecup = selectSport6.SelectedItem.Value;
            string id_ClubRecup = selectSport3.SelectedItem.Value;

            try
            {
                insertAdherant(id_ClubRecup, nomRecup, prenomRecup, adresseRecup, idcategorieRecup, emailRecup, dateNaissanceRecup);
                Response.Redirect("Adherant.aspx");
            }
            catch
            {
                Response.Write("Adherant ne peut pas être ajouté");
            }
        }

        public void insertAdherant(string id_ClubRecup, string nomRecup, string prenomRecup, string adresseRecup, string idcategorieRecup, string emailRecup, string dateNaissanceRecup)
        {
            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);
            con.Open();
            string Query = "insert into Adherant(Id_Club, Nom, Prenom, Adresse, Id_Categorie, Email, DateNaissance) values('" + id_ClubRecup + "','" + nomRecup + "','" + prenomRecup + "','" + adresseRecup + "','" + idcategorieRecup + "','" + emailRecup + "','" + dateNaissanceRecup + "')";
            using (var cmd = new SqlCommand(Query, con))
            {
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }

        public List<string> GetDataAdherantById(string IdAdherant)
        {
            List<string> datas = new List<string>();
            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);

            con.Open();
            DataTable table = new DataTable();
            string Query = "select * FROM ADHERANT WHERE Id_Adh= " + IdAdherant;
            using (var cmd = new SqlCommand(Query, con))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                adapter.Fill(table);
                foreach (DataRow row in table.Rows)
                {

                    string Id = row["Id_Adh"].ToString();
                    string Id_Club = row["id_Club"].ToString();
                    string Nom = row["Nom"].ToString();
                    string Prenom = row["Prenom"].ToString();
                    string Adresse = row["Adresse"].ToString();
                    string Id_Categorie = row["Id_Categorie"].ToString();
                    string Email = row["Email"].ToString();
                    string DateNaissance = row["DateNaissance"].ToString();

                    datas.Add(Id);
                    datas.Add(Id_Club);
                    datas.Add(Nom);
                    datas.Add(Prenom);
                    datas.Add(Adresse);
                    datas.Add(Id_Categorie);
                    datas.Add(Email);
                    datas.Add(DateNaissance);
                }
            }
            con.Close();
            return datas;
        }

        protected void modifierAdh_Click(object sender, EventArgs e)
        {
            string nomRecup = nom2.Value;
            string prenomRecup = prenom2.Value;
            string adresseRecup = adresse2.Value;
            string idRecup = IdAdh.Value;
            string Id_ClubRecup = Modification2.SelectedValue;
            string Id_CategorieRecup = ModCategorie2.SelectedValue;
            string emailRecup = email2.Value;
            string DateNaissanceRecup = dateNaissance2.Value;
            try { 
            UpdateAdherant(Id_ClubRecup, nomRecup, prenomRecup, adresseRecup, Id_CategorieRecup, idRecup, emailRecup, DateNaissanceRecup);
            Response.Redirect("Adherant.aspx");
            }
            catch
            {
                Response.Write("Adherant non modifier");
            }
        }

        protected void Modification2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Modification2.SelectedIndex == 0)
            {
                ModCategorie2.SelectedIndex = 0;
                ModCategorie2.Enabled = false;

            }
            else
            {
                ModCategorie2.Enabled = true;
                SqlParameter parameter = new SqlParameter("@Id_Club2", Modification2.SelectedValue);
                DataSet DS = GetData("spGetCategorieByClubId", parameter);

                ModCategorie2.DataSource = DS;
                ModCategorie2.DataBind();

                ListItem liCate = new ListItem("Select Categorie", "-1");
                ModCategorie2.Items.Insert(0, liCate);
            }
        }
        public void UpdateAdherant(string Id_ClubRecup, string nomRecup, string prenomRecup, string adresseRecup, string Id_CategorieRecup, string idRecup, string emailRecup, string DateNaissanceRecup)
        {
            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);
            con.Open();
            string Query = "Update ADHERANT set Id_Club='" + Id_ClubRecup + "', Nom='" + nomRecup + "', Prenom='" + prenomRecup + "', Adresse='" + adresseRecup + "', Id_Categorie='" + Id_CategorieRecup + "', " +
                "DateNaissance='" + DateNaissanceRecup + "',  Email='" + emailRecup + "' where Id_Adh='" + idRecup + "'";
            using (var cmd = new SqlCommand(Query, con))
            {
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }

        protected void SuppAdh_Click(object sender, EventArgs e)
        {
            string idRecup = DropDownList1IdSuppAdh.SelectedItem.Value;
            try {
                DeleteAdherant(idRecup);
                Response.Redirect("Adherant.aspx");

            }
            catch
            {
                Response.Write("Adherant ne peut pas etre supprimé");
            }
        }
        public void DeleteAdherant(string idRecup)
        {
            SqlConnection con = new SqlConnection(connectSetting.ConnectionString);
            con.Open();
            string Query = "Delete from Adherant where Id_Adh='" + idRecup + "'";
            using (var cmd = new SqlCommand(Query, con))
            {
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }


    }
}