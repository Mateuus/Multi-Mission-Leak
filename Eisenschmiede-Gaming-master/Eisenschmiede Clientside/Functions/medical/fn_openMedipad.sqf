#include "..\script_macros.hpp"
disableSerialization;
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_nameDead = _unit getVariable["name","Unknown"];
_name = _unit getVariable["realname","Unknown"];
_dead = false;
if(_nameDead != "Unknown") then {_name = _nameDead; _dead = true;};

createDialog "ES_medic_viewer";

_dialog = findDisplay 1000;
_title = _dialog displayCtrl 1001;
_nameCtrl = _dialog displayCtrl 1005;
_unconTimer = _dialog displayCtrl 1003;
_medilog = _dialog displayCtrl 1520;

_title ctrlSetText format["Beobachten Körper von: %1",_name];
_nameCtrl ctrlSetText format["Name: %1",_name];

_idcArr = [1202,1203,1204,1201];
_deadTime = _unit getVariable["medideadtime",serverTime];
_i = 1;
while {dialog && !isnull (findDisplay 1000)} do {
	if(_dead) then {
		_currentTime = serverTime - _deadTime;
		_countDown = [_currentTime,"MM:SS.MS"] call BIS_fnc_secondsToString;
		_unconTimer ctrlSetText format["Bewusstlos seit: %1",_countDown];
	} else {
		_unconTimer ctrlSetText format["Nicht bewusstlos"];
	};
	sleep 0.1;
	_i = _i + 0.1;
	if(_i >= 0.5) then
	{
		_i = 0;
		lbClear _medilog;
		{
			_medilog lbAdd _x;
		} forEach (_unit getVariable["medilog",[]]);
		_dmgArr = [];
		_dmgArr set[0,_unit getHitPointDamage "hitHead"];
		_dmgArr set[1,_unit getHitPointDamage "hitBody"];
		_dmgArr set[2,_unit getHitPointDamage "hitLegs"];
		_dmgArr set[3,_unit getHitPointDamage "hitHands"];

		{
			_dmg = _x;
			_idc = _idcArr select _foreachindex;
			_idc = _dialog displayCtrl _idc;
			_idc ctrlSetTextColor [1,0,0,_dmg];
		} forEach _dmgArr;
	};
};