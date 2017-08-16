/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;
_vehicleNr = lbData [1500,(lbCurSel 1500)];
_vehicle = life_vehicles select parseNumber(_vehicleNr);
_owners = _vehicle getVariable "vehicle_info_owners";
_index = [(getPlayerUID player),_owners] call life_fnc_kuthaxadrep;
life_vehicles deleteAt parseNumber(_vehicleNr);
_index = _owners find [(getPlayerUID player),profileName,playerSide];
if(_index isEqualTo -1) exitWith {closeDialog 0; hintSilent "Internal Error!";};
_owners deleteAt _index;
_vehicle setVariable["vehicle_info_owners",_owners,true];
closeDialog 0;
