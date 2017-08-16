/*
Datei: fn_geocatch.sqf
Author: Barney

WRITTEN FOR LOEWENHERZ

Description:
Geocatching Item!


You're not allowed to modify this file!
Licensed under the Arma EULA and Arma Tools EULA.
Modified for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
 Ask us for permission to use this file www.lhzp.de
*/

Private ["_pos","_time","_markername","_markerpos","_math","_xpos","_ypos","_treasure","_schatz","_rounds"];

closeDialog 0;
sleep 0.1; 

"Loewenherz Geocatching!" hintC [format["Moin Ruediger, aehh %1. Willkommen beim Geocatching",name player],"Der Schatz kann mehrere Kilometer weg sein, oder ganz in deiner Naehe. Alles ist moeglich, wichtig ist, dass du schnell bist, denn das Objekt der Begierde wird nicht ewig an seiner Stelle liegen.","Solltest du es aber schaffen den Schatz zu finden, so erwarten dich dort Ueberraschungen, evtl. Geld, seltene Items oder andere Dinge, wer weiß!","Viel Spaß beim Catchen wuenscht dir das Loewenherz Team"];
sleep 10;


_pos = getPos(player);
_time = 0;  //Zeit für Countdown
_markername = format["geo%1",floor(random(5000))];  //markername
_target =  createMarkerLocal[_markername,[0,0]]; 
_target setMarkerColorLocal "ColorBlack"; 
_target setMarkerTypeLocal "hd_destroy";



_markerpos = [_pos, 100, 4000, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_markername setMarkerPosLocal _markerpos; 



sleep 1;
hint format["Begebe dich zum schwarzen Kreuz auf der Karte %1 um zum Ziel zu gelangen. Du hast 10 Minuten Zeit",name player];

while {player distance _markerpos > 30 }do
	{
		_time = _time + 1;
		if(_time > 600) exitWith {hint "Du warst zu langsam, jemand anders hat den Schatz"; deleteMarkerLocal _markername;};
		sleep 1;
	};
waitUntil{player distance _markerpos <= 30};
_time = 0;
sleep 3;
hint format["Sehr gut %1 du hast es fast geschafft, begebe dich nun zu nächsten schwarzen X auf der Karte um den Schatz zu finden",name player];


////////////////////////////////     erste Etappe geschafft   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



_time = 0;  //Zeit für Countdown


_markerpos = [_pos, 100, 4000, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_markername setMarkerPosLocal _markerpos;

sleep 5;

_treasure = "Land_Sack_F" createVehicle [_markerpos select 0, _markerpos select 1,1];
_treasure allowDamage false;
_treasure enableSimulation false;
_schatz = floor(random(100));


switch(true) do {
	case (_schatz == 99): { _treasure addaction ["Get Treasue", {_treasure = _this select 0;[true,"egg",1] call lhm_fnc_handleInv; deleteVehicle _treasure; hint "Was hast du denn da gefunden?";}]};
	case (_schatz == 98): { _treasure addaction ["Get Treasue", {_treasure = _this select 0;[true,"goldbar",1] call lhm_fnc_handleInv; deleteVehicle _treasure; hint "Du hast einen Goldbarren gefunden, Glückwunsch";}]};
	case (_schatz <= 97): { _treasure addaction ["Get Treasue", {_treasure = _this select 0;lhm_cash = lhm_cash + 30000; deleteVehicle _treasure; hint "Du hast 30.000$ gefunden, Glückwunsch";}]};
};


while {player distance _treasure >10 }do
{
_time = _time + 1;
if(_time > 600) exitWith {hint "Du warst zu langsam, jemand anders hat den Schatz"; deleteMarkerLocal _markername;deleteVehicle _treasure;};
sleep 1;
};
 hint format["Sehr gut %1 du hast den Schatz gefunden! Viel Spaß damit",name player];
 deleteMarkerLocal _markername;
 















