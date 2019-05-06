<%@ Page Title="" Language="C#" MasterPageFile="~/navBar.Master" AutoEventWireup="true" CodeBehind="Club.aspx.cs" Inherits="refonteFormulaire.Club" %>
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <form id="form1" runat="server" class="auto-style2">
        <h1 class="auto-style1">
            <asp:Label ID="lblClub" runat="server" Text="Label"></asp:Label>
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
            <div runat="server" id="ClubId"></div>
        </div>
        <div>
            <asp:Label ID="lblAjoutSportClub" runat="server" Text=""></asp:Label>
            <h1 class="text-center" id="Ajouter">Ajouter un sport et un Club</h1>
            <br />
            <div class="container">
                <div style="text-align: initial">
                    <div class="form-group row">
                        <div class="col-mb-6">
                            <label for="nomSport">Nom Sport</label>
                            <input class="form-control" id="nomSport" type="text" runat="server" validationgroup="Form1" causesvalidation="True" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Votre Nom" ControlToValidate="nomSport" ForeColor="Red" ValidationGroup="Form1" Display="Dynamic">Nom requis.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ControlToValidate="nomSport"
                                Display="Dynamic"
                                ErrorMessage="Nom" ForeColor="Red"
                                ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ValidationGroup="Form1">Nom non valide. 
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="col-mb-6">
                            <label for="nombre">Nb Ahdérant Max</label>
                            <input class="form-control" id="NbAdhMax" type="text" runat="server" validationgroup="Form1" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Votre NombreAhdMax" ControlToValidate="NbAdhMax" ForeColor="Red" ValidationGroup="Form1" Display="Dynamic">Nombre requis.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                ControlToValidate="NbAdhMax"
                                Display="Dynamic"
                                ErrorMessage="Nom" ForeColor="Red"
                                ValidationExpression="^[0-9]+$" ValidationGroup="Form1">Nombre non valide. 
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="col-mb-6">
                            <label for="prix">Prix</label>
                            <input class="form-control" id="Prix" type="text" runat="server" validationgroup="Form1" causesvalidation="True" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Votre Prix" ControlToValidate="Prix" ForeColor="Red" ValidationGroup="Form1" Display="Dynamic">Prix requis.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                ControlToValidate="Prix"
                                Display="Dynamic"
                                ErrorMessage="Prix" ForeColor="Red"
                                ValidationExpression="^\d+$" ValidationGroup="Form1">Prix non valide. 
                            </asp:RegularExpressionValidator>
                        </div>
                        <div>
                            <input id="Id" runat="server" class="hidden" />
                        </div>
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="Valider" class="btn btn-primary" ValidationGroup="Form1" OnClick="Button1_Click" />
                </div>

            </div>
        </div>
        <div>
            <asp:Label ID="lblModifSport" runat="server" Text=""></asp:Label>
            <h1 class="text-center" id="Modifier">Modifier Club et Sport</h1>
            <div class="container">
                <div class="col-sm-3">
                    <strong>
                    <asp:Label ID="Label1" runat="server" Text="Selectionne l'id/Club"></asp:Label>
                    </strong><br />
                    <asp:DropDownList ID="DropDownListId" runat="server" ValidationGroup="Form2" DataValueField="Id" DataTextField="Id"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="DropDownListId" InitialValue="-1" runat="server" ErrorMessage="Selectinner un Id" ForeColor="Red" ValidationGroup="Form2"></asp:RequiredFieldValidator>

                </div>
                <div style="text-align: initial">
                    <div class="col-sm-3">
                        <label for="Nom">Nom Sport</label>
                        <input class="form-control" id="nomSportinput" type="text" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Votre Nom" ControlToValidate="nomSportinput" InitialValue="" ForeColor="Red" ValidationGroup="Form2">Nom requis.</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                            ControlToValidate="nomSportinput"
                            Display="Dynamic"
                            ErrorMessage="Nom" ForeColor="Red"
                            ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ValidationGroup="Form2">Nom non valide. 
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-sm-3">
                        <label for="Nom">NbAdherant</label>
                        <input class="form-control" id="NbAdherantInput" type="text" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Votre NombreAhdMax" ControlToValidate="NbAdherantInput" InitialValue="" ForeColor="Red" ValidationGroup="Form2">Nombre requis.</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                            ControlToValidate="NbAdherantInput"
                            Display="Dynamic"
                            ErrorMessage="Nom" ForeColor="Red"
                            ValidationExpression="^[0-9]+$" ValidationGroup="Form2">Nombre non valide. 
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-sm-3">
                        <label for="Nom">Prix</label>
                        <input class="form-control" id="PrixInput" type="text" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Votre Prix" ControlToValidate="PrixInput" InitialValue="" ForeColor="Red" ValidationGroup="Form2">Prix requis.</asp:RequiredFieldValidator>               
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                            ControlToValidate="PrixInput"
                            Display="Dynamic"
                            ErrorMessage="Prix" ForeColor="Red"
                            ValidationExpression="^\d+$" ValidationGroup="Form2">Prix non valide. 
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <asp:Button ID="modifierclub" runat="server" Text="Enregistrer" class="btn btn-primary" ValidationGroup="Form2" OnClick="modifierclub_Click"/>
            </div>
        </div>
        <div class="text-center">
            <h1 class="text-center" ID="Supprimer"> 
                <asp:Label ID="Supp" runat="server" Text="Supprimer Club et Sport"></asp:Label>
            </h1>
            <asp:DropDownList ID="DropDownList1IdSupp" runat="server" DataTextField="Id" DataValueField="Id" ValidationGroup="Form3"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="DropDownList1IdSupp" InitialValue="-1" runat="server" ErrorMessage="Selectinner un Id" ForeColor="Red" ValidationGroup="Form3"></asp:RequiredFieldValidator>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Supprimer" class="btn btn-primary" OnClick="Button2_Click" ValidationGroup="Form3"/>
            <br />
            <br />
        </div>
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
