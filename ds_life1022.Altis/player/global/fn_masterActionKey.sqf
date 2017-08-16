/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Detects what the player is trying to do with the action key and points him in that direction
*/

private ["_target","_object","_targetType","_objectType","_fish"];

if(DS_doingStuff)exitWith{};

_target = cursorTarget;
_object = cursorObject;
_targetType = (typeOf _target);
_objectType = (typeof _object);

if((_objectType isEqualTo "Rabbit_F")&&(!alive _object)&&(player distance _object < 4)&&(player distance kavAtm > 8000))exitwith {
	_object spawn {
		if([player,6,civilian] call DS_fnc_nearbyPlayers)exitWith{titleText ["You can not do this while another player is so nearby","PLAIN"];};
		DS_doingStuff = true;
		hint "Taking Rabbit Remains";
		player playMove "AinvPknlMstpSlayWrflDnon";
		sleep 2;
		DS_doingStuff = false;
		if([player,6,civilian] call DS_fnc_nearbyPlayers)exitWith{titleText ["You can not do this while another player is so nearby","PLAIN"];};
		if(isNil "_this")exitWith{};
		deleteVehicle _this;
		hint "Rabbit remains collected";
		["rabbit",true,1] call DS_fnc_handleInventory;
	};
};

if((_targetType isEqualTo "CraterLong")||(_targetType isEqualTo "CraterLong_small"))exitWith {
	deleteVehicle _target;
};

if((DS_truckDriver)&&(_target getVariable ["chopperMission",false]))exitWith {
	_target setDamage 0;
	_target attachTo [player,[0,5.5,1.2]];
	DS_spikestrip = _target;
	DS_spikeAction = player addAction["Release Object",{if(!isNull DS_spikestrip)then{detach DS_spikestrip; DS_spikestrip enableSimulation true;DS_spikestrip = objNull;}; player removeAction DS_spikeAction; DS_spikeAction = nil;},"",999,false,false,"",'!isNull DS_spikestrip'];
};

if((player distance _target < 6)&&(_target isKindOf "Car")||(_target isKindOf "Air")||(_target isKindOf "Ship")||((_target getVariable ["mechanicMission",false])&&(player getVariable ["mechanic",false])))exitWith {
	[_target] spawn DS_fnc_menuInteractionVehicle;
};

if((player distance _target < 6)&&(_targetType in ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F",
	"Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F","B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"]))exitWith {
	[_target] spawn DS_fnc_menuInteractionVehicle;
};

if((_target isKindOf "Man")&&(player distance _target < 8))exitWith {
	[_target] spawn DS_fnc_menuInteraction;
};

if(player distance _target < 15)then {
	if(_targetType in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F","Land_House_Small_02_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F",
	"Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F",
	"Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F",
	"Land_i_House_Small_03_V1_F"])exitWith {
		[_target] spawn DS_fnc_menuHouseInteraction;
	};
};

if(isNull _target)then {
	_fish = (nearestObjects [player,["Fish_Base_F"],3]) select 0;
	if(!isNil "_fish")then {
		[_fish,false] call DS_civ_fishing;
	};
};

if((["atm",str(_object)] call BIS_fnc_inString)&&(player distance _object < 3)) exitWith {
	[] spawn DS_fnc_menuAtm;
};

if((_objectType isEqualTo "Land_Suitcase_F")&&(player distance _object < 4)) exitWith {
	[_object] call DS_fnc_menuBriefcase;
};

if((_targetType isEqualTo "Land_HumanSkeleton_F")&&(player distance _target < 4))exitWith {
	if(playerSide isEqualTo west)exitWith{[_target] spawn DS_cop_removeRemains;};
	if(player getVariable ["medic",false])exitWith{[_target] spawn DS_med_removeRemainsMedic;};
};