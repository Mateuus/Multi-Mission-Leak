_counter = 0;
_license_prog = true;
license_granted = false;
wall_accepted = false;
flug_zum_kastro = false;
heli_schule_gesch = true;
heli_schule_prog= true;
player setpos (getmarkerpos "license_heli_positioning");
hint localize "STR_Licensing_heli_info";
sleep 8;
_owners = getPlayerUID player;

heli1 = "B_Heli_Light_01_F" createVehicle (getMarkerPos "heli_license_spawn");
heli1 setVariable["vehicle_info_owners",_owners,true];
clearWeaponCargoGlobal heli1;
clearItemCargoGlobal heli1;
clearMagazineCargoGlobal heli1;
sleep 0.1;
player moveindriver heli1;
sleep 1;
hint localize "STR_Licensing_heli_breakup";
sleep 4;
[] spawn  {
	while {heli_schule_prog} do {
		if (! (alive player)) then { heli_schule_prog = false; heli_schule_gesch = false;};
		if (vehicle player == player ) then { heli_schule_prog = false; heli_schule_gesch = false;};
		if ((getDammage heli1) >= 0.05) then { heli_schule_prog = false; heli_schule_gesch = false;};
		sleep 1;
	};
};
while { heli_schule_prog } do {
TitleText[(localize "STR_Licensing_heli_exam1"),"BLACK FADED", 2];
sleep 5;
titleFadeOut 2;

waituntil {sleep 3,((getPos heli1 select 2) >=49)};


heliarrow1 = "Sign_Arrow_Large_F"  createVehicle (getMarkerPos "heli_sign1");

ziel_marker= createMarkerLocal ["auftrags_ziel_marker", position player ];
"auftrags_ziel_marker" setMarkerBrushLocal "Cross";
"auftrags_ziel_marker" setMarkerColorLocal "ColorRed";
"auftrags_ziel_marker" setMarkerPosLocal (getpos heliarrow1 );
"auftrags_ziel_marker" setMarkerTypeLocal "hd_WARNING"; 
"auftrags_ziel_marker" setMarkerSizelocal [1, 1];


TitleText[(localize "STR_Licensing_heli_exam2"),"BLACK FADED", 2];
sleep 6;
titleFadeOut 2;

sleep 4;

TitleText[(localize "STR_Licensing_heli_exam3"),"BLACK FADED", 2];
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

TitleText[(localize "STR_Licensing_heli_exam4"),"BLACK FADED", 2];
sleep 10;
titleFadeOut 2;

waituntil {sleep 3,(((getPos heli1 select 2) <=12) && (heli1 distance ( markerPos "helitrans_pos" ) <= 15))};

detach helitransp;
deletevehicle helitransp;

TitleText[(localize "STR_Licensing_heli_exam5"),"BLACK FADED", 2];
deleteMarkerLocal "auftrags_ziel_marker";
deletevehicle heliarrow1;
sleep 5;

heliarrow1 = "Sign_Arrow_Large_F"  createVehicle (getMarkerPos "heli_kastro_last");

TitleText[(localize "STR_Licensing_heli_exam6"),"BLACK FADED", 2];
sleep 3;
titleFadeOut 2;

flug_zum_kastro = true;
stoppe_die_zeit = 0;
_counter= 0;
_min = 0;

while {flug_zum_kastro} do 
{
	_counter = _counter + 1;
	if (_min >= 2) then {hint (localize "STR_Licensing_car_EndFail");; 			
		sleep 8;
		heli_schule_prog = false;
		heli_schule_gesch = false;
		flug_zum_kastro = false;		
	};
	hintsilent format [ (localize "STR_Licensing_heli_exam7"),_min,_counter ];
	if ((((getPos heli1 select 2) <=12) && (heli1 distance ( markerPos "heli_kastro_last" ) <= 15))) then {
		flug_zum_kastro = false;
		heli_schule_gesch = true;
		heli_schule_prog = false;
	};

	if (_counter >= 59 ) then {_counter = 0; _min = _min +1;};

	sleep 1;
	};

};
	titleText [(localize "STR_Licensing_car_EndStopp"),"PLAIN"];
if ( heli_schule_gesch ) then {		
	sleep 3;
	titleFadeOut 2;
	sleep 12;			
	heli_schule_prog = false;
	hint format [(localize "STR_Licensing_car_EndMadeIte"), localize "STR_License_Pilot"];
	license_civ_pilot = true;
} else {
	hint (localize "STR_Licensing_car_EndFail");
	sleep 8;		
	heli_schule_prog = false;
};
deletevehicle heliarrow1;
deletevehicle heli1;
licenser_obj setvariable ["air", false, true];
player setpos LICENSER_POS_BACK;