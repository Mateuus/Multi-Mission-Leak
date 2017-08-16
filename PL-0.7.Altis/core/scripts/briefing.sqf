waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["controls","Touches"];

	player createDiaryRecord ["controls",
		[
			"Touches du serveur",
				"
				Touches générales:<br/>
				Y: Menu Joueur<br/>
				T: Ouvrir le coffre de son véhicule et de sa maison<br/>
				U: Verrouiller / déverrouiller son véhicule et sa maison<br/>
				Windows Gauche: Intéragir avec une personne ou une voiture<br/>
				Windows Gauche + T: Ramasser un objet ou de l'argent<br/>
				Shift + O: Boules quiès<br/>
				Shift + B: Se rendre<br/>
				Shift + H: Ranger son arme<br/>
				Ctrl Gauche + H: Dégainer son arme<br/>
				<br/>Touches pour les civils et rebelles :<br/>
				Shift + G: Assommer une personne<br/>
				Shift + C: Miner<br/>
				<br/>Touches pour les policers et médecins :<br/>
				F: Activer la sirène de son véhicule<br/>
				O: Léver/Baisser les barrières<br/>
				Shift + L: Allumer les gyrophares de son véhicule<br/>
				Shift + R: Menotter un civil en tant que policier<br/>
				F3: Récupérer les objets Policier<br/>
				"
		]
	];
