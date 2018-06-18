<?php
$nbCommandes = count($affiche_commandes);
if ($nbCommandes > 0) 
{

?>
<hr style="height: 7px; background-color: red" />
<h1>Commandes en cours : </h1>
<?php
foreach ($affiche_commandes as $commande) 
{
?>
<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<hr />
			<h4 class="panel-title">
				<a style="a_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $commande['idCommande']; ?>">
					<div class="row">
						<div class="col">
							Commande n°<?php echo $commande['idCommande']; ?>
						</div>
						<div class="col">
							Point de vente : <?php echo $commande['nomPoint']; ?>
						</div>
						

					</div>
					</a>
				</h4>
			</div>
			<div id="collapse<?php echo $commande['idCommande']; ?>" class="panel-collapse collapse in">
				<div class="panel-body">
					<table class="table table-hover table-dark">
						<tr>
							<th>ID Lot</th>
							<th>Cantité commané</th>
							<th>Producteur</th>
							<th>Etat du lot</th>				
						</tr>
						<?php
						foreach ($commande['ligneDeCde'] as $lot) 
						{
							?>
							<tr>
								<td><?php echo $lot['idLot']; ?></td>
								<td><?php echo $lot['quantiteCommandee']; ?></td>
								<td><?php echo $lot['nom'].' '.$lot['prenom']; ?></td>
								<td><?php echo $lot['etatLDC']; ?></td>								
							</tr>
							<?php
						}
						?>

					</table>

				</div>
			</div>
		</div>
	</div>

	<?php

}
}

?>