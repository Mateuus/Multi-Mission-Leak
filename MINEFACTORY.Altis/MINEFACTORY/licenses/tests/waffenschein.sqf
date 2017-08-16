/*

	Author Shinji
	Nya eigentlich was es ist und macht... erklärt sich, oder nicht!?

*/
private["_text2","_result2"];

0 cutText["","BLACK OUT"];
sleep 1;
_text2 = parseText format ["<t><t size='1.35'>Waffenschein<br/><br/></t><t size='1.15'>%1,<br/></t><t><t size='1'>Wenn du deine Waffe benutzt ohne vorher einen Sprachdialog (Eine RP Aufforderung) geführt zu haben wirst du von einem Admin bestraft!<br/><br/></t>",name player];
_result2 = [_text2, false,"Verstanden", false] call BIS_fnc_guiMessage;	
sleep 1;
_text2 = parseText format ["<t><t size='1.35'>Waffenschein<br/><br/></t><t size='1.15'>%1,<br/></t><t><t size='1'>Das gemeinsame überfallen (Ebenfalls nur erlaubt nach einer RP Aufforderung!) ist nur gestattet wenn ihr denselben Clan Tag oder Nachnamen habt!<br/><br/></t>",name player];
_result2 = [_text2, false,"Verstanden", false] call BIS_fnc_guiMessage;	
sleep 1;
playsound "made_it";
hint "Du hast es geschafft!"; 
license_civ_gun = true;
0 cutText ["","BLACK IN"];

/*
private ["_sWeap","_pWeap","_hWeapon","_pist","_begin"];
_sWeap = secondaryWeapon player;
_pWeap = primaryWeapon player;
_hWeapon = handgunWeapon player;

waffenschein_firsthit = false;

execvm "MINEFACTORY\licenses\tests\troller_prevent.sqf";

		if ( _sWeap != "" || _pWeap != "" || _hWeapon != "" ) exitwith { hint "Du musst alle Waffen vorher ablegen!";};

		waffenschein_regal addWeaponCargoGlobal ["hgun_Rook40_F",1];
		waffenschein_regal addMagazineCargoGlobal ["16Rnd_9x21_Mag", 5];

		hintsilent "Beim verlassen des Schussbereichs (eingerahmt mit Holz) wird diese Preufung abgebrochen!";

		sleep 5;

		hintsilent "Nimm dir zu erst die Waffe aus der Kiste. Wir fangen mit kleinen an.";


		_pist = true;

		while {_pist} do {
			
			//_hWeapon = handgunWeapon player;	
			
			if ( _hWeapon == "hgun_Rook40_F") then {wait_1 = true; _pist = false};
			
			sleep 1;
		};
		
		waituntil { sleep 1; wait_1 };
		
		sleep 2;
		hint "Nun wird das Gelaende aufgebaut... einen Moment eben.";
		sleep 5;
		hint "Es werden Gleich einige Ziele erscheinen... Feuere auf sie, erst wenn ein Ziel gelegt ist, wird das naechste aktiviert!";
		sleep 2;
		waffen_target1 = "TargetP_Zom_F" createvehicle (getmarkerpos "waffen_target_1");
		waffen_target1 addEventHandler ["HitPart",  { waffenschein_firsthit = true;} ];
		waffen_target1 setdir 180;
		
		while { !waffenschein_firsthit } do {
			if (waffenschein_firsthit) exitwith {};
			
			sleep 1;
		};
		
		
		
		
		waffenschein_firsthit = false;
		hint "Sehr Gut! Die 8 Ziele werden nun wahllos erscheinen... du hast nun auch eine Zeitbegrenzung. von 30 sek.";
		sleep 7;
		nul = execvm "MINEFACTORY\licenses\tests\waffenschein_count.sqf";
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
		
		