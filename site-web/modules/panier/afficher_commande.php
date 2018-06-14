<?php
require_once CHEMIN_MODELE.'commerce.php';
$idUser = $_SESSION['utilisateur']['idUser'];
$panier = $_SESSION['panier'];

foreach ($panier as $tousLesPoints) {
	$dataPoints[] = $tousLesPoints['pointDeVenteFavori'];
}
$points = array();
foreach ($dataPoints as  $data) {
	if (!in_array($data['idPoint'], $points)) {
		$points[] =$data['idPoint'];
	}
	
}
foreach ($points as $point)
{
	$idPoint = $point['idPoint'];
	$creationCommande = creationCommande($idUser, $idPoint, $panier);
	if ($creationCommande) {
		$result = true;
	}
}
if ($result) {
	unset($_SESSION["panier"]);
	header('Location: index.php?module=panier&action=afficher_panier');
}
else
{

	header('Location: index.php?module=panier&action=afficher_panier');	
}
?>