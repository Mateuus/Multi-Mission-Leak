/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	N/A
*/

if((independent countside playableUnits) == 0) exitWith {titleText ["Kein AHW-Mitarbeiter im Dienst!","PLAIN DOWN"]};

//[life_corpse,profileName,player] remoteExecCall ["life_fnc_medicRequest",independent];

_Village = (text (nearestLocations [(getpos life_corpse),["NameVillage","NameCity","NameCityCapital"],5000]select 0));

_id = round(random 100000);

[2,[_id,"Todesfall",player,_Village,[1] call life_fnc_gettime,"Niemand",getpos life_corpse]] remoteExecCall ["SOA_fnc_ahw",2];
[life_corpse,profileName,nil,"notdienst",_id] remoteExec ["life_fnc_ahwEinsatz",independent];

titleText ["Das AHW wurde verständigt. Wir senden Ihnen einen Notarzt zu, bitte gedulden Sie sich.","PLAIN DOWN"];

[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (8 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};