/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Messages the driver of a vehicle you are targeted on
*/

private["_target","_fail"];

if(isNil "DS_pullOver")then{DS_pullOver = false;};
if(DS_pullOver)exitwith{hint "You have used this too recently, please wait..."};
_target = cursorTarget;
_fail = false;
if(isNull _target) exitWith {};
if(player distance _target > 1000)exitwith {};
if((_target isKindOf "Air")||(_target isKindOf "Car")||(_target isKindOf "Ship")) then
	{
	_target = (driver _target);
	if(isNil "_target")exitwith {_fail = true;};
	if((side _target) isEqualTo west)exitwith {_fail = true;};
	DS_pullOver = true;
	hint "Message sent to driver!";
	[] remoteExec ["DS_fnc_policePullover",_target];
	}
	else
	{
	hint "No valid target found";
	};

if(_fail)exitwith {};
sleep 30;
DS_pullOver = false;