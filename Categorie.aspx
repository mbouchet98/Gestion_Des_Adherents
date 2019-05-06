<%@ Page Title="" Language="C#" MasterPageFile="~/navBar.Master" AutoEventWireup="true" CodeBehind="Categorie.aspx.cs" Inherits="refonteFormulaire.Categorie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" id="Form3" class="auto-style2">
        <h1 class="text-center">
            <asp:Label ID="lblCategorie" runat="server" Text="Label"></asp:Label>
        </h1>
        <div>
            <table align="center">
                <tr>
                    <td class="text-center">
                        <a href="#Modifier" class="btn btn-primary" style="margin: 10px">Modifier</a></td>

                    <td class="text-center">
                        <a href="#Supprimer" class="btn btn-primary" style="margin: 10px">Supprimer</a></td>

                    <td class="text-center">
                        <a href="#Ajouter" class="btn btn-primary" style="margin: 10px">Ajouter</a></td>
                </tr>
            </table>
        </div>
        <div>
            <div class="text-center">
            </div>
            <div runat="server" id="CategorieId"></div>
        </div>
        <div>
            <asp:Label ID="lblCategorie2" runat="server" Text=""></asp:Label>
            <h1 class="text-center" id="Ajouter">Ajouter une Categorie</h1>
            <br />
            <div class="container">
                <div class="form-group row" />
                <div class="col-mb-6">
                    <label for="categorie">Categorie</label><br />
                    <input class="form-control" id="LableCateInpute" type="text" runat="server" validationgroup="From1" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Votre Categorie" ControlToValidate="LableCateInpute" InitialValue="" ForeColor="Red" validationgroup="From1">Categorie requis.</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                        ControlToValidate="LableCateInpute"
                        Display="Dynamic"
                        ErrorMessage="Categorie" ForeColor="Red"
                        ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" validationgroup="From1">Categorie non valide. 
                    </asp:RegularExpressionValidator>
                </div>
                <div class="col-mb-6" runat="server">
                    <label for="Sport">Sport</label><br />
                    <asp:DropDownList ID="DropDownListIdnomSport" runat="server" DataTextField="nomSport" DataValueField="Id" validationgroup="From1"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListIdnomSport" InitialValue="-1" ErrorMessage="Selectionner un Sport" ForeColor="Red" validationgroup="From1"></asp:RequiredFieldValidator>
                </div>
                <p class="text7">
                    Tout les champs doivent etre remplis !!!
                </p>
                <asp:Button ID="Button1" runat="server" Text="Valider" class="btn btn-primary" validationgroup="From1" OnClick="Button1_Click"/>
            </div>
        </div>
        <div>
            <asp:Label ID="lblModif" runat="server" Text=""></asp:Label>
            <h1 class="text-center" id="Modifier">Modifier Categorie</h1>
            <div class="container">
                <div runat="server">
                    <br />
                    <div class="form-group row" />
                    <div class="col-mb-6" runat="server">
                        <label for="ModId">Selectionner Id</label><br />
                        <asp:DropDownList ID="DropDownListModId" runat="server" DataTextField="Id_Cate" DataValueField="Id_Cate" ValidationGroup="Form2" ></asp:DropDownList>
                        <asp:RequiredFieldValidator ValidationGroup="Form2" ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListModId" InitialValue="-1" ErrorMessage="Selectionner un Sport" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-mb-6" runat="server">
                        <label for="Modification">Sport/Club</label><br />
                        <asp:DropDownList ID="ModificationSport" runat="server" DataTextField="nomSport" DataValueField="Id" ValidationGroup="Form2"></asp:DropDownList>
                        <asp:RequiredFieldValidator ValidationGroup="Form2" ID="RequiredFieldValidator3" runat="server" ControlToValidate="ModificationSport" InitialValue="-1" ErrorMessage="Selectionner un Sport" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-mb-6">
                        <label for="Label">Nom</label>
                        <input class="form-control" id="nomCateInput" type="text" runat="server" ValidationGroup="Form2" />
                        <asp:RequiredFieldValidator  ValidationGroup="Form2" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Votre Categorie" ControlToValidate="nomCateInput" InitialValue="" ForeColor="Red">Categorie requis.</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="nomCateInput" ValidationGroup="Form2"
                            Display="Dynamic"
                            ErrorMessage="Categorie" ForeColor="Red"
                            ValidationExpression="^[a-zA-Z''-'\s]{1,40}$">Categorie non valide. 
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
            <p />
            <asp:Button ID="Button6" runat="server" Text="Enregistrer" class="btn btn-primary"  ValidationGroup="Form2" OnClick="Button6_Click"/>
        </div>
        <div>
            <h1 class="text-center" id="Supprimer">
                <asp:Label ID="lblSuppCate" runat="server" Text="Supprimer Categorie"></asp:Label>
            </h1>
            <div class="text-center">
            <asp:DropDownList ID="DropDownList1IdSuppCate" runat="server" DataTextField="Id_Cate" DataValueField="Id_Cate" ValidationGroup="Form3" Height="22px" Width="173px"></asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="DropDownList1IdSuppCate" InitialValue="-1" runat="server" ErrorMessage="Selectinner un Id" ForeColor="Red" ValidationGroup="Form3"></asp:RequiredFieldValidator>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Supprimer" class="btn btn-primary" ValidationGroup="Form3" OnClick="Button2_Click"/>
            <br />
            <br />
            </div>
        </div>
    </form>
    <a onclick="topFunction()" id="myBtn" title="Go to top">
        <img src="Image/Scroll.png" style="height: 25px; width: 25px;" /></a>
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
