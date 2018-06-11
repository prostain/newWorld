<br />
<br />
<div class="bd-example" role="tabpanel">
  <div class="row">
    <div class="col-3">
      <div class="list-group" id="list-tab" role="tablist">
        <a class="list-group-item list-group-item-action active" id="list-dashboard-list" data-toggle="tab" href="#list-dashboard" role="tab" aria-controls="list-dashboard">Informations</a>
        <a class="list-group-item list-group-item-action" id="list-parcelle-list" data-toggle="tab" href="#list-parcelle" role="tab" aria-controls="list-parcelle">Ajouter une parcelle</a>
        <a class="list-group-item list-group-item-action" id="list-produit-list" data-toggle="tab" href="#list-produit" role="tab" aria-controls="list-produit">Ajouter un produit</a>
        <a class="list-group-item list-group-item-action" id="list-variete-list" data-toggle="tab" href="#list-variete" role="tab" aria-controls="list-variete">Ajouter une variété</a>
        <a class="list-group-item list-group-item-action" id="list-lot-list" data-toggle="tab" href="#list-lot" role="tab" aria-controls="list-lot">Ajouter un lot</a>
      </div>
    </div>
    <div class="col-8">
      <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="list-dashboard" role="tabpanel" aria-labelledby="list-dashboard-list">
        </div>

        <!-- //////////////////////////////////////////////////////////////////////////////////////////// -->
        <div class="tab-pane fade" id="list-parcelle" role="tabpanel" aria-labelledby="list-parcelle-list">
         <form id="register" class="ajax-auth" action='index.php?module=vitrine&action=produire' method="post">
          <div class="md-form">
            <i class="fa fa-lock prefix"></i>
            <input type="text" id="idAdresse" class="form-control" name="adresse" required="">
            <label for="idAdresse">Adresse :</label>
          </div>
          <div class="md-form">
            <i class="fa fa-lock prefix"></i>
            <input type="hidden" id="idVille" class="form-control" name="ville" required="">
          </div>
          <div class="form-group">
            <select class="form-control" id="modeProduction" name="modeProduction" required="">
              <label for="modeProduction">Mode de production :</label>
              <?php
              foreach ($modeProductions as $modeProduction) {
                ?>
                <option value="<?php echo $modeProduction['idProduction']; ?>"><?php echo $modeProduction['modeProduction']; ?></option>
                <?php
              }
              ?>
            </select>
          </div>

          <div class="md-form">
            <label for="idLatitude"></label>
            <input class="form-control" type="hidden" name="latitude" id="idLatitude" placeholder="" value="">
          </div>
          <div class="md-form">
            <label for="idLongitude"></label>
            <input class="form-control" type="hidden" name="longitude" id="idLongitude" placeholder="" value="">
          </div>                  
          <div class="text-center">
            <button type="submit" class=" btn btn-unique waves-effect waves-light">Ajouter une parcelle</button>
          </div>
        </form>
      </div>
      <!-- //////////////////////////////////////////////////////////////////////////////////////////// -->
      <div class="tab-pane fade" id="list-produit" role="tabpanel" aria-labelledby="list-produit-list">
       <form action="index.php?module=vitrine&action=produire" method="post" enctype="multipart/form-data" >
        <div class="form-group">
          <select class="form-control" id="monRayon" name="monRayon" required="">
            <label for="monRayon">Adresse email :</label>
            <?php
            foreach ($rayons as $rayon) {
              ?>
              <option value="<?php echo $rayon['idRayon']; ?>"><?php echo $rayon['libelleRayon']; ?></option>
              <?php
            }
            ?>
          </select>
        </div>
        <div class="md-form">
          <i class="fa fa-user prefix"></i>
          <input type="text" id="monProduit" class="form-control" name="monProduit" required="">
        </div>

        <input class="form-control" type="hidden" name="MAX_FILE_SIZE" value="<?php echo $poids_max; ?>">
        <input class="form-control"  type="file" name="fichier" required="">
        <div class="text-center">
          <button class="submit_button btn btn-primary" type="submit" value="Envoyer">Proposer ce produit</button>
        </div>

      </form>
    </div>

    <!-- //////////////////////////////////////////////////////////////////////////////////////////// -->
    <div class="tab-pane fade" id="list-variete" role="tabpanel" aria-labelledby="list-variete-list">
      <form action="index.php?module=vitrine&action=produire" method="post" enctype="multipart/form-data" >
        <div class="form-group">
          <select class="form-control" id="rayon" name="rayon" onchange="remplirListeDesProduits(this.value)">
            <option value=" ">Rayon </option>
            <?php
            foreach ($rayons as $rayon) {
              ?>
              <option value="<?php echo $rayon['idRayon']; ?>"><?php echo $rayon['libelleRayon']; ?></option>
              <?php
            }
            ?>
          </select>
        </div>
        <div class="form-group">
          <select class="form-control" id="produit" name="produit">
            <option value=" "> choisir un rayon</option>
          </select>
        </div>
        <div class="md-form">
          <i class="fa fa-user prefix"></i>
          <input type="text" id="variete" class="form-control" name="variete" required="">
        </div>

        <input class="form-control" type="hidden" name="MAX_FILE_SIZE" value="<?php echo $poids_max; ?>">
        <input class="form-control"  type="file" name="fichier" required="">
        <div class="text-center">
          <button class="submit_button btn btn-primary" type="submit" value="Envoyer">Proposer ce produit</button>
        </div>
      </form>        
    </div>

    <!-- //////////////////////////////////////////////////////////////////////////////////////////// -->
    <div class="tab-pane fade" id="list-lot" role="tabpanel" aria-labelledby="list-lot-list">
      <p>...</p>
    </div>
  </div>
</div>
</div>
</div>

<!-- JQuery -->
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>

<!-- Bootstrap dropdown -->
<script type="text/javascript" src="js/popper.min.js"></script>

<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<!-- MDB core JavaScript -->
<script type="text/javascript" src="js/mdb.min.js"></script>

<script type="text/javascript" src="js/jqueryAdresse.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

    //auto complément de l'adresse ville et code postal
    $("#idAdresse").autocomplete({
      source: function (request, response) {
        $.ajax({
          url: "https://api-adresse.data.gouv.fr/search/?limit=5",
          data: { q: request.term },
          dataType: "json",
          success: function (data) {
            response($.map(data.features, function (item) {
              return { label: item.properties.label, postcode: item.properties.postcode,city: item.properties.city, value: item.properties.label, street: item.properties.street, name: item.properties.name, latitude: item.geometry.coordinates[1],longitude: item.geometry.coordinates[0]};
            }));
          }
        });
      },
      select: function(event, ui) {
        $('#idCP').val(ui.item.postcode);
        $('#idVille').val(ui.item.city);
        if(ui.item.street)
          $('#idRue').val(ui.item.street);
        else
          $('#idRue').val(ui.item.name);
        $("#idLatitude").val(ui.item.latitude);
        $("#idLongitude").val(ui.item.longitude);
      }
    });

  /**
  * Méthode qui sera appelée lors de la sélection d'un rayon
  */
  function remplirListeDesProduits(noRayon)
  {
    //alert("chgt de rayon");
    //alert("le rayon:"+noRayon+" est demandé");
    var request = $.ajax({
    //url: "http://petersonr.hol.es/newWorld/wsListeDesProduitsDuRayon.php",
    url: "wsListeDesProduitsDuRayon.php",
    method: "GET",
    data: { idRayon : noRayon }
  });

      //element html de type select qui contiendra les produits du rayon
      var listeDesProduits=$("#produit");
      //vider la liste des produits
      $(listeDesProduits).html("");


      //element html de type select qui contiendra les varietes du produit
      var listeDesVarietes=$("#variete");
      //vider la liste des produits
      $(listeDesVarietes).html("");

    //lors de la reception du json
    request.done(function(reponse)
    {
      //pour chaque categ du rayon
      //alert(reponse);
      var tabProduits=JSON.parse(reponse);


      $.each(tabProduits, function( i,produit) 
      {
        //alert(produit.libelleProduit);
        //ajout du produit obtenu à la liste
        //création de l'option
        var nouveauProduit=document.createElement("option");
        //valorisation de l'attribut value de l'option
        $(nouveauProduit).attr("value",produit.idProduit);
        //mise en place du libellé du produit
        $(nouveauProduit).html(produit.libelleProduit);
        //ajout de l'option à la select
        $(listeDesProduits).append(nouveauProduit);
      });//fin du pour chaque produit
    });//fin reception du json
    request.fail(function( msg ) 
    {
      alert("Pas de produit dans ce rayon");
    });
  }//fin de la fonction remplirListeDesProduitsDuRayon
  //****************************************************



</script>
