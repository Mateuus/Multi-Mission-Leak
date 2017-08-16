#include "..\..\macros.hpp"
/*
	File: fn_vAH_takeBack.sqf
	Author: Fresqo
	Description: takes back the item from auction house if its still for sale or expired.
*/
private["_dialog","_myListbox","_data","_typeb","_type","_status","_item","_diff","_iCheck","_amount","_tamount","_id","_checkid","_found","_d","_e"];
disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;

if (!vAH_loaded) exitWith {hint "Das Auktionshaus ist zurzeit ausgelastet, versuche es später erneut!"};

if (lbCurSel _myListbox < 0) exitWith {hint "Bitte wähle ein Item aus!";};
_data = call compile (_myListbox lbData (lbCurSel _myListbox));

_item = _data select 0;
if (_item == "yolo") exitWith {};
_typeb = _data select 1;
_status = [_data,2,3,[3]] call BIS_fnc_param;
_amount = [_data,3,0,[0]] call BIS_fnc_param;
_id = _data select 4;
_iCheck = true;

if (_status == 3) exitWith {hint "Du kannst kein Ite kaufen, was du bereits besitzt!";};

_e = missionNamespace getVariable [format["ahItem_%1",_id],false];
if (player getVariable["ahID",0] != _id && !_e) exitWith {hint "Es versucht schon jemand, dieses Item zu kaufen!";};

if(_typeb == "ymenu") then {_type = 0} else {_type = 1};

_found = [];
{_checkid = _x select 0;if (_checkid == _id) then {_found pushBack _checkid};}forEach all_ah_items;
if (count _found == 0) exitWith {hint "Das Item wurde gerade verkauft";};

if (_type == 0) then {
_diff = [_item,_amount,DWEV_carryWeight,DWEV_maxWeight] call DWEV_fnc_calWeightDiff;
if(_diff < _amount) then {_iCheck = false;};
} else {if (_type == 1)then { if (_amount > 1) then {
_iCheck = [_item,_amount] call DWEV_fnc_vAH_checkItem;
		};
	};
};

if(!_iCheck) exitWith { hint "Du hast nich genügend Platz, um das Item zurück zu nehmen.";};


{_checkid = _x select 0;if (_checkid == _id) then {_status = _x select 7};}forEach all_ah_items;
if (_status != 0) exitWith {hint "Dieses Item wurde bereits verkauft bzw. ist abgelaufen!";}; //NOT FOR SALE ANYMORE

switch (_type) do {
	case 0: {[true,_item,_diff] call DWEV_fnc_handlelnv;};
	case 1: {
	_tamount = _amount + 1;
			for [{_i=1}, {_i<_tamount}, {_i=_i+1}] do
		{
			[_item,true] call DWEV_fnc_handleItem;
		};
	};
};

[1,_id] remoteexec ["DWF_fnc_vAH_update",2];

hint "Das Inserat wurde erfolgreich zurückgezogen!";
closedialog 0;

[3] call SOCK_fnc_updatePartial;
