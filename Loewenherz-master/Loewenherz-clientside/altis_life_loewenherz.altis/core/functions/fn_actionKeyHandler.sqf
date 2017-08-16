#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater"];
_curTarget = cursorTarget;
if(lhm_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(lhm_interrupted) exitWith {lhm_interrupted = false;};
_isWater = surfaceIsWater (visiblePositionASL player);

if((player getVariable["isEscorting",false])) exitWith {
	[] call lhm_fnc_copInteractionMenu;
};

if(isNull _curTarget) exitWith {

	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call lhm_fnc_catchFish;
		};
		//EMP CONSOLE
			if (vehicle player iskindof "B_Heli_Transport_01_F" && vehicle player turretUnit [0] == player && playerside isEqualTo west)then
			{
				[] call lhm_fnc_openEmpMenu;
			};
	} else {

		if(playerSide isEqualTo civilian && !lhm_action_gathering) then {
			_handle = [] spawn lhm_fnc_gather;
			waitUntil {scriptDone _handle};
			lhm_action_gathering = false;
		};

		if(count(nearestObjects [player, ["Land_Razorwire_F"], 3]) != 0 && playerSide isEqualTo west)then {

			_curTarget = ((nearestObjects [player, ["Land_Razorwire_F"], 3]) select 0);
			if(damage _curTarget < 1) exitwith{};

			if(([true,"spikeStrip",1] call lhm_fnc_handleInv)) then
			{
				player playmove "AinvPknlMstpSlayWrflDnon";
				titleText["Du hast das Nagelband aufgehoben","PLAIN"];
				deleteVehicle _curTarget;
			}
			else
			{
				hint localize "STR_NOTF_InvFull";
			};
		};
		if(playerSide in [west, independent]) then {
			if(count(nearestObjects [player, ["UserTexture10m_F"], 1]) != 0)then {
				//Entferne keine Texturen die aus dem Editor stammen. Varname muss mit benutzerTextur starten damit diese nicht entfernt wird
				if([str(nearestObjects [player, ["UserTexture10m_F"], 10] select 0) ,"benutzerTextur"] call KRON_StrInStr) exitWith {};
				player playmove "AinvPknlMstpSlayWrflDnon";
				_curTarget = ((nearestObjects [player, ["UserTexture10m_F"], 1]) select 0);
				deleteVehicle _curTarget;
				titletext["Sauerei entfernt","Plain down"];
			};
			//Aufheben von Straßensperren
			if(count(nearestObjects [player, ["RoadBarrier_F"], 5]) != 0)then {
				player playmove "AinvPknlMstpSlayWrflDnon";
				_curTarget = ((nearestObjects [player, ["RoadBarrier_F"], 5]) select 0);
				deletevehicle _curTarget;
				[true,"roadbarrier1",1] call lhm_fnc_handleInv;
				titleText["Du hast eine Roadbarrier aufgehoben","PLAIN DOWN"];
			};
			//Aufheben von Road Cons
			if(count(nearestObjects [player, ["Roadcone_L_F"], 5]) != 0)then {
				player playmove "AinvPknlMstpSlayWrflDnon";
				_curTarget = ((nearestObjects [player, ["Roadcone_L_F"], 5]) select 0);
				deletevehicle _curTarget;
				[true,"roadcone1",1] call lhm_fnc_handleInv;
				titleText["Du hast eine Roadcone aufgehoben","PLAIN DOWN"];
			};
		};
		//EMP CONSOLE
		if (vehicle player iskindof "B_Heli_Transport_01_F" && vehicle player turretUnit [0] == player && playerside isEqualTo west)then
		{
			[] call lhm_fnc_openEmpMenu;
		};
	};
};


_done = false;
// LHM Basebuild fix here
if(!(_curTarget in [rsb1,rsb2,rsb3,dome3,dome2,dome1])) then {
	if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} && (_curTarget getVariable ["gangarea_id",-1] isEqualTo -1) OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
		_done = true;
		[_curTarget] call lhm_fnc_houseMenu;
	};
};
if(_done) exitWith {};

if((_curTarget isKindOf "B_supplyCrate_F" OR _curTarget isKindOf "Box_IND_Grenades_F") && {player distance _curTarget < 3} ) exitWith {
	if(alive _curTarget) then {
		[_curTarget] call lhm_fnc_containerMenu;
	};
};

//EMP CONSOLE
if (vehicle player iskindof "B_Heli_Transport_01_F" && vehicle player turretUnit [0] == player && playerside isEqualTo west)then
{
	[] call lhm_fnc_openEmpMenu;
};


if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
lhm_action_inUse = true;

//Temp fail safe.
[] spawn {
	sleep 60;
	lhm_action_inUse = false;
};

if ((_curTarget iskindof "Land_GasTank_01_khaki_F") or (_curTarget iskindof "Land_GasTank_01_blue_F") or (_curTarget iskindof "Land_GasTank_01_yellow_F")) then
{
player playmove "AinvPknlMstpSlayWrflDnon";
deletevehicle _curTarget;
[true,"gas",16] call lhm_fnc_handleInv;
titleText["Du hast 16 Gasflaschen bekommen","PLAIN DOWN"];

};
//Aufheben von Roadcones Cop
if (_curTarget iskindof "Roadcone_L_F" && playerside in [west,independent]) then
{
player playmove "AinvPknlMstpSlayWrflDnon";
deletevehicle _curTarget;
[true,"roadcone1",1] call lhm_fnc_handleInv;
titleText["Du hast einen Roadcone aufgehoben","PLAIN DOWN"];

};


// Aufheben von Roadbarriers Cop
if (_curTarget iskindof "RoadBarrier_F" && playerside in [west,independent]) then
{
player playmove "AinvPknlMstpSlayWrflDnon";
deletevehicle _curTarget;
[true,"roadbarrier1",1] call lhm_fnc_handleInv;
titleText["Du hast eine Roadbarrier aufgehoben","PLAIN DOWN"];

};

if((player distance cursorObject) < 5 && (call lhm_adminlevel) > 1 && (cursorObject getVariable ["gangarea_id", -1]) isEqualTo -1 && (cursorObject isKindOf "Flag_Quontrol_F") && !(cursorObject getVariable["LHM_COP_BUILD",false])) then {
	[] spawn build_fnc_setOwner;

};
// Aufheben von Motion Sensoren
if (_curTarget iskindof "Land_HandyCam_F") then
{
player playmove "AinvPknlMstpSlayWrflDnon";
deletevehicle _curTarget;
[true,"sensor",1] call lhm_fnc_handleInv;
titleText["Du hast einen Sensor aufgehoben","PLAIN DOWN"];

};

if (typeof(_curTarget) != "Flag_Quontrol_F" && _curTarget getvariable["LHM_COP_BUILD",false] && playerside in [west,east]) then
{

	[_curTarget] call lhm_fnc_cop_build_object_options;

};


if(playerside isEqualTo west && typeof(_curTarget) == "O_Truck_02_Ammo_F") then {

	[] call lhm_fnc_cop_build_truck_start;
};

if(playerside isEqualTo east && typeof(_curTarget) == "O_Truck_02_Ammo_F") then {

	[] call lhm_fnc_sec_build_truck_start;
};

if(playerside in [west,east] && typeof(_curTarget) == "Flag_Quontrol_F" && _curTarget getvariable["LHM_COP_BUILD",false]) then {

	[] call lhm_fnc_cop_build_choose;
};

if (_curTarget iskindof "Land_Runway_PAPI_4" && playerside isEqualTo west) then
{

	[_curTarget] call lhm_fnc_copInteractionMenu;

};

if(_curTarget in [rsb1,rsb2,rsb3,dome3,dome2,dome1] && playerside isEqualTo west) then {

	[_curTarget] call lhm_fnc_copInteractionMenu;
};



if (_curTarget iskindof "MAN" && playerside isEqualTo independent) then
{

	[_curTarget] call lhm_fnc_medInteractionMenu;

};

if (_curTarget iskindof "Land_GasTank_02_F") then
{
	private["_container"];
	_container = nearestObjects[getPos player,["Land_GasTank_02_F"],6] select 0;
	if(isNil "_container") exitWith {};

	if(([true,"uranwaste",16] call lhm_fnc_handleInv)) then
	{
		titleText["Du hast 16x Uranabfall aufgenommen","PLAIN"];
		deleteVehicle _container;
	}
	else
	{
		hint localize "STR_NOTF_InvFull";
	};
};

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide in [west,independent]}) exitWith {
	//Hotfix code by ins0
	if(((playerSide isEqualTo west && {(call lhm_revive_cops)}) || playerSide isEqualTo independent) && {"Medikit" in (items player)}) then {
		[_curTarget] call lhm_fnc_revivePlayer;
	};
};




//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if((_curTarget getVariable["restrained",false]) && !dialog && playerSide isEqualTo west) then {
		[_curTarget] call lhm_fnc_copInteractionMenu;
	};

	// LHM START open Civ Menu
	if((_curTarget getVariable["restrained",false]) && !dialog && playerSide isEqualTo civilian) then {
		[_curTarget] call lhm_fnc_civInteractionMenu;
	};
	// LHM END
	} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "Land_Money_F";

	//It's a vehicle! open the vehicle interaction key!
if(_isVehicle and !(_curTarget isKindOf "RoadCone_L_F")) then { // LHM check target is not the road cone
		if(!dialog) then {
            if (player distance _curTarget < ((boundingBox _curTarget select 1) select 0)+2 && (!(player getVariable ["restrained",false])) && (!(player getVariable ["playerSurrender",false])) && !lhm_knockout && !lhm_istazed) then {
                [_curTarget] call lhm_fnc_vInteractionMenu;
            };
		};
	} else {
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then {
			if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then {
				private["_handle"];
				_handle = [_curTarget] spawn lhm_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else {
				private["_handle"];
				_handle = [_curTarget] spawn lhm_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		} else {
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then {
				//OK, it was a misc item (food,water,etc).
				private["_handle"];
				_handle = [_curTarget] spawn lhm_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			} else {
				//It wasn't a misc item so is it money?
				if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
					private["_handle"];
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn lhm_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
				};
			};
		};
	};
};



