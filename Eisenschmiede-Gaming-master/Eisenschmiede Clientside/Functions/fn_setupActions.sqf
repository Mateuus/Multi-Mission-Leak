/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/

if (playerSide == civilian) then {

	ES_actions = ES_actions + [player addAction[localize "STR_pAct_DropFishingNet",ES_fnc_dropFishingNet,"",0,false,false,"",'(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && ES_carryWeight < ES_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !ES_net_dropped ']];
	ES_actions = ES_actions + [player addAction[localize "STR_pAct_RobPerson",ES_fnc_robAction,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
	ES_actions = ES_actions + [player addAction["Schneide Organe heraus",ES_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];
	ES_actions = ES_actions + [player addAction["<t color='#00FF00'>Personalausweis zeigen</t>",ES_fnc_civAusweis,"",1,false,true,"",' !isNull cursorTarget  && cursorTarget isKindOf "Man" && cursorTarget distance player < 3.5']];	
	ES_actions = ES_actions + [player addAction["Tonne",{[true] spawn ES_fnc_transporttonne},'',0,false,false,"",'(count(attachedObjects player) == 0) && (typeOf cursorTarget) isEqualTo "Land_MetalBarrel_F" ']];
	ES_actions = ES_actions + [player addAction["Suche nach Tieren",ES_fnc_animaltracker,"",-1,false,false,"",'playerSide == civilian && player distance (getMarkerPos "hunting_marker") < 600']];
	ES_actions = ES_actions + [player addAction["Tonne Abstellen",{[false] spawn ES_fnc_transporttonne},'',0,false,false,"",'(count(attachedObjects player) != 0) && (typeOf ((attachedObjects player) select 0) IsEqualTo "Land_MetalBarrel_F")']];				

};

if (playerSide == west) then {

	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>EMP Operator Konsole öffnen</t>",ES_fnc_openEmpMenu,[],8,false,false,"",'[_this] call ES_fnc_isEmpOperator']];
	ES_actions = ES_actions + [player addAction["<t color='#00FF00'>Polizeimarke zeigen</t>",ES_fnc_copShowLicense,"",1,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && cursorTarget distance player < 3.5']];
	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>Pylone aufheben</t>",ES_fnc_packuppylone,"",0,false,false,"",' _pylone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_pylone" && !isNil {(_pylone getVariable "item")}']];
	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>Schranke aufheben</t>",ES_fnc_packupschranke,"",0,false,false,"",' _schranke = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0; !isNil "_schranke" && !isNil {(_schranke getVariable "item")}']];
	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>Barriere aufheben</t>",ES_fnc_packupbarriere,"",0,false,false,"",' _barriere = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_barriere" && !isNil {(_barriere getVariable "item")}']];
	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>Absperrung aufheben</t>",ES_fnc_packuptape,"",0,false,false,"",' _tape = nearestObjects[getPos player,["TapeSign_F"],8] select 0; !isNil "_tape" && !isNil {(_tape getVariable "item")}']];
	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>Beleuchtung aufheben</t>",ES_fnc_packuplicht,"",0,false,false,"",' _licht = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0; !isNil "_licht" && !isNil {(_licht getVariable "item")}']];
    ES_actions = ES_actions + [player addAction["Generalschlüssel Fahrer",ES_fnc_copEnter,"driver",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Car" && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
	ES_actions = ES_actions + [player addAction["Generalschlüssel Beifahrer",ES_fnc_copEnter,"passenger",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Car" && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
	ES_actions = ES_actions + [player addAction["Aussteigen",ES_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']]; 
	ES_actions = ES_actions + [player addAction["Waffen beschlagnahmen",ES_fnc_seizePlayerWeapon,cursorTarget,0,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
	ES_actions = ES_actions + [player addAction["Gegenstände beschlagnahmen",ES_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];	
	ES_actions = ES_actions + [player addAction["Tonne Aufheben",{[true] spawn ES_fnc_transporttonne},'',0,false,false,"",'(count(attachedObjects player) == 0) && (typeOf cursorTarget) isEqualTo "Land_MetalBarrel_F" ']];
	ES_actions = ES_actions + [player addAction["Grab Turtle",ES_fnc_catchTurtle,"",0,false,false,"",'((player distance (getMarkerPos "turtle_1") < 200) OR (player distance (getMarkerPos "turtle_2") < 200) OR (player distance (getMarkerPos "turtle_3") < 200)) && {count (nearestObjects[getPos player,["Turtle_F"],4])  > 0} && {(ES_carryWeight + (["turtle_raw"] call ES_fnc_itemWeight)) <= ES_maxWeight}']];
	ES_actions = ES_actions + [player addAction["Tonne Abstellen",{[false] spawn ES_fnc_transporttonne},'',0,false,false,"",'(count(attachedObjects player) != 0) && (typeOf ((attachedObjects player) select 0) IsEqualTo "Land_MetalBarrel_F")']];
	ES_actions = ES_actions + [player addAction["<t color='#050CED'>Magnetblaulicht abbauen</t>",ES_fnc_blaulichtwegnehmen,"",1,false,true,"",' vehicle player != player && count attachedObjects vehicle player == 1 && (typeOf vehicle player) in ["C_SUV_01_F","C_Hatchback_01_sport_F"] ']];

};

if (playerSide == independent) then {

	ES_actions = ES_actions + [player addAction["Gegenstände beschlagnahmen",ES_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
	ES_actions = ES_actions + [player addAction["<t color='#00FF00'>Rettungdienstausweiss zeigen</t>",ES_fnc_medShowLicense,"",1,false,true,"",' playerSide == independent && !isNull cursorTarget && cursorTarget isKindOf "Man" && cursorTarget distance player < 3.5']];
	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>Pylone aufheben</t>",ES_fnc_packuppylone,"",0,false,false,"",' _pylone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_pylone" && !isNil {(_pylone getVariable "item")}']];
	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>Schranke aufheben</t>",ES_fnc_packupschranke,"",0,false,false,"",' _schranke = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0; !isNil "_schranke" && !isNil {(_schranke getVariable "item")}']];
	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>Barriere aufheben</t>",ES_fnc_packupbarriere,"",0,false,false,"",' _barriere = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_barriere" && !isNil {(_barriere getVariable "item")}']];
	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>Absperrung aufheben</t>",ES_fnc_packuptape,"",0,false,false,"",' _tape = nearestObjects[getPos player,["TapeSign_F"],8] select 0; !isNil "_tape" && !isNil {(_tape getVariable "item")}']];
	ES_actions = ES_actions + [player addAction["<t color='#FF0000'>Beleuchtung aufheben</t>",ES_fnc_packuplicht,"",0,false,false,"",' _licht = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0; !isNil "_licht" && !isNil {(_licht getVariable "item")}']];
	ES_actions = ES_actions + [player addAction["Tonne",{[true] spawn ES_fnc_transporttonne},'',0,false,false,"",'(count(attachedObjects player) == 0) && (typeOf cursorTarget) isEqualTo "Land_MetalBarrel_F" ']];
	ES_actions = ES_actions + [player addAction["Tonne Abstellen",{[false] spawn ES_fnc_transporttonne},'',0,false,false,"",'(count(attachedObjects player) != 0) && (typeOf ((attachedObjects player) select 0) IsEqualTo "Land_MetalBarrel_F")']];
	ES_actions = ES_actions + [player addAction["<t color='#050CED'>Blaulichter abbauen</t>",ES_fnc_blaulichtwegnehmen_medic,"",1,false,true,"",' vehicle player != player && count attachedObjects vehicle player >= 2 && (typeOf vehicle player) in ["I_Truck_02_box_F","B_Truck_01_transport_F","B_Truck_01_mover_F","C_Van_01_box_F"] ']];
};