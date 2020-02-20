<!DOCTYPE html>
<html>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"  />
		<link rel = "stylesheet" type="text/css" href="./vue/css/inscription.css"/>

<body>
    


<div id="id01" class="modal">
<div id="titreInscription" class="majuscule centrer">S'inscrire</div>
  <form class="modal-content" action="index.php?controleur=utilisateur&action=verifInscription" method="post">
    <div class="container">
    
      
      <p class="centrer">Veuillez remplir ce formulaire pour vous inscrire.</p>
      <hr>
        
      <label for="pseudo"><b>Pseudo</b></label>
      <input type="text" placeholder= 
        <?php 	
          if (isset($_POST['options']['pseudoDejaPris'])) {
            if ($_POST['options']['pseudoDejaPris']) {
              echo("\"Le pseudo " . $_POST['pseudo'] . " est déjà utilisé\"" . " class=\"text rouge\" ");
            }
            else if (isset($_POST['pseudo'])) {
              echo("\"Entrer un pseudo\" class=\"text \" value=\"". $_POST['pseudo'] ."\"");
            }
          }
          else {
            echo("\"Entrer un pseudo\" class=\"text \"");
          }
        ?> 
      
      
      
       name="pseudo" required>
        
      <label for="email"><b>Email</b></label>
      <input type="text" placeholder=
      <?php 	
								if (isset($_POST['options']['emailDejaUtilise'])) {
									if ($_POST['options']['emailDejaUtilise']) {
										
										echo("\"L'email " . $_POST['email'] . " est déjà utilisé\"" . " class=\"text rouge email\" ");
									}
									else if (isset($_POST['pseudo'])) {
										echo("\"Entrer votre email\" class=\"text email\" value=\"". $_POST['email'] ."\"");
									}
								}
								else {
									echo("\"Entrer votre email\" class=\"text email\"");
								}
						?> 
      
       name="email" required>

      <label for="psw"><b>Mot de passe</b></label>
      <input type="password" placeholder="Entrer un mot de passe" name="mdp" required>

      <label for="psw-repeat"><b>Confirmation du mot de passe</b></label>
      <input type="password" placeholder="Confirmer votre mot de passe" name="mdp_bis" required>
      <?php 	
								if (isset($_POST['options']['mdpDifferents'])){
									if ($_POST['options']['mdpDifferents']) {
										
										echo("<div class=\"text mdpDifferents\">Vous avez entré des mots de passe différents</div>");	
									}
								}
					?> 
      <!-- <label>
        <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
      </label> -->

      <p class="termesConditions">En créeant un compte vous acceptez nos <br><a href="#" style="color:dodgerblue">Termes et Conditions</a>.</p>

      <div class="clearfix">
        <a href="./index.php?controleur=utilisateur&action=accueil"><button type="button" class="btnAnnuler majuscule">Annuler</button></a>
        <button type="submit" class="btnInscription majuscule">S'enregistrer</button>
      </div>
    </div>
  </form>
</div>
<script type="text/javascript" src="./vue/js/inscription.js"></script>

</body>
</html>
