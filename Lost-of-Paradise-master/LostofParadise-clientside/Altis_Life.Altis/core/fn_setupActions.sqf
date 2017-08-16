/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction["Fischernetz auswerfen",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction["<t color='#A9E2F3'>Person Ausrauben</t>",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
	    //Suicide Bomb Vest.
		//life_actions = life_actions + [player addAction["Sprengweste aktivieren",life_fnc_suicideBomb,"",0,false,false,"",'vest player == "V_HarnessOGL_brn" && alive player && playerSide == civilian && !life_istazed && !(player getVariable "Re-strained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
		//Falschgeld
		//life_actions = life_actions + [player addAction["<t color='#FF0000'>Falschgeld aufheben</t>",life_fnc_packupgeld,"",0,false,false,"",' _geld = nearestObjects[getPos player,["Land_Money_F"],8] select 0; !isNil "_geld" && !isNil {(_geld getVariable "item")}']];
		// Organ
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Niere rausschneiden</t>",life_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];
		 //Ausweis
		life_actions = life_actions + [player addAction["<t color='#FFFF00'>Ausweis zeigen</t>",life_fnc_Lizenzzeigen,"",1,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man"']];
		};
	
	case independent:
	{
		//Strahler
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Strahler abbauen</t>",life_fnc_packuplampe,"",0,false,false,"",' _lampe = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0; !isNil "_lampe" && !isNil {(_lampe getVariable "item")}']];
		//Barriere
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Barriere abbauen</t>",life_fnc_packupsperre,"",0,false,false,"",' _sperre = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_sperre" && !isNil {(_sperre getVariable "item")}']];
		//Mauer
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Mauer aufheben</t>",life_fnc_packupwand,"",0,false,false,"",' _wand = nearestObjects[getPos player,["Land_CncBarrierMedium4_F"],8] select 0; !isNil "_wand" && !isNil {(_wand getVariable "item")}']];
		//Schranke
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Schranke aufheben</t>",life_fnc_packupschranke,"",0,false,false,"",' _schranke = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0; !isNil "_schranke" && !isNil {(_schranke getVariable "item")}']];
		//Pylone
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Pylone aufheben</t>",life_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")}']];
		//Dixi
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Toilette aufheben</t>",life_fnc_packupdixi,"",0,false,false,"",' _dixi = nearestObjects[getPos player,["Land_ToiletBox_F"],8] select 0; !isNil "_dixi" && !isNil {(_dixi getVariable "item")}']];
		//Tisch
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Tisch aufheben</t>",life_fnc_packuptisch,"",0,false,false,"",' _tisch = nearestObjects[getPos player,["Land_WoodenTable_large_F"],8] select 0; !isNil "_tisch" && !isNil {(_tisch getVariable "item")}']];
		//Generator
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Generator aufheben</t>",life_fnc_packupgenerator,"",0,false,false,"",' _generator = nearestObjects[getPos player,["Land_Portable_generator_F"],8] select 0; !isNil "_generator" && !isNil {(_generator getVariable "item")}']];
		//Matratze
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Matratze aufheben</t>",life_fnc_packupmatratze,"",0,false,false,"",' _matratze = nearestObjects[getPos player,["Land_Sleeping_bag_blue_F"],8] select 0; !isNil "_matratze" && !isNil {(_matratze getVariable "item")}']];
		//Zelt
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Pavillon aufheben</t>",life_fnc_packupzelt,"",0,false,false,"",' _zelt = nearestObjects[getPos player,["Land_PartyTent_01_F"],8] select 0; !isNil "_zelt" && !isNil {(_zelt getVariable "item")}']];
		//CopEnter - Driver Seat
		life_actions = life_actions + [player addAction[localize "STR_pAct_DriverSeat",life_fnc_medicEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//CopEnter - Passenger Seat
		life_actions = life_actions + [player addAction[localize "STR_pAct_PassengerSeat",life_fnc_medicEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//CopEnter - Exit
		life_actions = life_actions + [player addAction[localize "STR_pAct_GoOut",life_fnc_medicEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		//Ausweis
		life_actions = life_actions + [player addAction["<t color='#FFFF00'>Ausweis zeigen</t>",life_fnc_Lizenzzeigen,"",1,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man"']];
	};
	
	case west:
	{
		//Strahler
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Strahler abbauen</t>",life_fnc_packuplampe,"",0,false,false,"",' _lampe = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0; !isNil "_lampe" && !isNil {(_lampe getVariable "item")}']];
		//Barriere
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Barriere abbauen</t>",life_fnc_packupsperre,"",0,false,false,"",' _sperre = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_sperre" && !isNil {(_sperre getVariable "item")}']];
		//Falschgeld
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Falschgeld aufheben</t>",life_fnc_packupgeld,"",0,false,false,"",' _geld = nearestObjects[getPos player,["Land_Money_F"],8] select 0; !isNil "_geld" && !isNil {(_geld getVariable "item")}']];
		//Pylone
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Pylone aufheben</t>",life_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")}']];
		//Mauer
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Mauer aufheben</t>",life_fnc_packupwand,"",0,false,false,"",' _wand = nearestObjects[getPos player,["Land_CncBarrierMedium4_F"],8] select 0; !isNil "_wand" && !isNil {(_wand getVariable "item")}']];
		//Schranke
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Schranke aufheben</t>",life_fnc_packupschranke,"",0,false,false,"",' _schranke = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0; !isNil "_schranke" && !isNil {(_schranke getVariable "item")}']];
		//CopEnter - Driver Seat
		life_actions = life_actions + [player addAction[localize "STR_pAct_DriverSeat",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//CopEnter - Passenger Seat
		life_actions = life_actions + [player addAction[localize "STR_pAct_PassengerSeat",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//CopEnter - Exit
		life_actions = life_actions + [player addAction[localize "STR_pAct_GoOut",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		//Dixi
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Toilette aufheben</t>",life_fnc_packupdixi,"",0,false,false,"",' _dixi = nearestObjects[getPos player,["Land_ToiletBox_F"],8] select 0; !isNil "_dixi" && !isNil {(_dixi getVariable "item")}']];
		//Tisch
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Tisch aufheben</t>",life_fnc_packuptisch,"",0,false,false,"",' _tisch = nearestObjects[getPos player,["Land_WoodenTable_large_F"],8] select 0; !isNil "_tisch" && !isNil {(_tisch getVariable "item")}']];
		//Generator
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Generator aufheben</t>",life_fnc_packupgenerator,"",0,false,false,"",' _generator = nearestObjects[getPos player,["Land_Portable_generator_F"],8] select 0; !isNil "_generator" && !isNil {(_generator getVariable "item")}']];
		//Matratze
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Matratze aufheben</t>",life_fnc_packupmatratze,"",0,false,false,"",' _matratze = nearestObjects[getPos player,["Land_Sleeping_bag_blue_F"],8] select 0; !isNil "_matratze" && !isNil {(_matratze getVariable "item")}']];
		//Zelt
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Pavillon aufheben</t>",life_fnc_packupzelt,"",0,false,false,"",' _zelt = nearestObjects[getPos player,["Land_PartyTent_01_F"],8] select 0; !isNil "_zelt" && !isNil {(_zelt getVariable "item")}']];
		//Ausweis
		life_actions = life_actions + [player addAction["<t color='#FFFF00'>Ausweis zeigen</t>",life_fnc_Lizenzzeigen,"",1,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man"']];
		};
};