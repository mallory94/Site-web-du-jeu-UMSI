<!doctype html>
<html>

<head>
<meta charset="UTF-8">
    <title>Scénario</title>
    <link rel="icon" type="image/png" href="./vue/images/icons/portail.png"/>
    <link rel="stylesheet" href="vue/css/livre.css">
    <link href="https://fonts.googleapis.com/css?family=Luckiest+Guy&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <script src="vue/js/livre.js"></script>
    <link rel="stylesheet" href="./vue/css/static_menu.css">
    <link rel="stylesheet" href="./vue/css/scenario.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="./vue/js/static_menu.js"></script>
</head>

<header id="menu">
		<div class="container">
          
          <ul class="links active_links">
            <li><a href="./index.php">Accueil</a></li>
            <li><a href="./index.php?controleur=utilisateur&action=redirectionClassement">Classement</a></li>
            <li><a href="./index.php?controleur=utilisateur&action=redirectionActualites">Actualités</a></li>
            <li><a href="./index.php?controleur=utilisateur&action=redirectionScenario">Scénario</a></li>
            <li><a href="./index.php?controleur=utilisateur&action=redirectionEncyclopedie">Encyclopédie</a></li>
            <?php 
              if (isset($_SESSION['bConnect'])){
                if ($_SESSION['bConnect']) {
                  echo('<li><a href="./index.php?controleur=utilisateur&action=accueilApresDeconnexion">Déconnexion</a></li>');
                }
                else {
                  echo('<li><a href="./index.php?controleur=utilisateur&action=redirectionConnexion">Connexion</a></li>
                        <li><a href="./index.php?controleur=utilisateur&action=redirectionInscription">Inscription</a></li>
                      ');
                }
              }
              else {
                echo('<li><a href="./index.php?controleur=utilisateur&action=redirectionConnexion">Connexion</a></li>
                      <li><a href="./index.php?controleur=utilisateur&action=redirectionInscription">Inscription</a></li>
                    ');
              }
            ?>
            <li><a href="./index.php?controleur=utilisateur&action=redirectionAPropos">À propos</a></li>
            <li><a href="./index.php?controleur=utilisateur&action=redirectionContact">Contact</a></li>
            <li id="li-btnMenu"><a id="btnMenu">MENU</a></li>
          </ul>
        </div>
		</header>

<body>
    <div class="book">
        <div id="pages" class="pages">
            <div class="page" style="z-index:12;">
            <img id="cover" src="./vue/images/umsi-logo.png">
                <h1 style="line-height: 2.5em;"> Découvrez l'histoire du jeu </h1>
                <img id="cover" src="./vue/images/icons/portail.png">
            </div>
            <div class="page" style="background-image : url(vue/images/persos.png); background-repeat:no-repeat; background-position: center; background-size: 100%; "></div>
            <div class="page" style="z-index:10;">
                <h1><br>Chapitre 1</h1>
                <br>
                <h2> Dans un laboratoire fort lointain ... </h2>
                <br>
                <p>Au coeur d'une petite ville d'Amérique du Nord, vit Mme.Enokson, une scientifique expérimentée et connue pour ses idées farfelues. Depuis son plus jeune âge, elle aime tenter l’impossible et l’inaccessible. Quelques années plus tard, elle décide de consacrer sa vie à un seul objectif : créer des trous de vers artificiels. Mais pour l’aider dans sa quête, elle a besoin d'un acolyte, d'un compagnon de recherche. C'est pourquoi elle embauche un stagiaire : vous. </p>
            </div>
            <div class="page" style="background-image : url(vue/images/essai.png); background-repeat:no-repeat; background-position: center; background-size: 90%; "></div>
            <div class="page" style="z-index:8;">
                <h1><br>Chapitre 2</h1>
                <br>
                <h2>Puis les portails transdimensionnels furent !</h2>
                <br>
                <p>
                    Après de longs et pénibles mois de recherche, vous y parvenez enfin. Eureka ! Le premier trou de vers artificiel s'avère être crée grâce à votre participation (minime). Tout semble se dérouler comme prévu, lorsque tout à coup, le portail laisse échapper des créatures venant d’une toute autre dimension. Vite ! Il faut contenir l'invasion, vous allez devoir utiliser tout ce qui est à votre disposition pour les empêcher de sortir du laboratoire !</p>
            </div>
            <div class="page" style="background-image : url(vue/images/all.png); background-repeat:no-repeat; background-position: center; background-size: 100%; "></div>
            <div class="page" style="z-index:6;">
                <h1><br>Chapitre 3</h1>
                <br>
                <h2> L'invasion </h2>
                <br>
                <p>Désormais, la professeure et vous-même allez tenter de réparer vos erreurs. Vous allez devoir placer des tourelles pour défendre le laboratoire et empêcher les ennemis de franchir le portail et réduire à néant votre dur travail.
                    <p id="question" style="font-size:22px"><b><i>Serez-vous à la hauteur pour empêcher ces ennemis de vous détruire ?</b></i>
                    </p>
                </p>
            </div>
            <div class="page ">
                <h1 id="titreDernierePage" style="line-height: 1.5em; padding : 100px 25px 12px 23px;">
               Mme. Enokson compte sur vous !  
               <h1>
            </div>
         </div>
      </div>
   </body>
</html>