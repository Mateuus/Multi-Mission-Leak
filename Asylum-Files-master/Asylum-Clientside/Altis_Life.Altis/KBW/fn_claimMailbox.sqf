/*
fn_claimMailbox.sqf
Kevin Webb
Description: Mail time, mail time, maaaaaaiiiilll tiiiiiiime!
Copyright © 2015 Kevin Webb, All rights reserved
Written for Asylum Entertainment ™
*/
hint "Querying mailbox information... Please wait!";
[player,"KBW_fnc_queryMail",false] call life_fnc_MP;
waitUntil {!isNil "life_mailbox"};
hintSilent "";
if(count life_mailbox == 0) exitWith {hint "You don't seem to have anything in your mailbox at this time!"; life_mailbox = nil};
_chosen = [];
_whatItemType = "";
_index = -1;
{
	_whatItemType = if(typeName (_x select 1) == "ARRAY") then {"Weapon"} else {"Virtual"};
	_displayName = switch(_whatItemType) do {
		case "Weapon": {([_x select 0] call life_fnc_fetchCfgDetails) select 1};
		case "Virtual": {[_x select 0] call life_fnc_varToStr};
	};
	if(typeName (_x select 0) == "STRING" && {_x select 0 == "cash"}) then {_displayName = format["$%1",_x select 1]; _whatItemType = "cash"};
	_action = [
		format["Would you like to claim your %1?",_displayName],
		"Altis Exchange Mail",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	_index = _forEachIndex;
	if(_action) exitWith {_chosen = _x};
} forEach life_mailbox;
if(count _chosen == 0) exitWith {life_mailbox = nil};
_variable = if(_whatItemType == "Virtual") then {[_chosen select 0,1] call life_fnc_varHandle} else {""};
if(_whatItemType == "Virtual" && (life_maxWeight - life_carryWeight) < [_variable] call life_fnc_itemWeight) exitWith {hint "You don't have enough space to claim any of this resource!"; life_mailbox = nil};
_isHGUN = _whatItemType == "Weapon" && {["hgun",_chosen select 0] call BIS_fnc_inString} && {!(["PDW",_chosen select 0] call BIS_fnc_inString)};
if(_whatItemType == "Weapon" && ((_isHGUN && handgunWeapon player != "") || (!_isHGUN && primaryWeapon player != ""))) exitWith {hint "You need to have the relevant weapon slot free to claim this item."; life_mailbox = nil};

switch(_whatItemType) do {
	case "Weapon": {
		player addWeapon (_chosen select 0);
		[[803, player, format["Claimed %1 from their Exchange mailbox", _chosen]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
		{
			if(_x != "") then {
				player addPrimaryWeaponItem _x;
			};
		} forEach (_chosen select 1);
		if(count _chosen == 4 && {(_chosen select 3) > 1}) then {
			_chosen set[3,(_chosen select 3) - 1];
			life_mailbox set[_index,_chosen];
		} else {
			life_mailbox = life_mailbox - [_chosen];
		};
	};
	case "Virtual": {
		_acceptable = floor((life_maxWeight - life_carryWeight) / ([_variable] call life_fnc_itemWeight));
		if(_acceptable > _chosen select 1) exitWith {
			[true,_variable,_chosen select 1] call life_fnc_handleInv;
			life_mailbox = life_mailbox - [_chosen];
			[[803, player, format["Claimed %1 from their Exchange mailbox", _variable]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
		};
		[true,_variable,_acceptable] call life_fnc_handleInv;
		life_mailbox set[_index,[(life_mailbox select _index) select 0,(((life_mailbox select _index) select 1) - _acceptable),floor(random 10000)]];
		[[803, player, format["Claimed %1 %2 from their Exchange mailbox", _acceptable, _variable]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
		hint "You couldn't carry all of what was in your mailbox, so you have withdrawn just as much as you can carry.";
	};
	case "cash": {
		["atm","add",_chosen select 1] call life_fnc_uC;
		life_mailbox = life_mailbox - [_chosen];
		[[803, player, format["Claimed %1 cash from their Exchange mailbox", _chosen]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
};
[[life_mailbox,getPlayerUID player],"KBW_fnc_updateMailbox",false] call life_fnc_MP;
life_mailbox = nil;