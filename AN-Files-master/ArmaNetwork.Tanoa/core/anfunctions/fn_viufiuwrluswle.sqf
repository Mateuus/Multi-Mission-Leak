/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
disableSerialization;
if(isNull life_demoVehicle) exitWith {};
_display = findDisplay 2300;
_color = lbData[2100,(lbCurSel 2100)];
[life_demoVehicle,_color] spawn {
	_vehicle = param [0,Objnull,[Objnull]];
	_index = param [1,"",[""]];
	if(isNull _vehicle || {!alive _vehicle}) exitWith {};
	_textures = [_index,typeOf _vehicle] call life_fnc_joefrluchoucrl;
	if(count _textures isEqualTo 0) exitWith {};
	_textures = _textures select 1;
	{
		_vehicle setObjectTexture[_forEachIndex,_x];
	} forEach _textures;
};
