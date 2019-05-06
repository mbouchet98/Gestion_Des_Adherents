<%@ Page Title="" Language="C#" MasterPageFile="~/navBar.Master" AutoEventWireup="true" CodeBehind="Accueil.aspx.cs" Inherits="refonteFormulaire.Accueil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div id="myCarousel" class="carousel slide col-md-12" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner col-md-12">
                        <div class="item active">
                            <img src="Image/image/Club.png" alt="Club" width="480" height="500" />
                        </div>
                        <div class="item">
                            <img src="Image/image/sport.jpg" alt="sport" width="480" height="500" />
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="container col-md-12">
                    <div class="jumbotron">
                        <h1>Fait Du Sport</h1>
                        <p>Manger, Bouger et fait attention a votre allimentation</p>
                    </div>
                    <h3>Definition de Sport:</h3>
                    <p>
                        Activité physique visant à améliorer sa condition physique.
Ensemble des exercices physiques se présentant sous forme de jeux individuels ou collectifs, donnant généralement lieu à compétition, pratiqués en observant certaines règles précises.
Chacune des formes particulières de cette activité.
Familier. Toute activité nécessitant à la fois du savoir-faire et une particulière attention à ce que fait le partenaire : Avec lui, la conversation est un sport.
                    </p>
                    <h3>Definition de Club:</h3>
                    <p>
                        Association, société où l'on discute de problèmes économiques et politiques ; société de réflexion politique.
Cercle réservé à une société choisie où l'on se réunit pour causer, lire, jouer, etc.
Groupe fermé constitué par des personnes ou des pays disposant de certains pouvoirs ou ayant des intérêts similaires : Le club des puissances atomiques.
Société, association à buts divers (loisirs, sport, tourisme, etc.) : Club bouliste.
S'emploie en apposition avec ou sans trait d'union pour désigner des aménagements, des formules destinés aux membres d'un club : Hôtel club.
Formule de vente, utilisée notamment dans la diffusion du livre, caractérisée par le fait que les adhérents acceptent d'acheter un certain nombre d'ouvrages dans l'année.
                    </p>
                    <h3>Definition d'Adherant:</h3>
                    <p>
                        Qui est fixé, fortement attaché à quelque chose, qui colle à quelque chose : Papier peint très adhérent au mur.
Qui a la propriété de se fixer, de se coller : Une résine très adhérente.
                    </p>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    <footer class="container-fluid text-center">
        <p>Footer Text</p>
    </footer>
</asp:Content>
