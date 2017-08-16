/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Checks targets licenses
*/
private["_nearHQ","_cop","_drunk","_licenses","_random","_randomNames"];

_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
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

if((player distance (getMarkerPos "police_hq_1") < 100)||(player distance (getMarkerPos "cop_spawn_5") < 100)||(player distance (getMarkerPos "cop_spawn_3") < 100)||(player distance (getMarkerPos "police_hq_2") < 100))then
	{
	_nearHQ = true;
	};
_mcu = (nearestobjects [getPos player,["LandVehicle"], 50]) select 0;
if(!isNull _mcu)then
	{
	_nearHQ = true;
	};	
	
if(_nearHQ)exitWith
	{
	hint "You are being scanned for Identification, because your at a police HQ any false ID you may have will not work";
	systemChat "You are being scanned for Identification, because your at a police HQ any false ID you may have will not work";
	[[player getVariable["name",name player],_licenses,_drunk],"DS_cop_displayLicenses",_cop,FALSE] spawn DS_fnc_MP;
	};

if((DS_realEstateArray select 15) == 0)then
	{
	hint "You are being scanned for Identification, because your ID barcode is not hacked your name will be shown to this officer shortly";
	systemChat "You are being scanned for Identification, because your ID barcode is not hacked your name will be shown to this officer shortly";
	[[player getVariable["name",name player],_licenses,_drunk],"DS_cop_displayLicenses",_cop,FALSE] spawn DS_fnc_MP;
	}
	else
	{
	_randomNames = ["Jason","Jason","Aaron","Adam","Bryce","Cody","Damian","Eddy","Frank","Garth","Hank","Isaac","Joey","Kieran","Lloyd","Matt","Neil","Ozzy","Peter","Quinton","Rory"];
	_random = _randomNames select (DS_realEstateArray select 15);
	hint format ["You are being scanned for Identification, the name %1 is being returned",_random];
	systemchat format ["You are being scanned for Identification, the name %1 is being returned",_random];
	_licenses = "Car License<br/>Truck License<br/>Pilot License<br/>Boating License<br/>Small Firearms License";
	[[_random,_licenses,_drunk],"DS_cop_displayLicenses",_cop,FALSE] spawn DS_fnc_MP;
	};





