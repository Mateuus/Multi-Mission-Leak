private ["_sWeap","_pWeap","_hWeapon","_pist"];
_sWeap = secondaryWeapon player;
_pWeap = primaryWeapon player;
_hWeapon = handgunWeapon player;
if ( _sWeap != "" || _pWeap != "" || _hWeapon != "" ) exitwith { hint (localize "STR_Licensing_gun_gotsome")};
player setpos (getMarkerPos "waffenschein_lizenzs");

waffenschein_best = false;
waffenschein_regal addWeaponCargoGlobal ["hgun_Rook40_F",1];
waffenschein_regal addMagazineCargoGlobal ["16Rnd_9x21_Mag", 5];
waffen_lizenz = true;
[] spawn {
	while { waffen_lizenz } do { 
		if ( (player distance (getmarkerpos "waffenschein_lizenzs")) > 8) exitwith { waffen_lizenz = false;
			clearWeaponCargoglobal waffenschein_regal;
			clearMagazineCargoglobal waffenschein_regal;
			player removeWeapon "hgun_Rook40_F";
			player removeMagazines "16Rnd_9x21_Mag";			
			player setPos LICENSER_POS_BACK; 
			licenser_obj setvariable ["gun", false, true];};
		if ( !alive player) exitwith {waffen_lizenz = false;
			clearWeaponCargoglobal waffenschein_regal;
			clearMagazineCargoglobal waffenschein_regal;
			player removeWeapon "hgun_Rook40_F";
			player removeMagazines "16Rnd_9x21_Mag";			
			player setPos LICENSER_POS_BACK; 
			licenser_obj setvariable ["gun", false, true];};
		if ( vehicle player != player ) exitwith {waffen_lizenz = false;
			clearWeaponCargoglobal waffenschein_regal;
			clearMagazineCargoglobal waffenschein_regal;
			player removeWeapon "hgun_Rook40_F";
			player removeMagazines "16Rnd_9x21_Mag";			
			player setPos LICENSER_POS_BACK; 
			licenser_obj setvariable ["gun", false, true];};
		if (waffenschein_best) exitwith {waffen_lizenz = false; };
			
		sleep 1;
	};
};

hintsilent localize "STR_Licensing_gun_leaving";
sleep 5;
hintsilent localize "STR_Licensing_gun_take";
_pist = false;

while {!_pist} do {			
	_hWeapon = handgunWeapon player;			
	if ( _hWeapon == "hgun_Rook40_F") exitwith { _pist = true; };			
	sleep 1;
};

hint localize "STR_Licensing_gun_firsti";
sleep 2;
waffenschein_firsthit = false;
waffen_target1 = "TargetP_Zom_F" createvehicle (getmarkerpos "waffen_target_1");
waffen_target1 addEventHandler ["HitPart",  { waffenschein_firsthit = true;} ];
waffen_target1 setdir 180;
		
while { !waffenschein_firsthit } do {
	if (waffenschein_firsthit) exitwith {};			
	sleep 1;
};		

		waffenschein_firsthit = false;
		hint localize "STR_Licensing_gun_infoss";
		sleep 7;
		
		
		[] spawn {
			waffenschein_best = false;
			_timer = 30;
			while { !waffenschein_best } do {
				_timer = _timer -1;				
				if (_timer < 1 ) exitwith {};
				hintsilent format ["Noch %1 Sekunden...", _timer];				
				sleep 1;
			};
				sleep 5;
				waffen_lizenz = false;
			if (waffenschein_best) then {			
				hint format [(localize "STR_Licensing_car_EndMadeIte"), localize "STR_License_Firearm"];
				license_civ_gun = true;
			} else {
				hint localize "STR_Licensing_car_EndFail";
			};		
			clearWeaponCargoglobal waffenschein_regal;
			clearMagazineCargoglobal waffenschein_regal;
			player removeWeapon "hgun_Rook40_F";
			player removeMagazines "16Rnd_9x21_Mag";			
			player setPos LICENSER_POS_BACK; 
			licenser_obj setvariable ["gun", false, true];
		};
		
		
		deletevehicle waffen_target1;
		
		waffen_target1 = "TargetP_Zom_F" createvehicle (getmarkerpos "waffen_target_2");
		waffen_target1 addEventHandler ["HitPart",  { waffenschein_firsthit = true;} ];
		waffen_target1 setdir 180;
		
		waituntil { sleep 1; waffenschein_firsthit };
		
		waffenschein_firsthit = false;		
		sleep 1;
		deletevehicle waffen_target1;		
		waffen_target1 = "TargetP_Zom_F" createvehicle (getmarkerpos "waffen_target_3");
		waffen_target1 addEventHandler ["HitPart",  { waffenschein_firsthit = true;} ];
		waffen_target1 setdir 180;
		
		waituntil { sleep 1; waffenschein_firsthit };
		
		waffenschein_firsthit = false;		
		sleep 1;
		deletevehicle waffen_target1;		
		waffen_target1 = "TargetP_Zom_F" createvehicle (getmarkerpos "waffen_target_4");
		waffen_target1 addEventHandler ["HitPart",  { waffenschein_firsthit = true;} ];
		waffen_target1 setdir 180;
		
		waituntil { sleep 1; waffenschein_firsthit };
		
		waffenschein_firsthit = false;		
		sleep 1;
		deletevehicle waffen_target1;		
		waffen_target1 = "TargetP_Zom_F" createvehicle (getmarkerpos "waffen_target_5");
		waffen_target1 addEventHandler ["HitPart",  { waffenschein_firsthit = true;} ];
		waffen_target1 setdir 180;
		
		waituntil { sleep 1; waffenschein_firsthit };
		
		waffenschein_firsthit = false;		
		sleep 1;
		deletevehicle waffen_target1;		
		waffen_target1 = "TargetP_Zom_F" createvehicle (getmarkerpos "waffen_target_6");
		waffen_target1 addEventHandler ["HitPart",  { waffenschein_firsthit = true;} ];
		waffen_target1 setdir 180;
		
		waituntil { sleep 1; waffenschein_firsthit };
		
		waffenschein_firsthit = false;		
		sleep 1;
		deletevehicle waffen_target1;		
		waffen_target1 = "TargetP_Zom_F" createvehicle (getmarkerpos "waffen_target_7");
		waffen_target1 addEventHandler ["HitPart",  { waffenschein_firsthit = true;} ];
		waffen_target1 setdir 180;
		
		waituntil { sleep 1; waffenschein_firsthit };
		
		waffenschein_firsthit = false;	
		sleep 1;
		deletevehicle waffen_target1;
		
		waffen_target1 = "TargetP_Zom_F" createvehicle (getmarkerpos "waffen_target_8");
		waffen_target1 addEventHandler ["HitPart",  { waffenschein_firsthit = true;} ];
		waffen_target1 setdir 180;
		
		waituntil { sleep 1; waffenschein_firsthit };
		
		waffenschein_firsthit = false;		
		sleep 1;
		deletevehicle waffen_target1;		
		waffen_target1 = "TargetP_Zom_F" createvehicle (getmarkerpos "waffen_target_6");
		waffen_target1 addEventHandler ["HitPart",  { waffenschein_firsthit = true;} ];
		waffen_target1 setdir 180;
		
		waituntil { sleep 1; waffenschein_firsthit };	
		waffenschein_best = true;
		sleep 2;
		deletevehicle waffen_target1;
		