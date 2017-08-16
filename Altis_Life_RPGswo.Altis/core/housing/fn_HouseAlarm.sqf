/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
	
	MODIFIED:
	File: fn_HouseAlarm.sqf
	Author: Division Wolf e.V. - MarkusSR1984
	
	Description:
	Spielt den Alarm Sound auf dem Auto ab und benachrichtigt die Eigentümer des Fahrzeuges über den Aufbruchversuch
	
*/
private["_building"];
_building = param [0,ObjNull,[ObjNull]];
_alarmcounter = 15;

while {true} do
{
	if(!(_building getVariable "alarm_in_use")) exitWith {};
	if(isNull _building) exitWith {};
	if(_alarmcounter <= 0) exitWith {_building setVariable ["alarm_in_use",false,true]}; // Zur sicherheit falls der auslösende Spieler einen DC hat
	_alarmcounter = _alarmcounter -1; // Zur sicherheit falls der auslösende Spieler einen DC hat
	_building say3D "AlarmCar";
	sleep 2;
};