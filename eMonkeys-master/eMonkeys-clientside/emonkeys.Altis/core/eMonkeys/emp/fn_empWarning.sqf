/* 
EMP Warning Script
File: empWarning.sqf
Author: Black Eye
Date: 2014.11.10
Version: 1.00
*/
if(!hasInterface && isServer) exitWith {};




if(_this select 0 == vehicle player) then
{
	if(_this select 1 == "warning") then
	{
		cutText ["EMP WARNUNG!","PLAIN"];
	};
	if(_this select 1 == "fired") then
	{
		_curSecond = timeUntinFilanEmpExecution;
		while{_curSecond > 0} do
		{
			_meldung = format ["ACHTUNG - Der EMP wurde abgefeuert! %1 Sekunden bis Einschlag!", _curSecond];
			cutText [_meldung, "PLAIN", 0];
			_curSecond = _curSecond - 1;
			uisleep 1;
		};
		cutText ["", "PLAIN", 0];
	};
};