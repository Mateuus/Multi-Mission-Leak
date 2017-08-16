/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
	case civilian: {
		//Drop fishing net
		life_actions = [player addAction[ "Fischernetz auswerfen",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction[ "Person ausrauben",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated"		&& !(cursorTarget getVariable["robbed",FALSE]) ']];
		//Kidnapping
		life_actions = [player addAction["<t color='#00FF00'>Start Geiselnahme</t>",life_fnc_restrainAction,cursorTarget,9999999,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 ']];
	};
	
	case west:
	{
		//CopEnter - Driver Seat
		life_actions = life_actions + [player addAction[ "Auf den Fahrersitz",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//CopEnter - Passenger Seat
		life_actions = life_actions + [player addAction[ "Auf den Passagiersitz",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']]; 
		//CopEnter - Gunner Seat
		life_actions = life_actions + [player addAction[ "gunner seat",life_fnc_copEnter,"gunner",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']]; 
		//CopEnter - Commander Seat
		life_actions = life_actions + [player addAction[ "commander seat",life_fnc_copEnter,"commander",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']]; 
		//CopEnter - Exit
		life_actions = life_actions + [player addAction[ "Aus dem Fahrzeug austeigen",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		//UAV
		life_actions = life_actions + [player addAction[ "Stomper ausparken.",life_fnc_UAV2,false,2,false,false,"",'(cursorTarget isKindOf "B_Truck_01_transport_F") && (license_cop_OP) && player distance cursorTarget < 3.5']];
		life_actions = life_actions + [player addAction[ "Greyhawk ausparken.",life_fnc_UAV3,false,2,false,false,"",'(cursorTarget isKindOf "B_Truck_01_transport_F") && (license_cop_OP) && player distance cursorTarget < 3.5']];
	};
};

//Nitro Fotze
life_actions = life_actions + [player addAction["<t color='#00FF00'>Activate Nitro</t>",life_fnc_activateNitro,false,2,false,false,"",' (vehicle player != player) && (driver vehicle player == player) && (((vehicle player) getVariable["nitro", 0]) > 0) ']];

//Ausweis
life_actions = life_actions + [player addAction["<img image='MINEFACTORY\icons\personalausweis.paa' /><t color='#AFFFAB'>Ausweis zeigen</t>",life_fnc_Lizenzzeigen,"",1,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && cursorTarget distance player < 3.5']];
		
//Knigglichter
life_actions = life_actions + [player addAction["Knicklicht (ROT) in Hand",life_fnc_chemlightUse,"red",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_red" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Knicklicht (GELB) in Hand",life_fnc_chemlightUse,"yellow",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_yellow" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Knicklicht (GRÜN) in Hand",life_fnc_chemlightUse,"green",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_green" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Knicklicht (BLAU) in Hand",life_fnc_chemlightUse,"blue",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_blue" in (magazines player) && vehicle player == player ']];
//Drop Knicklicht
life_actions = life_actions + [player addAction["Drop Knicklicht",{if(isNil "life_chemlight") exitWith {};if(isNull life_chemlight) exitWith {};detach life_chemlight; life_chemlight = nil;},"",-1,false,false,"",'!isNil "life_chemlight" && !isNull life_chemlight && vehicle player == player ']];

//Anschnalen bitte
life_actions pushBack (player addAction ["<img image='MINEFACTORY\icons\anschnallen.paa' /><t color='#BBBB00'>Anschnallen</t>", {life_savelifes = true;}, "", 3, true, true, "", 'vehicle player isKindOf "Car" && !life_savelifes']);
life_actions pushBack (player addAction ["<img image='MINEFACTORY\icons\abschnallen.paa' /><t color='#BBBB00'>Abschnallen</t>", {life_savelifes = false;}, "", 3, true, true, "", 'vehicle player isKindOf "Car" && life_savelifes']);