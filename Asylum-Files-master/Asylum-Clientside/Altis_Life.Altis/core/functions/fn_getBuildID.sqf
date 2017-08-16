/*
	File: fn_getBuildID.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Gets the Object ID of a static building
*/

private ["_build","_sn","_sf","_ef","_na","_id","_i","_item"];

_build = _this select 0;

_id = _build getVariable ["life_houseId", -1];
if (_id > 0) exitWith { str _id };

_sn = toArray (str (_build));

_sf = false;_ef = false;_na = [];_id = "0";

for "_i" from 0 to (count _sn)-1  do {
	_item = _sn select _i;
	if (_sf and (not (_ef))) then {
		_na set [count _na,_item];
	};
	if (_item == 35) then {
		_sf = true;
	};
	if (_item == 58) then {
		_ef = true;
	};
};

if ((count _na) >=3) then {
	_na set [((count _na)-1) ,"delete"];
	_na = _na - ["delete"];
	_na set [0 ,"delete"];
	_na = _na - ["delete"];
	_id = toString (_na);
};

_id;