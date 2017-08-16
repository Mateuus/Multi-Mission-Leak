private ["_isMan","_isAmmoBox","_isVehicle","_object","_txtTmp","_result"];
_object = _this select 0;

if(isNil "_object") exitWith {Hint "Error getting Cursor Object\n Try Again!"};

_isMan = _object isKindOf "Man";
_isAmmoBox = _object isKindOf "Reammobox_F";
_isVehicle = cursorTarget isKindOf "AllVehicles";
_text = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName");
sleep 0.1;
if( (_isVehicle or _isAmmoBox) and !_isMan) then {

_result = [format["Are you sure to clear the following Box: %1?",_text], "Confirm clear cargo", true, true] call BIS_fnc_guiMessage;
waituntil{ str _result == "true" or  str _result == "false"};

if(_result) then {

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearBackpackCargoGlobal _object;
clearItemCargoGlobal _object;

waitUntil {
	getWeaponCargo _object isEqualTo [[],[]];
	getMagazineCargo _object isEqualTo [[],[]];
	getBackpackCargo _object isEqualTo [[],[]];
	getItemCargo _object isEqualTo [[],[]];
};

_txtTmp = format ["Inventory of %1 cleared!",_text];
[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

if(typeOf _object == "B_CargoNet_01_ammo_F") then {
	[[_object],"build_fnc_updateCargo",false,false] call lhm_fnc_mp;
};

[["admin",(format["%1 with UID %2 has cleared Cargo from %3",name player,getPlayerUID player,_object])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;

} else {
["Clear Cargo aborted!", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;
};

};