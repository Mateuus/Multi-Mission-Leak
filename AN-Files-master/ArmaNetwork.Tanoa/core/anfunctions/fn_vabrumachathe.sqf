/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 isEqualTo -1) exitWith {hintSilent localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
if(isNil "_vehicle") exitWith {hintSilent localize "STR_Garage_Selection_Error"};
/*
_price = getNumber(missionConfigFile >> "CfgVehicles" >> _vehicle >> "retrievePrice" >> str(playerSide));
if(!(_price isEqualType 0) OR _price < 1) then {_price = 100};
if(an_bank < _price) exitWith {hintSilent format[(localize "STR_Garage_CashError"),[_price] call life_fnc_rupadudejat];};
*/
_spawnPoint = "";
if(life_garage_sp isEqualType []) then {
	{
		if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air","Tank"],5]) isEqualTo 0) exitWith {_spawnPoint = _x;};
	} forEach life_garage_sp;
} else {
	if(count(nearestObjects[(getMarkerPos life_garage_sp),["Car","Ship","Air","Tank"],5]) isEqualTo 0) exitWith {_spawnPoint = life_garage_sp;};
};
if(_spawnPoint isEqualTo "") exitWith {titleText [localize "STR_Shop_Veh_Block", "PLAIN"];};
[_vid,(getPlayerUID player),_spawnPoint,player,_price,markerDir(_spawnPoint)] remoteExec ["TON_fnc_spawnVehicle",2];
["RetrievingVehicleGarage"] call life_fnc_notificationHandler;
//[_price,1,1] call life_fnc_sewawruk;
