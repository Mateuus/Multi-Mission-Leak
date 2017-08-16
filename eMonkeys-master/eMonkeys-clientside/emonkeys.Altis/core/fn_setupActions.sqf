/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
_box =["CargoNet_01_box_F"];
switch (playerSide) do
{
	case west:
    {
		EMonkeys_actions = [player addAction["Festnehmen",EMonkeys_fnc_restrainAction,cursorTarget,9999999,false,false,"",' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && ((alive cursorTarget) && !( cursorTarget getVariable["onkill",FALSE])) && cursorTarget distance player < 3.5 && (animationState cursorTarget=="Incapacitated" or animationState cursorTarget=="AinjPfalMstpSnonWnonDf_carried_fallwc"  or animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !(cursorTarget getVariable "Escortingciv") && !(cursorTarget getVariable "restrainedciv") && speed cursorTarget < 1 ']];		
        EMonkeys_actions = EMonkeys_actions + [player addAction["Objekte beschlagnahmen",EMonkeys_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
		
		//Lights?
		EMonkeys_actions = EMonkeys_actions + [player addAction["Blaulicht AN",{[[vehicle player,0.22],"EMonkeys_fnc_copLights",true,false] call EMonkeys_fnc_mp; vehicle player setVariable["lights",true,true];},"",0,false,false,"",' vehicle player != player && (typeOf vehicle player) in ["B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_bench_F","B_Quadbike_01_F","C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","I_MRAP_03_F","I_MRAP_03_hmg_F","I_Heli_light_03_unarmed_F","I_Heli_light_03_F","O_Heli_Light_02_unarmed_F","B_Heli_Light_01_F","I_Heli_Transport_02_F","C_Hatchback_01_sport_F","O_Truck_03_transport_F","O_Truck_03_covered_F","C_Van_01_box_F"] && !isNil {vehicle player getVariable "lights"} && ((driver vehicle player) == player) && !(vehicle player getVariable "lights") ']];
		EMonkeys_actions = EMonkeys_actions + [player addAction["Blaulicht AUS",{vehicle player setVariable["lights",false,true];},"",0,false,false,"", ' vehicle player != player && (typeOf vehicle player) in ["B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_bench_F","B_Quadbike_01_F","C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","I_MRAP_03_F","I_MRAP_03_hmg_F","I_Heli_light_03_unarmed_F","I_Heli_light_03_F","O_Heli_Light_02_unarmed_F","B_Heli_Light_01_F","I_Heli_Transport_02_F","C_Hatchback_01_sport_F","O_Truck_03_transport_F","O_Truck_03_covered_F","C_Van_01_box_F"] && !isNil {vehicle player getVariable "lights"} && ((driver vehicle player) == player) && (vehicle player getVariable "lights") ']];
		EMonkeys_actions = EMonkeys_actions + [player addAction ["<t color='#FF0000'>EMP Menü öffnen</t>","core\eMonkeys\emp\launchEmp.sqf",[1],0,false,true,""," license_cop_air && ((_target turretUnit[0] == _this) or (commander _target == _this)) and (vehicle player != player)"]];
		EMonkeys_actions = EMonkeys_actions + [player addAction["<t color='#FF0000'>Mauer aufheben</t>",EMonkeys_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && player distance _mauer < 8']];
		EMonkeys_actions = EMonkeys_actions + [player addAction["<t color='#FF0000'>Kegel aufheben</t>",EMonkeys_fnc_packupkegel,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "itemkegel")} && player distance _mauer < 8']];
	};
	case civilian:
	{
		//Drop fishing net
		EMonkeys_actions = [player addAction["Drop Fishing Net",EMonkeys_fnc_dropFishingNet,"",0,false,false,"",'(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && EMonkeys_carryWeight < EMonkeys_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !eM_net_dropped ']];
		//Rob person
		EMonkeys_actions = EMonkeys_actions + [player addAction["Ausrauben",EMonkeys_fnc_robAction,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && (animationState cursorTarget=="Incapacitated" or  animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") && !(cursorTarget getVariable["robbed",FALSE]) && !eM_paintball']];
		EMonkeys_actions = EMonkeys_actions + [player addAction["Kiste öffnen",EMonkeys_fnc_kisteopenInventory,"",0,false,false,"",'vehicle player == player && playerSide == civilian && typeof cursorTarget in ["CargoNet_01_box_F"] && player distance cursorTarget < 3.5']];	
		EMonkeys_actions = EMonkeys_actions + [player addAction["<t color='#FF0000'>Mauer aufheben</t>",EMonkeys_fnc_packupmauer,"",0,false,false,"",'_mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && (["adac"] call EMonkeys_fnc_permLevel) > 1 && player distance _mauer < 8']];
		EMonkeys_actions = EMonkeys_actions + [player addAction["<t color='#FF0000'>Kegel aufheben</t>",EMonkeys_fnc_packupkegel,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "itemkegel")} && (["adac"] call EMonkeys_fnc_permLevel) > 1 && player distance _mauer < 8']];
	};
	
	case east:
	{
		//Drop fishing net
		EMonkeys_actions = [player addAction["Drop Fishing Net",EMonkeys_fnc_dropFishingNet,"",0,false,false,"",'(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && EMonkeys_carryWeight < EMonkeys_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !eM_net_dropped ']];
		//Rob person
		EMonkeys_actions = EMonkeys_actions + [player addAction["Ausrauben",EMonkeys_fnc_robAction,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && (animationState cursorTarget=="Incapacitated" or  animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") && !(cursorTarget getVariable["robbed",FALSE]) && !eM_paintball']],
		EMonkeys_actions = EMonkeys_actions + [player addAction["Kiste öffnen",EMonkeys_fnc_kisteopenInventory,"",0,false,false,"",'vehicle player == player && playerSide == east && typeof cursorTarget in ["CargoNet_01_box_F"] && player distance cursorTarget < 3.5']];	
		EMonkeys_actions = EMonkeys_actions + [player addAction["<t color='#FF0000'>Mauer aufheben</t>",EMonkeys_fnc_packupmauer,"",0,false,false,"",'_mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && (["adac"] call EMonkeys_fnc_permLevel) > 1 && player distance _mauer < 8']];
		EMonkeys_actions = EMonkeys_actions + [player addAction["<t color='#FF0000'>Kegel aufheben</t>",EMonkeys_fnc_packupkegel,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "itemkegel")} && (["adac"] call EMonkeys_fnc_permLevel) > 1 && player distance _mauer < 8']];
	};
	
	case independent:
	{
		//Lights?
		EMonkeys_actions = EMonkeys_actions + [player addAction["Siren Lights ON",{[[vehicle player,0.22],"EMonkeys_fnc_medicLights",true,false] call EMonkeys_fnc_mp; vehicle player setVariable["lights",true,true];},"",0,false,false,"",' vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","C_SUV_01_F","O_Truck_03_medical_F","I_Truck_02_medical_F","B_Truck_01_medical_F","C_Van_01_box_F","C_Hatchback_01_sport_F","O_Heli_Light_02_unarmed_F","B_Heli_Light_01_F"] && !isNil {vehicle player getVariable "lights"} && ((driver vehicle player) == player) && !(vehicle player getVariable "lights") ']];
		EMonkeys_actions = EMonkeys_actions + [player addAction["Siren Lights OFF",{vehicle player setVariable["lights",false,true];},"",0,false,false,"", ' vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","C_SUV_01_F","O_Truck_03_medical_F","I_Truck_02_medical_F","B_Truck_01_medical_F","C_Hatchback_01_sport_F","O_Heli_Light_02_unarmed_F","B_Heli_Light_01_F","C_Van_01_box_F"] && !isNil {vehicle player getVariable "lights"} && ((driver vehicle player) == player) && (vehicle player getVariable "lights") ']];
		EMonkeys_actions = EMonkeys_actions + [player addAction["<t color='#FF0000'>Mauer aufheben</t>",EMonkeys_fnc_packupmauer,"",0,false,false,"",'_mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && player distance _mauer < 8']];
		EMonkeys_actions = EMonkeys_actions + [player addAction["<t color='#FF0000'>Kegel aufheben</t>",EMonkeys_fnc_packupkegel,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "itemkegel")} && player distance _mauer < 8']];
	};
};

EMonkeys_actions = EMonkeys_actions + [player addAction["<t color='#FF0000'>Spieler Heilen</t>",EMonkeys_fnc_heal,"",99,false,false,"",' vehicle player == player && (damage cursorTarget) > 0.25 && ("Medikit" in (items player)) && !isNull cursorTarget && cursorTarget isKindOf "Man" && player distance cursorTarget < 3.5']];
EMonkeys_actions = EMonkeys_actions + [player addAction["<t color='#FF0000'>Mich heilen</t>",EMonkeys_fnc_healme,"",99,false,false,"",'vehicle player == player && (damage player) > 0.25 && ("Medikit" in (items player))']];