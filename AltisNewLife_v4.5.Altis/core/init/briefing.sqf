waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};
player createDiarySubject ["changelog","COMMANDES"];
player createDiarySubject ["serverrules","Licences et metiers"];
player createDiarySubject ["policerules","Contraventions"];
player createDiarySubject ["gangrules","Braquage de la banque"];
player createDiarySubject ["safezones","Zone sans violence"];
player createDiaryRecord["changelog",
		[
"Touche du clavier",
"
WINDOWS		: Interaction Joueurs<br/>
              Interaction Vehicules<br/>
			  Interaction Maisons<br/>
			  Ramasser objet<br/>
			  S'asseoir sur une chaisse<br/><br/>			  
Y			: Ouvrir votre portefeuille<br/>
I  			: Ouvrir votre inventaire principal<br/>
U			: Verrouillé/Déverouillé (vehicule/maisons)<br/>
T			: Coffre du véhicule/maisons<br/>
ESPACE	  	: Sauter (en courant)<br/>
V           : Enjamber<br/>
F           : Sirene vehicule<br/>
M           : Changer d'arme<br/><br/>

&lt;		: Piocher<br/>
SHIFT + P	: Montrer ses Papiers<br/>
SHIFT + G	: Se Rendre<br/>
SHIFT + R	: Menotter<br/>
SHIFT + F	: Assomer<br/>
SHIFT + B	: Boule Quies<br/>
SHIFT + C	: Crochetage<br/>
SHIFT + O	: Crochetage serrure<br/>
SHIFT + N	: Utiliser Nitro<br/>
SHIFT + H	: Ranger arme<br/>
CTRL  + H	: Sortir arme<br/>
SHIFT + L   : Allumer phares ou lumières<br/>
SHIFT + N   : Activer Nitro<br/>
CTRL + FLECHE GAUCHE : Clignotant à gauche<br/>
CTRL + FLECHE DROITE : Clignotant à droite<br/>
CTRL + FLECHE HAUT   : Warning véhicule<br/><br/>
------------------------------------------------------------------<br/><br/>
ANIMATION<br/>
	µ	      : Salut militaire<br/>
	ù	 	  : S'asseoir au sol<br/>
	SHIFT + 1 : Kata<br/>
	SHIFT + 2 : Echauffement lent<br/>
	SHIFT + 3 : Echauffement rapide<br/>
	SHIFT + 4 : Faire des pompes<br/>
	SHIFT + 5 : Effrayé<br/>	
"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Licences et metiers",
"<br/>
		PERMIS DE CONDUIRE [50]<br/>
		PERMIS POIDS LOURD [2000]<br/>
		PERMIS BATEAU [100]<br/>
		PERMIS PLONGEE [200]<br/>
		PERMIS PILOTE [2500]<br/>
		PERMIS DE CHASSE [1000]<br/>		
		------------------------------------------------------------------<br/>
		FORMATION VERRIER (sable) [1500]<br/>
		FORMATION SALIN (sel) [1500]<br/>
		FABRICANT DE CIMENT (pierre) [800]<br/>
		FONTE DU CUIVRE [800]<br/>
		FORGERON (fer) [1000]<br/>
		SOUFFLEUR DE VERRE [1000]<br/>
		RAFFINAGE DU PETROLE [3000]<br/>
		MINERALOGISTE [2500]<br/>
		ARCHEOLOGUE [4000]<br/>		
		DIAMANTAIRE [10000]<br/>
		FONTE DE L'OR [12000]<br/>		
		------------------------------------------------------------------<br/>
		B.E.P CANNABIS MEDICAL [5000]<br/>
		B.T.S CANNABIS [5000]<br/>
		LICENCE EN HEROINE [12000]<br/>
		DOCTORAT EN COCAINE [15000]<br/>
		CUISINIER METH 97 [50000]<br/>
		TRAFFICANT D'ORGANES [-]<br/>
		FORMATION URANIUM [200000]<br/>
		FORMATION OPIUM [20000]<br/>		
		------------------------------------------------------------------<br/>
		VITICULTEUR [3000]<br/>
		DISTILLATEUR [5000]<br/>
		MISE EN BOUTEILLE [10000]<br/>
		PRODUCTEUR DE MOONSHINE [10000]<br/>
		------------------------------------------------------------------<br/>
		PERMIS DE PORT D'ARMES [2000]<br/>
		LICENCE DE GANG [50000]<br/>
		LICENCE REBELLE [500000]<br/>
			Acceder à la ville rebelle<br/>
			Nouveaux equipements<br/>
			Debloquer des armes et accessoires<br/>
			Nouveaux vehicules armés<br/><br/>
		LICENCE FAMILLE [SOUS WHITELIST]<br/>
			Acceder à une base militaire<br/>
			Nouveaux equipements<br/>
			Debloquer des armes et accessoires<br/>
			Nouveaux vehicules armés<br/><br/>			
		DROIT DE PROPRIETE [7500]<br/>
			Acheter maisons/garages<br/>
			   - Prix : 200000€ (garage) | 300000€ a 1000000€ (maison)
			Augmenter votre capacité de stockage<br/>
			6 Maisons par habitants maximum<br/>
		------------------------------------------------------------------<br/>"
		]
	];

	player createDiaryRecord["safezones",
		[
			"Zones de non violence/Safe-Zone",
"
	<br/>
	Zones de non violence signifient :<br/><br/>
	*NE PAS TUER* <br/>
	*PAS DE PRISE D'OTAGE* <br/>
	*PAS DE RACKET* <br/>
	*PAS DE VOL* <br/><br/>
	Si vous commettez un crime, vous serez banni de l'île.<br/>
	<br/>
"
		]
	];

	player createDiaryRecord["gangrules",
		[
			"Braquage de la banque",
"
Pour voler la banque vous devez avoir les éléments suivants : <br/>
  - Une charge explosive (au marché rebelle)<br/>
  - Outils de serrurier (au marché)<br/><br/>

  1. Forcer les deux portes qui vous separent du coffre<br/>
  2. Placer la charge explosive sur le coffre<br/>
  3. Prendre les lingots d'or<br/>
  4. Transporter les lingots d'or en vehicule terrestres<br/>
  5. Un seul lingot d'or vaut 9000€<br/>
"
		]
	];


// Police Section
	player createDiaryRecord ["policerules",
		[
			"Liste des Contraventions",
"
Code de la route :<br/>
–	Non port du casque en quad ou Karting : 50€<br/>
–	Conduite d'un véhicule de feux éteints : 100€<br/>
–	Conduite d’un véhicule de dehors des routes : 100€<br/>
–	Entrave à la circulation ou stationnement gênant : 200€<br/>
–	Conduite sous emprise de l'alcool : 300€<br/>
–	Conduite en dehors des routes : 300€<br/>
–	Conduite d'un véhicule sans permis : 750€<br/>
–	Conduite sous emprise de stupéfiants : 1000€<br/>
–	Mise en danger de la vie d'autrui : 1000€<br/>
–	Excès de vitesse : 500€ et 100€/10km/h en plus de la limite<br/>
    Limitations de vitesse :<br/>
    - En ville : 50 km/h<br/>
    - Sentiers : 90 km/h<br/>
    - Sur route : 130 km/h<br/><br/>
	
Ces infractions peuvent entraîner une mise en fourrière du véhicule, en fonction de la situation et du comportement de la personne contrôlée.<br/>
–	Conduite d'un véhicule non homologué : 1000€<br/>
–	Délit de fuite :  3000€<br/>
–	Homicide involontaire : 6000€<br/>
–	Refus d'obtempérer : 5 000€<br/><br/>

Judiciaire :<br/>
–	Acte de violence sur animal : 100€<br/>
–	Toutes personnes dans le commissariat de kavala : 50€<br/>
–	Dégradation de la voie public : 200€ (dégradation de bâtiment 4 000€)<br/>
–	Arme tenue en mains sans motif valable : 500€<br/>
–	Consommation de produits stupéfiants : 500€<br/>
–	Vêtement destiné à masquer son visage : 1000€ + saisie<br/>
–	Possession d'une arme légale sans permis : 1000€ et saisie de l'arme<br/>
–	Tentative de vol  de véhicule : 1 500€<br/>
-	Vol d'un véhicule : 4500€<br/>
–	Tentative de corruption : 1500€<br/>
–	Vente d'esclave(s) : 3 000€<br/>
–	Outrage : 5000€<br/>
–	Vol d'organe : 7 500€<br/>
–	Vol à main armée (braquage civil/entre rebelle,braquage de station etc ...): 10000€<br/>
–	Braquage de maison : 25 000€<br/><br/>

Rebelle :<br/>
–	Tenue rebelle : 5 000€ + saisie<br/>
–	Arme illégale : 10 000€ + saisie<br/>
–	Véhicule illégale : 20 000€ + destruction obligatoire<br/><br/>

Tentative de meurtre :<br/>
–	Civil ou Rebelle : 10 000€<br/>
–	Tentative de meurtre sur agent : 20 000€<br/><br/>

Extrême :<br/>
–	Évasion de prison : prison + 10 000€<br/>
–	Meurtre d'un civil : 20 000€ + prison<br/>
–	Meurtre d'un agent : 40000€ + prison<br/>
–	Prise d'otage : 25000€ + prison<br/>
–	Troll abusif : prison 1h<br/>
–	Situation non RP: prison + demande de ban auprès d'un admin avec screenshoot !!!<br/><br/>

Attaques lieux :<br/>
–	Attaque de la douane 30000€ + prison<br/>
–	Braquage de banque 40000€ + prison<br/>
–	Attaque point de contrôle de Kavala : 10000€ + prison (seulement si, les rebelles ou civils le revendique).<br/><br/>

Prise de cargaison illégal :<br/>
-	50% du montant de la cargaison + destruction du véhicule<br/>
-	Troll abusif : Ban (prison si aucun admin)<br/><br/>

Est considérée comme arme illégale toute arme qui n'est pas vendue dans une armurerie, à savoir toute arme autre que :<br/>
Armes de poing : Rook-40 9mm ; 4-five .45 ; Zubr .45 ; ACP-C2 .45<br/>
Armes d'épaule : SMG .45, SMG 9mm, PDW2000 9mm<br/><br/>
Les villes sont interdites de survol sans autorisation expresse des forces de l'ordre. Tout aéronef en infraction sera abattu.<br/>
"
		]
	];

// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Activité illégale",
"
1.  Traffic de tortue<br/>
2.  Vole/Cambriolage<br/>
3.  Cocaine<br/>
4.  Heroine<br/>
5.  Cannabis<br/>
6.  Methamphetamine<br/>
7.  Uranium<br/>
8.  Alcool MoonShine<br/>
9.  Traffic d'organes<br/>
11. Racket<br/>
12. Kidnapping<br/>
13. Traffic d'esclave<br/>
14. Torture<br/>
15. Traffic d'opium<br/>
"
		]
	];