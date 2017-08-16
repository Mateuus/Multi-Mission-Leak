#include <macro.h>
/*
	File: fn_setupActions.sqf

	Description:
	Master addAction file handler for all client-based actions.
*/

//earplugs
life_actions = [player addAction["<t color='#ADFF2F'>Ohrenstöpsel einstecken</t>",{if (soundVolume == 1) then {1 fadeSound 0.1;}},"",-6,false,false,"",'soundVolume == 1']];
life_actions pushBack [player addAction["<t color='#ADFF2F'>Ohrenstöpsel stufe erhöhen</t>",{0 fadeSound (soundVolume / 5)},"",-6,false,false,"",'soundVolume < 1']];
life_actions pushBack [player addAction["<t color='#ADFF2F'>Ohrenstöpsel herausnehmen</t>",{if (soundVolume != 1) then {1 fadeSound 1;} },"",-6,false,false,"",'soundVolume != 1']];

switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions pushBack [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];

        //Rob person
		life_actions pushBack [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && ((animationState cursorTarget == "Incapacitated") OR (animationState cursorTarget == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon")) && !(cursorTarget GVAR["robbed",FALSE]) ']];

		//Rob smartphone and GPS
		life_actions pushBack [player addAction["Smartphone und GPS abnehmen",life_fnc_robsmartphoneAction,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && (animationState cursorTarget=="Incapacitated" or animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" or cursorTarget getVariable "restrained") ']];

		//Taxameter
		[] spawn {
			waitUntil{sleep 1; life_session_completed}; 
			if(license_civ_taxi) then {
				life_actions pushBack [player addAction["<t color='#f0ff00'>Taxameter starten</t>",PG_fnc_taxameter,"",0,false,false,"",
				'(vehicle player != player) && {isNull PG_taxameterVehicle} && {!(vehicle player getVariable["taxameterOn",false])} && {
				vehicle player getVariable ["life_veh_color",-1] in (
					switch (typeOf vehicle player) do {
						case "C_Offroad_01_F": {[6,9];};
						case "C_SUV_01_F": {[18];};
						case "C_Hatchback_01_F": {[9];};
						case "C_Hatchback_01_sport_F": {[6];};
						default {[];};
					}
				)
				}']];
			};
		};
	};

	case west:
	{
		life_actions pushBack [player addAction["Drogen und Alkoholtest",life_fnc_drugtestAction,cursorTarget,0,false,true,"",' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (cursorTarget getVariable ["restrained",false]) && (side cursorTarget == civilian) && player distance cursorTarget < 2.5 && !(cursorTarget getVariable "Escorting") ']];

		life_actions pushBack [player addAction["<t color='#FF0000'>Joint ausmachen</t>",life_fnc_extinguishJoint,"",6, false, true, "",' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (cursorTarget getVariable ["restrained",false]) && (side cursorTarget == civilian) && player distance cursorTarget < 2.5 && (cursorTarget getVariable ["smoke_weed",false]) && (cursorTarget getVariable ["restrained",false]) ']];

		life_actions pushBack [player addAction["Waffe beschlagnahmen",life_fnc_seizePlayerWeapon,cursorTarget,0,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable ["restrained", true])']];

		life_actions pushBack [player addAction["Auf den Fahrersitz",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//CopEnter - Passenger Seat
		life_actions pushBack [player addAction["Auf den Passagiersitz",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//CopEnter - Exit
		life_actions pushBack [player addAction["Aussteigen",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		// nano EMP Little Bird
		life_actions pushBack [player addAction["<t color='#FF0000'>EMP Operator Konsole öffnen</t>",life_fnc_openEmpMenu,[],8,false,false,"",'[_this] call life_fnc_isEmpOperator']];
		//Weapon Removing
		life_actions pushBack [player addAction["Waffen entfernen",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
	};

	case independent:
	{
		life_actions pushBack [player addAction["Auf den Fahrersitz",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5']];
		//CopEnter - Passenger Seat
		life_actions pushBack [player addAction["Auf den Passagiersitz",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5']];
		//CopEnter - Exit
		life_actions pushBack [player addAction["Aussteigen",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		//Check Owner
		life_actions pushBack [player addAction["Eigentümer ermitteln",life_fnc_searchVehAction,cursorTarget,20,false,false,"",'(vehicle player == player) && !isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && cursorTarget distance player < 5']];
		//Impound Vehicles
		life_actions pushBack [player addAction["Fahrzeug abschleppen",life_fnc_impoundAction,[],10,false,false,"",'(vehicle player == player) && !isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && cursorTarget distance player < 5']];
		//Repair Map
		life_actions pushBack [player addAction["Mapobjekte reparieren",{{_x setDamage 0} forEach nearestTerrainObjects[player,[],10]},[],10,false,false,"",'(vehicle player == player)']];
		//Delete Corpses
		life_actions pushBack [player addAction["Leiche einpacken",{_pos = position cursorTarget; deleteVehicle cursorTarget; _sack = "Land_sack_F" createVehicle _pos; _sack addAction["Leichensack tragen",{ _this select 0 attachTo[player,[0,0.7,0.4]]; player addAction ["Leichensack verstauen",{deleteVehicle (nearestObjects[player,["Land_sack_F"],5] select 0); player removeAction (_this select 2)}] }];},[],10,false,false,"",'(vehicle player == player) && cursorTarget isKindOf "Man" && !(alive cursorTarget)']];

	};

	case east:
	{
		life_actions pushBack [player addAction["Auf den Fahrersitz",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5 && locked cursorTarget isEqualTo 2 && cursorTarget in life_vehicles']];
		//CopEnter - Passenger Seat
		life_actions pushBack [player addAction["Auf den Passagiersitz",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5 && locked cursorTarget isEqualTo 2 && cursorTarget in life_vehicles']];
		//CopEnter - Exit
		life_actions pushBack [player addAction["Aussteigen",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2) && cursorTarget in life_vehicles']];
	};
};
