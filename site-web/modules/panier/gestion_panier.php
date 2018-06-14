<?php 
require_once CHEMIN_MODELE.'commerce.php';
switch($_POST["operation"])
{
		case "Vider le Panier":
			$_SESSION["panier"]=array();
			header('Location: index.php?module=panier&action=afficher_panier_vide');
			break;
		case "Ajouter au panier":
			$trouve = false;
			$i=count($_SESSION["panier"]);
			for ($k = 0; $k < $i ; $k++) { 
			// Est ce que le produit à déja été commandé ?
 				if ( @$_POST["id"] == $_SESSION["panier"][$k]["ref"] )  { 
 				// Cas produit déja commandé
					$_SESSION["panier"][$k]["quantite"] = $_POST["quantite"];

					if($_SESSION["panier"][$k]["quantite"] > $_SESSION["panier"][$k]["stock"])
		{
			$_SESSION["panier"][$k]["quantite"]= $_SESSION["panier"][$k]["stock"];

		}

					$trouve = true;
				} 
			} 
			if (! $trouve) {
				
				
				// Cas produit pas déja commandé
				$_SESSION["panier"][$i]["ref"]=$_POST["id"];
				$_SESSION["panier"][$i]["description"]=$_POST["description"];
				$_SESSION["panier"][$i]["stock"]=$_POST["stock"];
				$_SESSION["panier"][$i]["quantite"]=$_POST["quantite"];
				$_SESSION["panier"][$i]["unite"]=$_POST["unite"];
				$_SESSION["panier"][$i]["prix"]=$_POST["prix"];
				$_SESSION["panier"][$i]["photo"]=$_POST["photo"];

				$idLot = $_SESSION["panier"][$i]["ref"];
				$pointsDeLot = chargerPointDeVenteDeLot($idLot);
				$_SESSION["panier"][$i]["pointDeVente"]=$pointsDeLot;
				$_SESSION["panier"][$i]["pointDeVenteFavori"]=$pointsDeLot[0]['idPoint'];
				$nbPoints = count($pointsDeLot);

				if($_SESSION["panier"][$i]["quantite"] > $_SESSION["panier"][$i]["stock"])
		{
			$_SESSION["panier"][$i]["quantite"]= $_SESSION["panier"][$i]["stock"];

		}

			}
			include 'index.php?module=vitrine&action=catalogue';
			break;
		case "Supprimer du panier":
			$i=count($_SESSION["panier"]);
			for ($k = 0; $k < $i ; $k++) { // Est ce que le produit à déja été commandé ?
 				if ( $_POST["id"] == $_SESSION["panier"][$k]["ref"] )  {
 					unset($_SESSION["panier"][$k]);
				}   
			} 
			if (count($_SESSION["panier"]) != 0) {	// le panier est-il vide ?	
			  	header('Location: index.php?module=panier&action=afficher_panier');
			} else	{
			 	header('Location: index.php?module=panier&action=afficher_panier_vide');
			}
	        break;
}
