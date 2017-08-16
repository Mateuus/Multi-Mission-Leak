/* 

	Author Shinji
	
*/
_counter = 0;
_license_prog = true;
license_granted = false;
wall_accepted = false;
flug_zum_kastro = false;
heli_schule_gesch = true;
heli_schule_prog= true;



hint "Dieser Test wird etwas anders, als die vorherigen Lizenz Tests. Deine Befehle und somit der gesamte Test, wird dir Schritt fuer Schritt angezeigt. Achte also stehts darauf. Dich wird sicher der Black Screen Ablenken, Dies beweist deine Konzentration.";


sleep 15;
_owners = getPlayerUID player;

heli1 = "B_Heli_Light_01_F" createVehicle (getMarkerPos "heli_license_spawn");
heli1 setVariable["vehicle_info_owners",_owners,true];
clearWeaponCargoGlobal heli1;
clearItemCargoGlobal heli1;
clearMagazineCargoGlobal heli1;

sleep 0.1;

player moveindriver heli1;

sleep 1;

execvm "MINEFACTORY\licenses\tests\troll_prevent.sqf";

hint "Du kannst jederzeit aufgeben, dazu musst du nur landen und aussteigen.";

sleep 2;

while { heli_schule_prog } do {
TitleText["Hebe zunaechst ab. Fliege auf eine Hoehe von 50 Metern. Halte diese fuer ein paar Sekunden.","BLACK FADED", 2];
sleep 5;
titleFadeOut 2;



waituntil {sleep 3,((getPos heli1 select 2) >=49)};

TitleText["Sehr gut, ich sehe du lernst schnell. Fliege zum naechsten Berg im Osten. Wenn du dir unsicher bist, schau auf die Karte.","BLACK FADED", 2];
sleep 6;
titleFadeOut 2;

heliarrow1 = "Sign_Arrow_Large_F"  createVehicle (getMarkerPos "heli_sign1");

ziel_marker= createMarkerLocal ["auftrags_ziel_marker", position player ];
"auftrags_ziel_marker" setMarkerBrushLocal "Cross";
"auftrags_ziel_marker" setMarkerColorLocal "ColorRed";
"auftrags_ziel_marker" setMarkerPosLocal (getpos heliarrow1 );
"auftrags_ziel_marker" setMarkerTypeLocal "hd_WARNING"; 
"auftrags_ziel_marker" setMarkerSize [1, 1];



sleep 4;

TitleText["Fliege nun dorthin wo der Pfeil ist. Halte eine Hoehe von etwa 10 Metern ueber ihm.","BLACK FADED", 2];
sleep 3;
titleFadeOut 2;

waituntil {sleep 3,(((getPos heli1 select 2) <=12) && (heli1 distance ( markerPos "heli_sign1" ) <= 15))};

deleteMarkerLocal "auftrags_ziel_marker";


deletevehicle heliarrow1;

helitransp = "C_Hatchback_01_sport_F"  createVehicle (getMarkerPos "heli_sign1");

heliarrow1 = "Sign_Arrow_Large_F"  createVehicle (getMarkerPos "helitrans_pos");

helitransp attachTo [heli1, [0, 0, -2] ]; 

ziel_marker= createMarkerLocal ["auftrags_ziel_marker", position player ];
"auftrags_ziel_marker" setMarkerBrushLocal "Cross";
"auftrags_ziel_marker" setMarkerColorLocal "ColorRed";
"auftrags_ziel_marker" setMarkerPosLocal (getpos heliarrow1 );
"auftrags_ziel_marker" setMarkerTypeLocal "hd_WARNING"; 
"auftrags_ziel_marker" setMarkerSize [1, 1];

TitleText["Dieser Wagen hat sich ein wenig verirrt und sollte wieder zum Haus kommen, also dort wo du los geflogen bist. Bring ihn dorthin wo der Pfeil ist.","BLACK FADED", 2];
sleep 10;
titleFadeOut 2;

waituntil {sleep 3,(((getPos heli1 select 2) <=12) && (heli1 distance ( markerPos "helitrans_pos" ) <= 15))};

detach helitransp;

TitleText["Wunderbar! Nun folgt deine letzte Aufgabe...","BLACK FADED", 2];
deleteMarkerLocal "auftrags_ziel_marker";
deletevehicle heliarrow1;
sleep 5;

heliarrow1 = "Sign_Arrow_Large_F"  createVehicle (getMarkerPos "heli_kastro_last");

TitleText["Fliege zur Burg von Kavala, dort ist wieder einer der Pfeile. Lande dort, das ganze aber innerhalb von 2 min.","BLACK FADED", 2];
sleep 3;
titleFadeOut 2;

flug_zum_kastro = true;
stoppe_die_zeit = 0;
_counter= 0;
_min = 0;

while {flug_zum_kastro} do 
{
_counter = _counter + 1;
if (_min >= 2) then {hint "Du hast den Test nicht bestanden, deine Zeit ist ausgelaufen..."; 
	deletevehicle heliarrow1;
	deletevehicle helitransp;
	sleep 8;

	deletevehicle heli1;
	license_heli_in_use =  false;
	publicVariable "license_heli_in_use";
	player setPos current_position_p; 
	heli_schule_prog = false;
	heli_schule_gesch = false;
	flug_zum_kastro = false;
	
	};
hintsilent format [ "Verstrichene Zeit:  %1 min.  %2 sek. ",_min,_counter ];
if ((((getPos heli1 select 2) <=12) && (heli1 distance ( markerPos "heli_kastro_last" ) <= 15))) then {
flug_zum_kastro = false;
heli_schule_gesch = true;
heli_schule_prog = false;


};

if (_counter >= 59 ) then {_counter = 0; _min = _min +1;};

sleep 1;
};

	};
if ( heli_schule_gesch ) then {
deletevehicle heliarrow1;
deletevehicle helitransp;

TitleText["Durchaus Beeindruckend... Damit hast du bestanden, lande hier noch eben. Warte bis du wieder am Lizenz-Amt bist.","BLACK FADED", 2];
sleep 3;
titleFadeOut 2;
playsound "made_it";
sleep 12;
hint "";
deletevehicle heli1;
	license_heli_in_use =  false;
	publicVariable "license_heli_in_use";
	player setPos current_position_p; 
	heli_schule_prog = false;
titleText ["Deine Lizenz wird nun uebergeben!", "plain"]; titleFadeOut 4;
license_civ_pilot = true;
} else {

hint "Aussteigen, gilt nicht. Wenn der Heli schaden hatte, ebenfalls nicht... Nicht bestanden!";
sleep 8;
deletevehicle heli1;
	license_heli_in_use =  false;
	publicVariable "license_heli_in_use";
	player setPos current_position_p; 
	heli_schule_prog = false;
};
