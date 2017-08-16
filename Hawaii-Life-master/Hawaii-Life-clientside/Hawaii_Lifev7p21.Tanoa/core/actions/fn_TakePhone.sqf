/*
	File: fn_TakePhone.sqf
	Author: Larry
	License: Only Hawaii-life.net is allowed to use this Script
*/
private ["_type","_target","_false"];
_type = [_this,0,0,[0]] call BIS_fnc_param;


switch (_type) do {
	case 0: {
		_target = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
		[1,player] remoteExecCall ["life_fnc_TakePhone",_target];
	};
	case 1: {
		_target = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
		if("ItemRadio" in (assignedItems  player)) then {
			player unassignItem "ItemRadio";
			player removeItem "ItemRadio";
			hint "Dir wurde dein Handy aus der Tasche entwendet!";
			[2,player,true] remoteExecCall ["life_fnc_TakePhone",_target];
		} else {
			if("ItemRadio" in (Items  player)) then {
				player removeItem "ItemRadio";
				hint "Dir wurde dein Handy aus der Tasche entwendet!";
				[2,player,true] remoteExecCall ["life_fnc_TakePhone",_target];
			} else {
				[2,player,false] remoteExecCall ["life_fnc_TakePhone",_target];
			};
		};
	};
	case 2: {
		_false = [_this,2,false,[false]] call BIS_fnc_param;
		if (_false) then {
			player addItem "ItemRadio";
			hint "Du hast das Handy erfolgreich abgenommen. Es befindet sich jetzt in deinem Inventar.";
		} else {
			hint "Die Person hat kein Handy bei sich.";
		};
	};
};