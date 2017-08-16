#include "..\..\macros.hpp"
/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
	
	MODIFIED:
	File: fn_carAlarm.sqf
	Author: MarkusSR1984
	
	Description:
	Spielt den Alarm Sound auf dem Auto ab und benachrichtigt die Eigentümer des Fahrzeuges über den Aufbruchversuch
	
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];
_alarmcounter = 120;


if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "alarm_in_use"}) exitWith {};


				{
					if ((_x select 0) == getPlayerUID player) then 
					{
						hint "ACHTUNG\n\nJemand versucht dein Fahrzeug aufzubrechen!\n\nACHTUNG";
					};
				} count (_vehicle getVariable["vehicle_info_owners",[]]);

				
while {true} do
{
	if(!(_vehicle getVariable "alarm_in_use")) exitWith {};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	if(_alarmcounter <= 0) exitWith {_vehicle setVariable ["alarm_in_use",false,true]}; // Zur sicherheit falls der auslösende Spieler einen DC hat
	_alarmcounter = _alarmcounter -1; // Zur sicherheit falls der auslösende Spieler einen DC hat
	_vehicle say3D "AlarmCar";
	sleep 2;
};