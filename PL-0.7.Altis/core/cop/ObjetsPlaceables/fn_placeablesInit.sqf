/*---------------------------------------------------------------------------
	File: fn_placeableInit.sqf
	Description:
		Initialisation de tous le object placeable dans le jeu
---------------------------------------------------------------------------*/
life_barrier_active = false;
life_barrier_activeObj = ObjNull;
life_placeables = [
	[
		"Cône routier",
		"RoadCone_F",
		"icons\placables\cone.paa"
	],
	[
		"Cône routier avec lumière",
		"RoadCone_L_F",
		"icons\placables\cone.paa"
	],
	[
		"Panneau routier",
		"SignAd_Sponsor_F",
		"icons\placables\panneau.paa"
	],
	[
		"Barrière routière",
		"RoadBarrier_F",
		"icons\placables\barre.paa"
	],
	[
		"Cordon de sécurité",
		"TapeSign_F",
		"icons\placables\cordon.paa"
	],
	[
		"Grande barrière ",
		"Land_BarGate_F",
		"icons\placables\barriere.paa"
	],
	[
		"Barrière de protection",
		"Land_Crash_barrier_F",
		"icons\placables\barreprotect.paa"
	],
	[
		"Barrière en plastique orange",
		"PlasticBarrier_03_orange_F",
		"icons\placables\barre.paa"
	],
	[
		"Barrière en plastique jaune",
		"PlasticBarrier_02_yellow_F",
		"icons\placables\barre.paa"
	],
	[
		"Mur",
		"Land_CncBarrier_stripes_F",
		"icons\placables\mur.paa"
	],
	[
		"Sac de sable",
		"Land_BagFence_Short_F",
		"icons\placables\sac.paa"
	],
	[
		"Projecteur",
		"Land_PortableLight_single_F",
		"icons\placables\projecteur.paa"
	],
	[
		"Projecteur double",
		"Land_PortableLight_double_F",
		"icons\placables\projecteur2.paa"
	],
	[
		"Lumière au sol rouge",
		"Land_Flush_Light_red_F",
		"icons\placables\lightr.paa"
	],
	[
		"Lumière au sol verte",
		"Land_Flush_Light_green_F",
		"icons\placables\lightg.paa"
	],
	[
		"Lumière au sol jaune",
		"Land_Flush_Light_yellow_F",
		"icons\placables\lighty.paa"
	],
	[
		"Flèche tourner à gauche",
		"ArrowDesk_L_F",
		"icons\placables\flecheg.paa"
	],
	[
		"Flèche tourner à droite",
		"ArrowDesk_R_F",
		"icons\placables\fleched.paa"
	],
	[
		"Transat",
		"Land_Sun_chair_green_F",
		"icons\placables\transat.paa"
	],
	[
		"Drapeau Blanc",
		"Flag_White_F",
		"icons\placables\drapeau_blanc.paa"
	],
	[
    "Terminal",
    "Land_DataTerminal_01_F",
		""
  ]
];
life_bar_limit = 150;
life_bar_placey = [];
