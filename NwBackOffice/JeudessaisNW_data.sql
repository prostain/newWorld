	/*
	Nom du scripte: jeuDessaisNW.sql
	Nom de base : dbKCnw
	Auteur: Courtial Kévin
	Date de création: 08/12/2017
	*/
	/*insetion d'un producteur*/
	insert into Producteur values(1,"Courtial","kevin",0664640443,"kevin05000@outlook.fr","7impasse des dahlias",05000,"GAP","2017-11-09",1,null,1,null,null);

	/*insert parcelle */

	insert into parcelle values(1,"haute-alpes",5,"chez bitoufle","255","255",1);

	/*insert Mode de production*/
	insert into modeProd values(1,"bio",1);

	/* insetion d'une characteristique */

	insert into characteristique values(1,"roseval","elle est rouge",null,1);
	insert into characteristique values(2,"veau","elle est rouge",null,1);
	insert into characteristique values(3,"fermier","elle est rouge",null,1);
	insert into characteristique values(4,"golden","elle est rouge",null,1);

	/* insertion d'un lot */

	insert into lot values(1,"lot de base",48,1);

	/*insertion de produit*/

	insert into produit values(1,"pomme de terre",2.5,"kilo",1,1,1,3,0);
	insert into produit values(2,"steak haché",9,"kilo",2,1,1,2,1);
	insert into produit values(3,"escalope de dinde",7,"kilo",3,1,1,2,0);
	insert into produit values(4,"pomme",3,"kilo",4,1,1,1,0);
