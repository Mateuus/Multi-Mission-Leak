/* Huntah
Plays sound to all server
Warns them not to kill in safezones
*/

private ["_message"];

if(miscInfoArray select 6) exitwith {hint 'Used too recently';};
miscInfoArray set[6,true];
publicVariable "miscInfoArray";

if(DS_pistolsOnly)then
	{
	_message = "The server is currently running a pistols only event, during this event pistols are only the weapon that is allowed to be used.";
	}
	else
	{
	_message = "This mission file is still in Beta, some features may be missing or broken. Be patient while things are fixed. Feel free to come onto TS and ask questions";
	};

[[_message],"DS_fnc_DarkSide_Warnings"] spawn BIS_fnc_MP;

[[2,format["%1",_message]],"DS_fnc_globalMessage"] spawn BIS_fnc_MP;

sleep 30;

miscInfoArray set[6,false];
publicVariable "miscInfoArray";