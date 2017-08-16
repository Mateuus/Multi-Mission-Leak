/*
	File: fn_vAH_takeBack.sqf
	Author: Fresqo
	Description: takes back the item from auction house if its still for sale or expired.
*/
private["_dialog","_myListbox","_data","_typeb","_type","_status","_item","_diff","_iCheck","_amount","_tamount","_id","_checkid","_found","_d","_e"];
disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;

if (!vAH_loaded) exitWith {hint "Das Auktionshaus ist überladen, warte kurz!"};

if (lbCurSel _myListbox < 0) exitWith {hint "Bitte wähle ein Item";};
_data = call compile (_myListbox lbData (lbCurSel _myListbox));

_item = _data select 0;
if (_item == "yolo") exitWith {};
_typeb = _data select 1;
_status = [_data,2,3,[3]] call BIS_fnc_param;
_amount = [_data,3,0,[0]] call BIS_fnc_param;
_id = _data select 4;
_iCheck = true;

if (_status == 3) exitWith {hint "Du hast das Item doch bereits....!";};

_e = missionNamespace getVariable [format["ahItem_%1",_id],false];
if (player getVariable["ahID",0] != _id && !_e) exitWith {hint "Das Item wird gerade verkauft/zurück geholt!";};

if(_typeb == "ymenu") then {_type = 0} else {_type = 1};

_found = [];
{_checkid = _x select 0;if (_checkid == _id) then {_found pushBack _checkid};}forEach all_ah_items;
if (count _found == 0) exitWith {hint "Der Gegenstand wurde gerade verkauft";};

if (_type == 0) then {
_diff = [_item,_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff < _amount) then {_iCheck = false;};
} else {if (_type == 1)then { if (_amount > 1) then {
_iCheck = [_item,_amount] call life_fnc_vAH_checkItem;
		};
	};
};

if(!_iCheck) exitWith {hint localize "STR_NOTF_InvFull";};

switch (_type) do {
	case 0: {[true,_item,_diff] call life_fnc_handleInv;};
	case 1: {
	_tamount = _amount + 1;
			for [{_i=1}, {_i<_tamount}, {_i=_i+1}] do
		{
			[_item,true] call life_fnc_handleItem;
		};
	};
};

[[1,_id],"TON_fnc_vAH_update",false,false] spawn life_fnc_mp;

hint "Item Successfully Retrieved";
closedialog 0;