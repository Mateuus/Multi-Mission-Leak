/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
if((lbCurSel 1500) isEqualTo -1) exitWith {titleText[localize "STR_Shop_Veh_DidntPick","PLAIN"];};
_className = lbData[1500,(lbCurSel 1500)];
_vIndex = lbValue[1500,(lbCurSel 1500)];
_basePrice = getNumber(missionConfigFile >> "CfgShops" >> "vehicles" >> (life_veh_shop select 0) >> _className >> "price");
_texture = lbData[2100,(lbCurSel 2100)];
if(_basePrice < 0) exitWith {};
if(an_cash < _basePrice) exitWith {titleText[format[localize "STR_Shop_Veh_NotEnough", [_basePrice - an_cash] call life_fnc_rupadudejat],"PLAIN"];};
_neededLicense = getText(missionConfigFile >> "CfgShops" >> "vehicles" >> (life_veh_shop select 0) >> "neededLicense");
if(_neededLicense != "" && !([_neededLicense,"bool"] call life_fnc_licenseFind)) exitWith {titleText[localize "STR_Shop_Veh_NoLicense","PLAIN"];};
_rentOnly = getNumber(missionconfigfile >> "CfgVehicles" >> (_className) >> "rentOnly" >> str(playerSide));
if(_rentOnly isEqualTo 1) exitWith {hintSilent "This Vehicle is only available for Rent!";};
_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";
//Check if there is multiple spawn points and find a suitable spawnpoint.
if(_spawnPoints isEqualType []) then {
	{
		if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air","Tank"],5]) isEqualTo 0) exitWith {_spawnPoint = _x};
	} forEach _spawnPoints;
} else {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air","Tank"],5]) isEqualTo 0) exitWith {_spawnPoint = _spawnPoints};
};
if(_spawnPoint isEqualTo "") exitWith {titleText [localize "STR_Shop_Veh_Block", "PLAIN"];};
[_basePrice,0,1] call life_fnc_sewawruk;
titleText[format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_rupadudejat],"PLAIN"];
[player,_className,_spawnPoint,(getPlayerUID player),profileName,playerSide,_texture,_basePrice] remoteExec ["life_fnc_vehiclePurchased",2];
closeDialog 0;
call life_fnc_tleproaviuqiup;
life_veh_shop = nil;
