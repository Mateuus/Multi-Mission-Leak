/*
	File: fn_dogSearchDrugs.sqf
	Author: ishi
	
	Description:
	Let the dog search for drugs
*/
private ["_unit","_dog","_nearestunits","_radius","_nearest","_inv","_uid","_var","_index"];
_unit = _this select 0;

hint "Rex, sniff!";

_unit setvariable ["follow",'false'];
_unit setvariable ["searchDrugs","true"];
_unit setvariable ["order","active"];
_unit setvariable ["step","go"];

_dog = _unit getvariable "dog";
_radius = 200;

_nearestunits = nearestObjects [_dog, ["Man","LandVehicle","Air","Ship","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"], _radius];
_nearest = [];

["dog_one", _dog] spawn life_fnc_dogPlaySound;
{
	_unit = _x;
	if (count _nearest > 0) exitWith{true}; // One result is enough, as we'll only use the first one
	
	if ((_unit isKindOf "House_F") && !(isNil {(_unit getVariable "house_owner")})) then {
		_uid = (_unit getVariable "house_owner") select 0;
		_inv = _unit getVariable ["Trunk",[[],0]];
		if (([_uid] call life_fnc_isUIDActive) && !(_inv isEqualTo [[],0])) then {
			{
				_var = _x select 0;
				
				_index = [_var,life_drug_items] call TON_fnc_index;
				if(_index != -1) exitWith {_nearest = _nearest + [_unit]};
			} foreach (_inv select 0);
		};
	};
	if ((_unit isKindOf "Air") OR (_unit isKindOf "Ship") OR (_unit isKindOf "LandVehicle")) then {
		_inv = _unit getVariable ["Trunk",[]];
		if (!(count _inv == 0)) then {
			{
				_var = _x select 0;
				
				_index = [_var,life_drug_items] call TON_fnc_index;
				if(_index != -1) exitWith {_nearest = _nearest + [_unit]};
			} foreach (_inv select 0);
		};
	};
	if (_unit isKindOf "Man") then {
		if (side (group _unit) in [civilian,west,independent] && isPlayer _unit) then {
			[[],"life_fnc_searchDrugsClient",_this select 0,false] spawn life_fnc_MP;
			
			_cnt = 0;
			while {(isNil {_unit getVariable "hasDrugs"}) && (_cnt <= 10)} do {
				sleep 0.2;
                                _cnt = _cnt + 1;
			};
			
			if (_unit getVariable ["hasDrugs", false]) exitWith {_nearest = _nearest + [_unit]};
		};
	};
} foreach _nearestunits;

_dog domove getpos (_nearest select 0);

if ((_nearest select 0) isKindOf "House_F") then {waitUntil {(_dog distance (_nearest select 0))<5};}
else {waitUntil {(_dog distance (_nearest select 0))<2};};

_dog domove getpos _dog; // Stop moving
["dog_ruff", _dog] spawn life_fnc_dogPlaySound;