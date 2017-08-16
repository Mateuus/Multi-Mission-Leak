/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop","_conditions","_condok"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
EMonkeys_shop_type = _shop;

//Check conditions
_shop_data = [EMonkeys_shop_type] call EMonkeys_fnc_virt_shops;
_condok = true;
_gruppe_fail = false;

if(count _shop_data == 1) then
{
	if(_shop_data select 0 == "gruppe_fail") then {_gruppe_fail = true};

};

if(count _shop_data >= 3) then
{
	_conditions = _shop_data select 2;
	
	{
		switch (_x) do 
		{
			case "cop": { _condok = _condok && (playerSide == west); };
			case "med": { _condok = _condok && (playerSide == independent); };
			case "reb": { _condok = _condok && license_civ_rebel; };
			case "VIP": { _condok = _condok && (EMonkeys_VIP > 0); };
			case "ap": { _condok = _condok && (["ap"] call EMonkeys_fnc_permLevel) > 0; };
		};
	}
	foreach _conditions;
};

if(!_condok) exitWith {["Händler Information",["Du kannst bei diesem Geschäft nichts kaufen"],"#0090ff"] call EMonkeys_fnc_specialText;};
if(_gruppe_fail) exitWith {["Nicht Freigeschaltet",["Deine Gruppierung hat diesen Shop","noch nicht freigeschaltet"],"#FF0000"] call EMonkeys_fnc_specialText;};

createDialog "shops_menu";

[] call EMonkeys_fnc_virt_update;
