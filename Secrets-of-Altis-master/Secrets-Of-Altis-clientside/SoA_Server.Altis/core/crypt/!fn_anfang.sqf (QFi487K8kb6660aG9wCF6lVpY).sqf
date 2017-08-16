{_x addAction["<img size='2' shadow='2' image='icons\moneyNew.paa'/>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",'isNull objectParent player',3]} foreach allmissionobjects "Land_Atm_01_F";
{_x addaction ["<img size='2' shadow='2' image='icons\addactions\toilet.paa'/>",life_fnc_toilet,"",0,FALSE,FALSE,"",'isNull objectParent player',3]} foreach allmissionobjects "Land_FieldToilet_F";
{_x addaction ["<img size='2' shadow='2' image='icons\addactions\phone.paa'/>",life_fnc_phonebooth,"",0,FALSE,FALSE,"",'isNull objectParent player',3]} foreach allmissionobjects "Land_PhoneBooth_01_F";
{_x addaction ["<img size='2' shadow='2' image='icons\addactions\phone.paa'/>",life_fnc_phonebooth,"",0,FALSE,FALSE,"",'isNull objectParent player',3]} foreach allmissionobjects "Land_PhoneBooth_02_F";
{_x addaction ["Links abrufen",life_fnc_computer,"",0,FALSE,FALSE,"",' isNull objectParent player',3]} foreach allmissionobjects "Land_PCSet_01_screen_F";
{_x addaction ["Briefkasten öffnen",{createDialog "mailbox"},"",0,FALSE,FALSE,"",'isNull objectParent player',3]} foreach allmissionobjects "Land_noticeBoard_F";
{_x addaction ["Müllcontainer durchwühlen",life_fnc_muellcontainer,"",0,false,false,"",'',3]} foreach allmissionObjects "Land_GarbageContainer_open_F"; 

[] spawn {
	while{true} do {
		musik_italiener say3D "ambientitalia";
		musik_karibik say3D "ambientkaribik";
		sleep (3 * 60);
	};
};

[] spawn {
	while{true} do {
		brunnen say3D "brunnen";
		sleep 17;
	};
};

_pos = getpos brunnen;
brunnen1 = "#particlesource" createVehicleLocal _pos;
brunnen1 setParticleCircle [0.1, [1, 1, 1.8]];
brunnen1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
brunnen1 setParticleParams [["\A3\data_f\Cl_Water", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 4], 5, 15, 2, 0, [0.7, 0.1], [[0.7, 0.75, 0.95, 0.04], [0.75, 0.8, 0.9, 0.004], [0.8, 0.8, 0.8, 0.001]], [1], 0, 0, "", "", _pos];
brunnen1 setDropInterval 0.001;
brunnen2 = "#particlesource" createVehicleLocal _pos;
brunnen2 setParticleCircle [0.1, [0.05, 0.05, 4.5]];
brunnen2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
brunnen2 setParticleParams [["\A3\data_f\Cl_Water", 1, 0, 1], "", "Billboard", 0.5, 2, [0, 0, 0], [0, 0, 2.5], 5, 15, 2, 0, [0.5, 0.1], [[0.7, 0.75, 0.95, 0.04], [0.75, 0.8, 0.9, 0.004], [0.8, 0.8, 0.8, 0.001]], [1], 0, 0, "", "", _pos];
brunnen2 setDropInterval 0.001;

[] spawn {
	while {true} do {
		if(player distance brunnen >= 20) then {
			brunnen1 enableSimulation false;
			brunnen2 enableSimulation false;
		} else {
			brunnen1 enableSimulation true;
			brunnen2 enableSimulation true;
		};
	};
};

oneachframe {
	{ 
		if(player distance _x < 7) then { 
			drawIcon3D [ 
			    format["mpmissions\__CUR_MP.Altis\%1",(_x getVariable "tagName" select 1)], 
			    [1,1,1,1], 
			    [(getPosATLVisual _x) select 0,(getPosATLVisual _x) select 1,((getPosATLVisual _x) select 2) + 2.2], 
			    1, 
			    1, 
			    0, 
			    (_x getVariable "tagName" select 0), 
			    2, 
			    0.04, 
			    "PuristaLight" 
			] 
		}; 
	} foreach [spawn_schirm, spawn_ausweis, spawn_immo, markt_auto, markt_fashion, markt_italiener, markt_party, markt_auktion, markt_bank, markt_elektro, Hulabar, Werkzeugladen, Infostand, Supermarkt, Buergeramtler, Apotheker, markt_garage, Donwmarkt, p_einfahrt, p_ausfahrt, Buergeramtler_1, kav_garage, kav_gericht, richter_padd, galerie_finish,diamond_exit_guy,diamond_entry_guy,event_guy,don_ator]; 
	 
	{ 
		if(_x getVariable ["noob",false] && player distance _x < 7) then { 
			drawIcon3D [ 
			    "mpmissions\__CUR_MP.Altis\icons\support.paa", 
			    [1,1,1,1], 
			    [(getPosATLVisual _x) select 0,(getPosATLVisual _x) select 1,((getPosATLVisual _x) select 2) + 2.2], 
			    1, 
			    1, 
			    0, 
			    "Neuling", 
			    2, 
			    0.04, 
			    "PuristaLight" 
			] 
		}; 
	} foreach playableUnits; 
};