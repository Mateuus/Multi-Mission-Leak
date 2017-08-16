/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Checks targets licenses
*/
private["_cop","_drunk","_licenses","_random","_randomNames"];

_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

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

systemchat format ["%1",DS_realEstateArray select 15];

if((DS_realEstateArray select 15) == 0)then
	{
	systemchat "Sending back normal";
	[[player getVariable["name",name player],_licenses,_drunk],"DS_cop_displayLicenses",_cop,FALSE] spawn DS_fnc_MP;
	}
	else
	{
	systemChat "Sending back special";
	_randomNames = ["Jason"];
	_random = _randomNames select 0;
	_licenses = "Car License<br/>Truck License<br/>Pilot License<br/>Boating License<br/>Small Firearms License";
	[[_random,_licenses,_drunk],"DS_cop_displayLicenses",_cop,FALSE] spawn DS_fnc_MP;
	};






