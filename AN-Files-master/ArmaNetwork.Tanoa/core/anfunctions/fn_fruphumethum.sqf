#include <macro.h>
/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_ret","_bad","_bail","_esc","_countDown","_prisonvault","_clothings"];
params [
	["_time",15,[0]],
	["_arrestReason","",[""]]
];
_esc = false;
if !(isNil "life_is_arrested") exitWith {};
player setVariable ["arrested",true,true];
if(_arrestReason isEqualTo "") then {
	_arrestReason = "No Arrest Reason Given";
	life_arrested_reason = _arrestReason;
	} else {
	_arrestReason = _arrestReason;
	life_arrested_reason = _arrestReason;
};
life_is_arrested = true;
life_arrested_time = _time;
//[11] call life_fnc_maphuwres;

hint "Due to being jailed your locker inventory has been seized and destroyed";
[0,LockerInventory,(getPlayerUID player)] remoteExecCall ["life_fnc_lockerUpdate",2];
removeAllWeapons player;
{player removeMagazine _x} forEach (magazines player);

if(uniform player != "AN_JAIL_UNI") then {
	jail_clothing_vest = vest player;
	jail_clothing_uniform = uniform player;
	jail_clothing_backpack = backpack player;
	removeVest player;
	removeUniform player;
	removeBackpackGlobal player;
	removeGoggles player;
	removeHeadgear player;
	removeAllAssignedItems player;
	player forceAddUniform "AN_JAIL_UNI";
	waitUntil {uniform player isEqualTo "AN_JAIL_UNI"};
};

AN_Inventory = [];
[3] call life_fnc_maphuwres;
_prisonCellSelection = ["jail_cell_a","jail_cell_a_1","jail_cell_a_2","jail_cell_a_3","jail_cell_a_4","jail_cell_a_5","jail_cell_a_6","jail_cell_a_7","jail_cell_a_8","jail_cell_a_9","jail_cell_a_10","jail_cell_a_11","jail_cell_b","jail_cell_b_1","jail_cell_b_2","jail_cell_b_3","jail_cell_b_4","jail_cell_b_5","jail_cell_b_6","jail_cell_b_7","jail_cell_b_8","jail_cell_b_9","jail_cell_b_10","jail_cell_b_11","jail_cell_c","jail_cell_c_1","jail_cell_c_2","jail_cell_c_3","jail_cell_c_4","jail_cell_c_5","jail_cell_c_6","jail_cell_c_7","jail_cell_c_8","jail_cell_c_9","jail_cell_c_10","jail_cell_c_11","jail_cell_d","jail_cell_d_1","jail_cell_d_2","jail_cell_d_3","jail_cell_d_4","jail_cell_d_5","jail_cell_d_6","jail_cell_d_7","jail_cell_d_8","jail_cell_d_9","jail_cell_d_10","jail_cell_d_11"];
_secondFloorCells = ["jail_cell_c","jail_cell_c_1","jail_cell_c_2","jail_cell_c_3","jail_cell_c_4","jail_cell_c_5","jail_cell_c_6","jail_cell_c_7","jail_cell_c_8","jail_cell_c_9","jail_cell_c_10","jail_cell_c_11","jail_cell_d","jail_cell_d_1","jail_cell_d_2","jail_cell_d_3","jail_cell_d_4","jail_cell_d_5","jail_cell_d_6","jail_cell_d_7","jail_cell_d_8","jail_cell_d_9","jail_cell_d_10","jail_cell_d_11"];
if(isNil "life_jailcell") then {
	_prisonChosen = selectRandom _prisonCellSelection;
	_markerPos = getMarkerPos _prisonChosen;
	life_jailcell = _prisonChosen;
	if(_prisonChosen in _secondFloorCells) then {
		player setposATL [(_markerPos select 0),(_markerPos select 1),3.9];
	} else {
		player setposATL [(_markerPos select 0),(_markerPos select 1),0.6];
	};
} else {
	_markerPos = getMarkerPos life_jailcell;
	if(life_jailcell in _secondFloorCells) then {
		player setposATL [(_markerPos select 0),(_markerPos select 1),3.9];
	} else {
		player setposATL [(_markerPos select 0),(_markerPos select 1),0.6];
	};
};
player setVariable ["tf_unable_to_use_radio", true];
disableSerialization;
("ANJailTimer" call BIS_fnc_rscLayer) cutRsc["ANJail","PLAIN"];
_timer = uiNamespace getVariable["ANJail",displayNull];
_timerText = _timer displayCtrl 1100;

_time = diag_tickTime + (_time * 60);
_checkTime = diag_tickTime;
_esc = false;

while{(round(_time - diag_tickTime) > 1) || (!alive player && (round(_time - diag_tickTime) > 0))} do
{
	life_thirst = 5000;
	life_hunger = 5000;
	_timerText ctrlSetStructuredText parseText format ["<t align='center' valign='middle'>%1 - %2</t>",_arrestReason,([(_time - diag_tickTime),"MM:SS"] call BIS_fnc_secondsToString)];
	if(!alive player) exitWith {};
	if(!(player inArea "PrisonBreakMarker") && {alive player}) exitWith {_esc = true;};
	if(diag_tickTime - _checkTime > (2 * 60)) then {
		life_arrested_time = round((_time - diag_tickTime) / 60);
		[11] call life_fnc_maphuwres;
		_checkTime = diag_tickTime;
	};
	sleep 0.45;
};

switch (true) do {
	case (_esc): {
		player setVariable ["arrested",nil,true];
		life_is_arrested = nil;
		life_arrested_time = 0;
		life_arrested_reason = [];
		life_jailcell = nil;
		("ANJailTimer" call BIS_fnc_rscLayer) cutFadeOut 1;
		hintSilent localize "STR_Jail_EscapeSelf";
		[0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_brusathusek",-2];
		[12] call life_fnc_maphuwres;
		player setVariable ["tf_unable_to_use_radio", false];
	};

	case (!alive player): {
		player setVariable ["arrested",nil,true];
		life_is_arrested = nil;
		titleText["As you died whilst in Jail, your time has been increased!","PLAIN"];
		life_arrested_time = life_arrested_time + 15;
		[11] call life_fnc_maphuwres;
	};

	case (alive player && {!_esc}): {
		player setVariable ["arrested",nil,true];
		life_is_arrested = nil;
		life_arrested_time = 0;
		life_arrested_reason = [];
		life_jailcell = nil;
		("ANJailTimer" call BIS_fnc_rscLayer) cutFadeOut 1;
		hintSilent localize "STR_Jail_Released";
		//[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",2];
		player setPos (getMarkerPos "jail_release");
		removeUniform player;
		/* ITEMS */
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		player addVest jail_clothing_vest;
		player addBackpackGlobal jail_clothing_backpack;
		if(jail_clothing_uniform isEqualTo "") then {
			player forceAddUniform "U_C_Poloshirt_blue";
		} else {
			player forceAddUniform jail_clothing_uniform;
		};
		player setVariable ["tf_unable_to_use_radio", false];
		[3] call life_fnc_maphuwres;
		[12] call life_fnc_maphuwres;
	};
};
("ANJailTimer" call BIS_fnc_rscLayer) cutFadeOut 1;
