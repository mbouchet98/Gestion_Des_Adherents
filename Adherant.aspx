<%@ Page Title="" Language="C#" MasterPageFile="~/navBar.Master" AutoEventWireup="true" CodeBehind="Adherant.aspx.cs" Inherits="refonteFormulaire.Adherant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .auto-style1 {
            height: 51px;
            text-align: center;
            margin-top: 119px;
        }
        .auto-style2 {
            margin-top: 169px;
        }
         #myBtn {
          display: none;
          position: fixed;
          bottom: 20px;
          right: 30px;
          z-index: 99;
          font-size: 18px;
          border: none;
          outline: none;
          background-color: #555;
          color: white;
          cursor: pointer;
          padding: 15px;
          border-radius: 4px;
        }

        #myBtn:hover {
          background-color: #555;
        }
            .auto-style3 {
                text-align: center;
                height: 20px;
            }
            </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="auto-style2">
        <h1 class="auto-style1">
            <asp:Label ID="lblAdhrant" runat="server" Text="Label"></asp:Label>
        </h1>
        <div>
            <table align="center">
                <tr>
                    <td class="auto-style3">
                        <a href="#Modifier" class="btn btn-primary" style="margin: 10px">Modifier</a></td>

                    <td class="auto-style3">
                        <a href="#Supprimer" class="btn btn-primary" style="margin: 10px">Supprimer</a></td>

                    <td class="auto-style3">
                        <a href="#Ajouter" class="btn btn-primary" style="margin: 10px">Ajouter</a></td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="PanelTableAdh" Visible="true" runat="server">
            <div>
                <div class="text-center">
                </div>
                <table class='table table-bordered' style='width: 1000px; margin: auto;'>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nom</th>
                            <th>Prenom</th>
                            <th>Adresse</th>
                            <th>Sport/Club</th>
                            <th>Categorie</th>
                            <th>Email</th>
                            <th>DateNaissance</th>
                        </tr>
                        <tr>
                            <asp:Label ID="TableAdh" runat="server"></asp:Label>
                         
                            <asp:Label ID="Label1" runat="server"></asp:Label>   
                        </tr>
                        
                    </thead>
                    </table>
            </div></asp:Panel>
       
        <asp:Panel runat="server" ID="PanelAouterAdh" Visible="false">
            <div>
                <asp:Label ID="lblAjoutAdherant" runat="server" Text=""></asp:Label>
                <h1 class="text-center" id="Ajouter">Ajouter un Adherant</h1>
                <br />
                <div class="container">
                    <div style="text-align: initial">
                        <div class="form-group row">
                            <div class="col-mb-6">
                                <label for="nom">Nom</label>
                                <input class="form-control" id="nom" type="text" runat="server" validationgroup="form1" />
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Votre Nom" ControlToValidate="nom" InitialValue="" ForeColor="Red" ValidationGroup="form1">Nom requis.</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ControlToValidate="nom"
                                    Display="Dynamic"
                                    ErrorMessage="Nom" ForeColor="Red"
                                    ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ValidationGroup="form1">Nom non valide. 
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="col-mb-6">
                                <label for="prenom">Prenom</label>
                                <input class="form-control" id="prenom" type="text" runat="server" validationgroup="form1" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Votre Prenom" ControlToValidate="prenom" InitialValue="" ForeColor="Red" ValidationGroup="form1">Prenom requis.</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                    ControlToValidate="prenom"
                                    Display="Dynamic"
                                    ErrorMessage="Prenom" ForeColor="Red"
                                    ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ValidationGroup="form1">Prenom non valide. 
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="col-mb-6">
                                <label for="adresse">Adresse</label>
                                <input class="form-control" id="adresse" type="text" runat="server" validationgroup="form1" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Votre Adresse" ControlToValidate="adresse" InitialValue="" ForeColor="Red" ValidationGroup="form1">Adresse requis.</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"
                                    ControlToValidate="adresse"
                                    Display="Dynamic"
                                    ErrorMessage="Adresse" ForeColor="Red"
                                    ValidationExpression="[0-9a-zA-Z #,-]+" ValidationGroup="form1">Adresse non valide ex : 46 rue exemple. 
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="col-md-6">
                                <label for="Sport">Sport</label><br />
                                <asp:DropDownList ID="selectSport3" runat="server" DataTextField="nomSport" DataValueField="Id" OnSelectedIndexChanged="selectSport3_SelectedIndexChanged" AutoPostBack="true" Height="22px" Width="173px" ValidationGroup="form1"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="selectSport3" InitialValue="-1" runat="server" ErrorMessage="Selectinner un Sport" ForeColor="Red" ValidationGroup="form1"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6">
                                <label for="categorie">Categorie</label><br />
                                <asp:DropDownList ID="selectSport6" runat="server" DataTextField="Label" DataValueField="Id_Cate" Height="19px" Width="174px" ValidationGroup="form1"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="selectSport6" InitialValue="-1" runat="server" ErrorMessage="Selectinner une Categorie" ForeColor="Red" ValidationGroup="form1"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6">
                                <label for="date">Date de Naissance</label>
                                <input class="form-control" id="dateNaissance" type="text" runat="server" validationgroup="form1" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Votre Date de Naissance" ControlToValidate="dateNaissance" InitialValue="" ForeColor="Red" ValidationGroup="form1">Date de Naissance requis.</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                                    ControlToValidate="dateNaissance"
                                    Display="Dynamic"
                                    ErrorMessage="DateNaissance" ForeColor="Red"
                                    ValidationExpression="^[0-9m]{1,2}/[0-9d]{1,2}/[0-9y]{4}$" ValidationGroup="form1">Date de Naissance non valide ex : JJ/MM/AA . 
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="col-md-6">
                                <label for="email">Email</label>
                                <input class="form-control" id="email" type="text" runat="server" validationgroup="form1" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Votre Email" ControlToValidate="email" InitialValue="" ForeColor="Red" ValidationGroup="form1">Email requis.</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                    ControlToValidate="email"
                                    Display="Dynamic"
                                    ErrorMessage="DateNaissance" ForeColor="Red"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="form1">Email non valide ex :NomPrenom@gmail.com. 
                                </asp:RegularExpressionValidator>
                            </div>
                            <div>
                                <input id="Id_Adh" runat="server" class="hidden" />
                            </div>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Valider" class="btn btn-primary" ValidationGroup="form1" OnClick="Button1_Click" />
                    </div>

                </div>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="PanelModificationAdh" Visible="False">
            <div>
                <asp:Label ID="lblModifAdherant" runat="server" Text=""></asp:Label>
                <h1 class="text-center" id="Modifier">Modifier Adherant</h1>
                <div class="container">
                    <div class="col-sm-3">
                         <input type="text" name="Id" hidden="hidden" id="IdAdh" runat="server" />
                    </div>
                    <div style="text-align: initial">
                        <div class="col-sm-3">
                            <label for="nom">Nom</label>
                            <input class="form-control" id="nom2" type="text" runat="server" validationgroup="form1" />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Votre Nom" ControlToValidate="nom2" InitialValue="" ForeColor="Red" ValidationGroup="Form2">Nom requis.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                ControlToValidate="nom2"
                                Display="Dynamic"
                                ErrorMessage="Nom" ForeColor="Red"
                                ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ValidationGroup="Form2">Nom non valide. 
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="col-sm-3">
                            <label for="prenom">Prenom</label>
                            <input class="form-control" id="prenom2" type="text" runat="server" validationgroup="form1" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Votre Prenom" ControlToValidate="prenom2" InitialValue="" ForeColor="Red" ValidationGroup="Form2">Prenom requis.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                ControlToValidate="prenom2"
                                Display="Dynamic"
                                ErrorMessage="Prenom" ForeColor="Red"
                                ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ValidationGroup="Form2">Prenom non valide. 
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="col-sm-3">
                            <label for="adresse">Adresse</label>
                            <input class="form-control" id="adresse2" type="text" runat="server" validationgroup="form1" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Votre Adresse" ControlToValidate="adresse2" InitialValue="" ForeColor="Red" ValidationGroup="Form2">Adresse requis.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                ControlToValidate="adresse2"
                                Display="Dynamic"
                                ErrorMessage="Adresse" ForeColor="Red"
                                ValidationExpression="[0-9a-zA-Z #,-]+" ValidationGroup="Form2">Adresse non valide ex : 46 rue exemple. 
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="col-sm-3">
                            <label for="Sport">Sport</label><br />
                            <asp:DropDownList ID="Modification2" runat="server" DataTextField="nomSport" DataValueField="Id" AutoPostBack="true" Height="22px" Width="173px" ValidationGroup="form1" OnSelectedIndexChanged="Modification2_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Modification2" InitialValue="-1" runat="server" ErrorMessage="Selectinner un Sport" ForeColor="Red" ValidationGroup="Form2"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-3">
                            <label for="categorie">Categorie</label><br />
                            <asp:DropDownList ID="ModCategorie2" runat="server" DataTextField="Label" DataValueField="Id_Cate" Height="19px" Width="174px" ValidationGroup="form1"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ModCategorie2" InitialValue="-1" runat="server" ErrorMessage="Selectinner une Categorie" ForeColor="Red" ValidationGroup="Form2"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-3">
                            <label for="date">Date de Naissance</label>
                            <input class="form-control" id="dateNaissance2" type="text" runat="server" validationgroup="form1" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Votre Date de Naissance" ControlToValidate="dateNaissance2" InitialValue="" ForeColor="Red" ValidationGroup="Form2">Date de Naissance requis.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                                ControlToValidate="dateNaissance"
                                Display="Dynamic"
                                ErrorMessage="DateNaissance" ForeColor="Red"
                                ValidationExpression="^[0-9m]{1,2}/[0-9d]{1,2}/[0-9y]{4}$" ValidationGroup="Form2">Date de Naissance non valide ex : JJ/MM/AA . 
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="col-sm-3">
                            <label for="email">Email</label>
                            <input class="form-control" id="email2" type="text" runat="server" validationgroup="form1" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Votre Email" ControlToValidate="email2" InitialValue="" ForeColor="Red" ValidationGroup="Form2">Email requis.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
                                ControlToValidate="email"
                                Display="Dynamic"
                                ErrorMessage="DateNaissance" ForeColor="Red"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Form2">Email non valide ex :NomPrenom@gmail.com. 
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <asp:Button ID="modifierAdh" runat="server" Text="Enregistrer" class="btn btn-primary" ValidationGroup="Form2" OnClick="modifierAdh_Click" />
                </div>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="PanelSupprimerAdh" Visible="False">
            <div class="text-center">
                <h1 class="text-center" id="Supprimer">
                    <asp:Label ID="Supp" runat="server" Text="Supprimer Adherant" ></asp:Label>
                </h1>
                <asp:DropDownList ID="DropDownList1IdSuppAdh" runat="server" DataTextField="Id_Adh" DataValueField="Id_Adh" ValidationGroup="Form3"></asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="DropDownList1IdSuppAdh" InitialValue="-1" runat="server" ErrorMessage="Selectinner un Id" ForeColor="Red" ValidationGroup="Form3"></asp:RequiredFieldValidator>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="SuppAdh" runat="server" Text="Supprimer" class="btn btn-primary" ValidationGroup="Form3" OnClick="SuppAdh_Click" />
                <br />
                <br />
            </div>
        </asp:Panel>
    </form>
    <a onclick="topFunction()"id="myBtn" title="Go to top"><img src="Image/Scroll.png" style="height:25px; width:25px; "/></a>
    <script>
                window.onscroll = function () { scrollFunction() };

                function scrollFunction() {
                    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                        document.getElementById("myBtn").style.display = "block";
                    } else {
                        document.getElementById("myBtn").style.display = "none";
                    }
                }

                function topFunction() {
                    document.body.scrollTop = 0;
                    document.documentElement.scrollTop = 0;
                }
            </script>
</asp:Content>
