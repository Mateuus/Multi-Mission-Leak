/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if((lbCurSel 1500) isEqualTo -1) exitWith {titleText[localize "STR_Shop_Veh_DidntPick","PLAIN"];};
_className = lbData[1500,(lbCurSel 1500)];
_vIndex = lbValue[1500,(lbCurSel 1500)];
_basePrice = getNumber(missionConfigFile >> "CfgShops" >> "vehicles" >> (life_veh_shop select 0) >> _className >> "price");
_texture = lbData[2100,(lbCurSel 2100)];
if(_basePrice < 0) exitWith {};
_rentPrice = _basePrice * 0.8;
if(an_cash < _rentPrice) exitWith {titleText[format[localize "STR_Shop_Veh_NotEnough", [_rentPrice - an_cash] call life_fnc_rupadudejat],"PLAIN"];};
_neededLicense = getText(missionConfigFile >> "CfgShops" >> "vehicles" >> (life_veh_shop select 0) >> "neededLicense");
if(_neededLicense != "" && {!([_neededLicense,"bool"] call life_fnc_licenseFind)}) exitWith{titleText[localize "STR_Shop_Veh_NoLicense","PLAIN"];};
_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";
if(_spawnPoints isEqualType []) then {
	{
		if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air","Tank"],5]) isEqualTo 0) exitWith {_spawnPoint = _x};
	} forEach _spawnPoints;
} else {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air","Tank"],5]) isEqualTo 0) exitWith {_spawnPoint = _spawnPoints};
};
if(_spawnPoint isEqualTo "") exitWith {titleText [localize "STR_Shop_Veh_Block", "PLAIN"];};
[_rentPrice,0,1] call life_fnc_sewawruk;
titleText[format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_rupadudejat],"PLAIN"];
[player,_className,_spawnPoint,(getPlayerUID player),profileName,playerSide,_texture,_rentPrice] remoteExec ["life_fnc_vehicleRentFinalise",2];
closeDialog 0;
life_veh_shop = nil;
