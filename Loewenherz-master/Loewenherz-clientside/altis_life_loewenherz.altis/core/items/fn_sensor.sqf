/* 
Skript: fn_sensor.sqf

Written for Loewenherz. Usage of this file is resticted to permitted server e.g. Loewenherz
Ask us for permission to use this file www.lhzp.de

Author: Barney
*/

Private["_markername","_sensor","_marker","_objects","_menge","_activ","_alive","_count","_corr"];
if (vehicle player != player) exitWith{hint format["Das geht nicht im Auto %1", name player];};
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";

_activ = 0;
_count = 0;
_corr = [];
_markername = format["Sensoer%1", floor(random(5000))];
_sensor = "Land_HandyCam_F" createVehicle getPos player;
_marker = createMarkerLocal [_markername , getPos _sensor];
_marker setMarkerTypeLocal "b_art"; 

for "_i" from 1 to 360 do {
	if(!alive _sensor) exitWith {Hint "Bewegungsmelder wurde zerstört";};
	_count = 0;
	_corr = [];
	_objects = nearestObjects[getpos(_sensor),["MAN"],20];
	{ if(!alive _x) then{_corr = _corr + [(_objects select _count)]};  _count = _count +1;} forEach _objects;
	_objects = _objects - _corr;
	_menge = count(_objects);
	
	
if((count(_objects - allPlayers) != _menge) or (count(nearestObjects[getpos(_sensor),["CAR","Air","Tank"],20])) >0) then
		{	
			_marker setMarkerTypeLocal "o_art";
			if(_activ == 1) then {} else {_activ = 1; titleText ["Achtung: Ein Bewegungsmelder meldet Aktivität!", "PLAIN DOWN"];};
			
		} else
		{
			_marker setMarkerTypeLocal "b_art";
			_activ = 0;
		};
	sleep 30;
};
 
deleteVehicle _sensor ;
deleteMarkerLocal _markername;