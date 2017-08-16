/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Gathering
		life_actions pushBack (player addAction["Hanfblüte pflücken",life_fnc_zoneGather,"cannabis",3,false,true,"",'
		!life_action_in_use && (player distance (getMarkerPos "hanf_1") < 50) && (player distance (nearestObject [player,"UserTexture_1x2_F"]) < 2) && (isNull objectParent player) && (life_carryWeight + (["cannabis"] call life_fnc_itemWeight)) <= life_maxWeight']);

		life_actions pushBack (player addAction["Schlafmohn pflücken",life_fnc_zoneGather,"heroinu",3,false,true,"",'
		!life_action_in_use && (player distance (getMarkerPos "mohn_1") < 50) && (player distance (nearestObject [player,"UserTexture_1x2_F"]) < 2) && (isNull objectParent player) && (life_carryWeight + (["heroinu"] call life_fnc_itemWeight)) <= life_maxWeight']);

		life_actions pushBack (player addAction["Kokablatt pflücken",life_fnc_zoneGather,"cocaine",3,false,true,"",'
		!life_action_in_use && (player distance (getMarkerPos "coca") < 100) && (player distance (nearestObject [player,"UserTexture_1x2_F"]) < 2) && (isNull objectParent player) && (life_carryWeight + (["cocaine"] call life_fnc_itemWeight)) <= life_maxWeight']);

		life_actions pushBack (player addAction["Diamant abbauen",life_fnc_zoneGather,"diamond",3,false,true,"",'
		!life_action_in_use && (player distance (getMarkerPos "diamond_2") < 70) && (player distance (nearestObject [player,"UserTexture_1x2_F"]) < 2) && (isNull objectParent player) && (life_carryWeight + (["diamond"] call life_fnc_itemWeight)) <= life_maxWeight && life_inv_pickaxe > 0']);

		life_actions pushBack (player addAction["Tomate pflücken",life_fnc_zoneGather,"tomate",3,false,true,"",'
		!life_action_in_use && (player distance (getMarkerPos "tomate_1") < 22) && (player distance (nearestObject [player,"UserTexture_1x2_F"]) < 2) && (isNull objectParent player) && (life_carryWeight + (["tomate"] call life_fnc_itemWeight)) <= life_maxWeight']);

		life_actions pushBack (player addAction["Salat pflücken",life_fnc_zoneGather,"salat",3,false,true,"",'
		!life_action_in_use && (player distance (getMarkerPos "salat_1") < 22) && (player distance (nearestObject [player,"UserTexture_1x2_F"]) < 2) && (isNull objectParent player) && (life_carryWeight + (["salat"] call life_fnc_itemWeight)) <= life_maxWeight']);

		life_actions pushBack (player addAction["Plutonium abbauen",life_fnc_zoneGather,"plutoniumu",3,false,true,"",'
		!life_action_in_use && (player distance (getMarkerPos "plutonium") < 250) && (player distance (nearestObject [player,"UserTexture_1x2_F"]) < 2) && (isNull objectParent player) && (life_carryWeight + (["plutoniumu"] call life_fnc_itemWeight)) <= life_maxWeight && life_inv_pickaxe > 0']);

		life_actions pushBack (player addAction["Banane plücken",life_fnc_zoneGather,"banane",3,false,true,"",'
		!life_action_in_use && (player distance (getMarkerPos "banane") < 25) && (player distance (nearestObject [player,"UserTexture_1x2_F"]) < 2) && (isNull objectParent player) && (life_carryWeight + (["banane"] call life_fnc_itemWeight)) <= life_maxWeight']);

		life_actions pushBack (player addAction["Tabakblüte pflücken",life_fnc_zoneGather,"tabakblatt",3,false,true,"",'
		!life_action_in_use && (player distance (getMarkerPos "tabak") < 50) && (player distance (nearestObject [player,"UserTexture_1x2_F"]) < 2) && (isNull objectParent player) && (life_carryWeight + (["tabakblatt"] call life_fnc_itemWeight)) <= life_maxWeight']);

		life_actions pushback [player addAction["Angel auswerfen",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped && life_inv_fishingpoles > 0']];
		

		//Ausweise
		life_actions pushback [player addAction["<t color='#00FF00'>Ausweis zeigen</t>",life_fnc_ausweis,2,0,false,true,"",' playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && player distance cursorTarget < 3 && license_civ_ausweis']];
		
		life_actions pushback [player addAction["<t color='#00FF00'>Fahrlizenz zeigen</t>",life_fnc_ShowFahrerLicense,"",0,false,true,"",' playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && player distance cursorTarget < 3 ']];
		
		// take them organs
		life_actions pushback [player addAction["Organ herausschneiden",life_fnc_takeOrgans,"",0,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];
		
		life_actions pushback [player addAction["Tarnnetz aufheben",life_fnc_packupnetz,"",0,false,true,"",' _netz = nearestObjects[getPos player,["CamoNet_INDP_big_F"],8] select 0; !isNil "_netz" && !isNil {(_netz getVariable "item")} && life_netzaktiv;']];
		
		life_actions pushback [player addAction["Nationalflaggen ausfahren",life_fnc_presidentflag,0,0,false,false,"",'license_civ_president && (vehicle player isKindOf "C_SUV_01_F") && !flagsOn']];
		
		life_actions pushback [player addAction["Nationalflaggen einfahren",life_fnc_presidentflag,1,0,false,false,"",'license_civ_president && (vehicle player isKindOf "C_SUV_01_F") && flagsOn']];

		life_actions pushback [player addAction["Kugel verbergen",{deletevehicle lightorb; life_lightorblight = false;},"",0,false,false,"",'life_lightorblight']];
		
		//Smoke
		life_actions pushback [player addaction["Deutschlandfarben zünden",life_fnc_flugzeugsmoke,0,0,false,false,"",'vehicle player isKindOf "B_Plane_CAS_01_F"']];
	};
	
	case west:
	{
		life_actions pushback [player addAction["Holzbarriere aufheben",life_fnc_packupholzb,"",0,false,false,"",' _holzb = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0; !isNil "_holzb" && !isNil {(_holzb getVariable "item")}']];
		life_actions pushback [player addAction["Strassensperre aufheben",life_fnc_packupsperre,"",0,false,false,"",' _sperre = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_sperre" && !isNil {(_sperre getVariable "item")}']];
		life_actions pushback [player addAction["Pylon aufheben",life_fnc_packuphut,"",0,false,false,"",' _hut = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_hut" && !isNil {(_hut getVariable "item")}']];
		life_actions pushback [player addAction["Absperrband aufheben",life_fnc_packupband,"",0,false,false,"",' _band = nearestObjects[getPos player,["TapeSign_F"],8] select 0; !isNil "_band" && !isNil {(_band getVariable "item")}']];

		//Seize PlayerWeapons
		life_actions pushback [player addAction["Waffe beschlagnahmen",{[] remoteExec ["life_fnc_seizePlayerWeaponAction",cursorObject];},0,0,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
		
		//Polizeimarke
		life_actions pushback [player addAction["<t color='#00FF00'>Polizeiausweis zeigen</t>",life_fnc_copShowLicense,"",0,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
    };
	
	case independent:
	{
		life_actions pushback [player addAction["Holzbarriere aufheben",life_fnc_packupholzb,"",0,false,false,"",' _holzb = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0; !isNil "_holzb" && !isNil {(_holzb getVariable "item")}']];
		life_actions pushback [player addAction["Strassensperre aufheben",life_fnc_packupsperre,"",0,false,false,"",' _sperre = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_sperre" && !isNil {(_sperre getVariable "item")}']];
		life_actions pushback [player addAction["Pylon aufheben",life_fnc_packuphut,"",0,false,false,"",' _hut = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_hut" && !isNil {(_hut getVariable "item")}']];
		life_actions pushback [player addAction["Absperrband aufheben",life_fnc_packupband,"",0,false,false,"",' _band = nearestObjects[getPos player,["TapeSign_F"],8] select 0; !isNil "_band" && !isNil {(_band getVariable "item")}']];

		//Ausweis
		life_actions pushback [player addAction["<t color='#00FF00'>AHW-Ausweis zeigen</t>",life_fnc_medShowLicense,"",0,false,true,"",' playerSide == independent && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
	};
};

//Anker und Bootslicht
life_actions pushback [player addAction["Anker werfen",{vehicle player setvelocity [0,0,0];},"",0,false,false,"",'(surfaceisWater (getpos vehicle player)) && (vehicle player isKindOf "Ship")']];
life_actions pushback [player addAction["Bootslicht einschalten",life_fnc_bootslicht,0,0,false,false,"",'(surfaceisWater (getpos vehicle player)) && (vehicle player isKindOf "Ship") && !lightOn']];
life_actions pushback [player addAction["Bootslicht ausschalten",life_fnc_bootslicht,1,0,false,false,"",'(surfaceisWater (getpos vehicle player)) && (vehicle player isKindOf "Ship") && lightOn']];

//Klappstuhl
life_actions pushback [player addAction["Klappstuhl entfernen",life_fnc_packupklappstuhl,"",0,false,true,"",' _klappstuhl = nearestObjects[getPos player,["Land_CampingChair_V1_F"],8] select 0; !isNil "_klappstuhl" && !isNil {(_klappstuhl getVariable "item")} && life_klappstuhlaktiv;']];

//Zigarettenanzünder
life_actions pushback [player addAction["Zigarettenanzünder verwenden",life_fnc_aufladen,0,0,false,false,"",'vehicle player isKindOf "LandVehicle"']];

//Radio
life_actions pushback [player addAction["<t color='#9ACD32'>Radio einschalten</t>",life_fnc_radio,0,0,false,false,"",'!isnull objectParent player && !life_radio && radio_active']];

//Rampe von Blackfish öffnen
life_actions pushback [player addAction["Rampe verwenden",{if((vehicle player) doorPhase "door_1_source" == 0) then {vehicle player animateDoor ["door_1_source",1];} else {vehicle player animateDoor ["door_1_source",0];};},0,0,false,false,"",'vehicle player != player && vehicle player iskindof "B_T_VTOL_01_vehicle_F"']];