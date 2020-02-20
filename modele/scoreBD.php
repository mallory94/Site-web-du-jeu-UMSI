<?php




// function getListeCategoriesBD(){
// 	require ("./modele/connect.php"); 

//     $sql = "SELECT column_name 
//     FROM information_schema.columns 
//     WHERE table_name='score' 
//     AND table_schema='base-pjs4'";
    
//     $resultat= array();

// 	try{
// 		$commande = $pdo->prepare($sql);
// 		$bool = $commande->execute();
		
// 		if($bool){
// 			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
// 			//var_dump($resultat);
// 			return $resultat;
// 		}
// 		else{
// 			return array();
// 		}

// 	}
// 	catch (PDOException $e) {
// 		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
// 		die(); 
// 	}
// }




//prend en parametre un tableau que la fonction rempli avec le nom des colonnes
function getListeScoresBD(&$listeCategories){
	require ("./modele/connect.php"); 

    $sql = "SELECT c.pseudo as Pseudo, niv.nomNiv as Niveau, s.meilleurScore as MeilleurScore, s.nbMonstresTues as ,
			s.tpsJeu, s.dernierScore
			FROM SCORE as s , JOUEUR as j, NIVEAU as niv, COMPTE as c
			WHERE 
				s.IdJoueur = j.IdJoueur AND
				j.IdCompte = c.IdCompte AND
				s.IdNiveau = niv.IdNiveau
			ORDER BY s.meilleurScore DESC";
    
	$resultat= array();
	
	try{
		$commande = $pdo->prepare($sql);
		$bool = $commande->execute();
		
		if($bool){
			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
			$listeCategories = array("Pseudo", "Niveau", "Meilleur Score", "Nombre de monstres tués", "Temps de jeu total", "Dernier score enregistré");
			var_dump($resultat);
			return $resultat;
		}
		else{
			return array();
		}

	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); 
	}
}

//////////////////////////////////////////////////////////////////////////////

//jsp si c'est utile 
function getTopics($id) {
	require ("./modele/connect.php"); 

    $sql = "SELECT * 
			FROM topics 
			WHERE IdTopics =:id";	
		
    $resultat= array(); 

	try{
		$commande = $pdo->prepare($sql);

		$commande->bindParam(':id', $id);
		$bool = $commande->execute();

		if($bool) {
			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
		}
	
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); 
	}

    return $resultat[0];
}


//renvoit la liste de tous les noms des topics
function topicsBD() {
	require ("./modele/connect.php"); 
	$res= array(); 
		
	$sql ="SELECT distinct nomT from topics";
		
		$reponse = $pdo->query($sql);
		while ($donnees = $reponse->fetch())
		{
			$res[]=$donnees['nomT'];
		}
		$reponse->closeCursor();
		return $res;
	}
	
//liste des tourelles 
function getListeTourellesBD(){
	require ("./modele/connect.php"); 

    $sql = "SELECT IdTourelles as Tourelles , imgTourelle as Image, nomTourelles as Nom, degats as Degats, vitesseT as Vitesse
			FROM tourelles";
    
	$resultat= array();
	
	try{
		$commande = $pdo->prepare($sql);
		$bool = $commande->execute();
		
		if($bool){
			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
			var_dump($resultat);
			return $resultat;
		}
		else{
			return array();
		}

	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); 
	}
}

//liste des monstres
function getListeMonstresBD(){
	require ("./modele/connect.php"); 

    $sql = "SELECT IdMonstre as Monstre, imgMonstre as Image, nomMonstre as Nom, typeMonstre as Type, vitesseM as Vitesse
			FROM monstres";
    
	$resultat= array();
	
	try{
		$commande = $pdo->prepare($sql);
		$bool = $commande->execute();
		
		if($bool){
			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
			var_dump($resultat);
			return $resultat;
		}
		else{
			return array();
		}

	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); 
	}
}

//liste des niveaux
function getListeNiveauBD(){
	require ("./modele/connect.php"); 

    $sql = "SELECT IdNiveau as Niveau, imgNiv as Image, nbMonstres as NombreMonstres, nomNiv as Nom
			FROM niveau";
    
	$resultat= array();
	
	try{
		$commande = $pdo->prepare($sql);
		$bool = $commande->execute();
		
		if($bool){
			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
			var_dump($resultat);
			return $resultat;
		}
		else{
			return array();
		}

	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); 
	}
}

//fonction qui insère un nouveau test dans la base de données
// function insererMAJ($id_admin,$titre_maj){
	// require ("./modele/connect.php"); 
	// $resultat_reponse= array(); 
	// $date = date("Y-m-d");
	// $select_reponse="INSERT INTO maj (IdMAJ,description,titre,dateM,IdAdmin) VALUES (0,:,:num_grpe,:titre_test,:date,1)"; 
////	ici la valeur 0 permet d'auto incrémenter dans la colonne id_test
	// $cde_question = $pdo->prepare($select_reponse);
		
	// $b_question = $cde_question->execute(array(
	// 'id_prof' => $id_prof,
	// 'num_grpe' => $num_grpe,
	// 'titre_test' => $titre_test,
	// 'date' => $date
	// )
	// );
// }

//creation maj
function creerMAJ($idM, $description, $titre){
	require ("./modele/connect.php"); 
	$date = date("Y-m-d");
	$sql= "INSERT INTO maj (IdMAJ,description,titre,dateM) VALUES (0, :description, :titre, :date)";

	$creer = $pdo->prepare($sql);
	$creer->bindParam(':IdMAJ', $idM);
	$creer->bindParam(':description', $description);
	$creer->bindParam(':titre', $titre);
	$creer->bindParam(':dateM', $date);
	$creer->execute();
}

//creation topics
function creerTopics($idT, $nomT, $texte){
	require ("./modele/connect.php"); 
	$sql= "INSERT INTO topics (IdTopics,nomT,texte) VALUES (0, :nomT, :texte)";

	$creer = $pdo->prepare($sql);
	$creer->bindParam(':IdTopics', $idT);
	$creer->bindParam(':nomT', $nomT);
	$creer->bindParam(':texte', $texte);
	$creer->execute();
}

?>