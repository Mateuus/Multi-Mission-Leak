/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Treats any sicknesses that your player may have
*/

private["_meanie"];
_meanie = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _meanie) exitWith {};
if(((DS_coin > 0)&&((DS_realEstateArray select 1) == 0))||((DS_coin > 0)&&((player distance (getMarkerPos "hostage1") < 50)||(player distance (getMarkerPos "hostage2") < 50)||(player distance (getMarkerPos "hostage3") < 50)))) then
	{
	_cop = false;
	if(playerside == west)then { _cop = true };
	[DS_coin,_cop] remoteExec ["DS_civ_robSuccess",_meanie];
	//[1,format["%1 has just robbed %2 for $%3",_meanie getVariable["name",name _meanie],profileName,[DS_coin] call DS_fnc_numberText]] remoteExecCall ["DS_fnc_globalMessage",-2];
	DS_coin = 0;
	[] call DS_fnc_compileData;
	}
	else
	{
	[2,format["%1 has no money on them to rob",profileName]] remoteExecCall ["DS_fnc_globalMessage",_meanie];
	};
if((DS_realEstateArray select 1) != 0)then
	{
	_tempNum = DS_realEstateArray select 1;
	_tempNum = _tempNum - 1;
	DS_realEstateArray set [1,_tempNum];
	};