/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks target's licenses
*/

private["_nearHQ","_cop","_drunk","_licenses","_random","_randomNames"];

_cop = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_nearHQ = false;

_licenses = "";
{
	if(missionNamespace getVariable _x) then
	{
		_licenses = _licenses + ([_x] call DS_fnc_itemStringConfig) + "<br/>";
	};
} foreach DS_licenseArray;

if(_licenses == "") then {_licenses = "No Licenses<br/>";};

_drunk = DS_drunk;
if(_drunk == 0)then{_drunk = "No alcohol detected";}else{_drunk = "Alcohol detected";};

if((player distance (getMarkerPos "cop_spawn_7") < 100)||(player distance (getMarkerPos "cop_spawn_4") < 100)||(player distance (getMarkerPos "police_hq_1") < 100)||(player distance (getMarkerPos "cop_spawn_6") < 100)||(player distance (getMarkerPos "cop_spawn_5") < 100)||(player distance (getMarkerPos "cop_spawn_3") < 100)||(player distance (getMarkerPos "police_hq_2") < 100))then
	{
	_nearHQ = true;
	};
_mcu = (nearestObjects [player,["O_Truck_03_covered_F"], 50]) select 0;
if(!isNil "_mcu")then
	{
	if(_mcu getVariable ["isMCU",false])then
		{
		_nearHQ = true;
		};
	};

_mcu2 = (nearestObjects [player,["I_C_Boat_Transport_02_F"], 50]) select 0;
if(!isNil "_mcu2")then
	{
	if(_mcu2 getVariable ["isMCUWater",false])then
		{
		_nearHQ = true;
		};
	};

if(_nearHQ)exitWith
	{
	hint "You are being scanned for identification. Because you are at a Police HQ, any false ID you may have will not work";
	systemChat "You are being scanned for identification. Because you are at a Police HQ, any false ID you may have will not work";
	[player getVariable["name",name player],_licenses,_drunk] remoteExec ["DS_cop_displayLicenses",_cop];
	};

if((DS_realEstateArray select 14) == 0)then
	{
	hint "You are being scanned for identification. Because your ID barcode is not hacked your name will be shown to this officer shortly";
	systemChat "You are being scanned for identification. Because your ID barcode is not hacked your name will be shown to this officer shortly";
	[player getVariable["name",name player],_licenses,_drunk,player] remoteExec ["DS_cop_displayLicenses",_cop];
	}
	else
	{
	_randomNames = ["Jason","Jason","Aaron","Adam","Bryce","Cody","Damian","Eddy","Frank","Garth","Hank","Isaac","Joey","Kieran","Lloyd","Matt","Neil","Ozzy","Peter","Quinton","Rory"];
	_random = _randomNames select (DS_realEstateArray select 14);
	hint format ["You are being scanned for identification. The name %1 is being returned",_random];
	systemchat format ["You are being scanned for identification. The name %1 is being returned",_random];
	_licenses = "Car License<br/>Truck License<br/>Pilot License<br/>Boating License<br/>Small Firearms License<br/>Advanced Firearms License";
	[_random,_licenses,_drunk,player] remoteExec ["DS_cop_displayLicenses",_cop];
	};