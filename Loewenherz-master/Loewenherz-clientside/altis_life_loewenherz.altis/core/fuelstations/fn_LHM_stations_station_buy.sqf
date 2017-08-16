/*
	File: fn_station_capture.sqf
	Author: Barney

	Description:



	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/



//"Land_fs_feed_F"
//"Land_fs_feed_F"


private ["_npc","_tankstellen_Marker","_sleepdelay","_action","_distanceChosen","_distance","_marker"];
_npc = param[0,ObjNull,[ObjNull]];
_tankstellen_Marker = [];
_sleepdelay = [1,3] call BIS_fnc_randomNum;
 sleep _sleepdelay;
if(_npc getVariable["gekauft",false]) exitWith {hint "Diese Tankstelle gehört bereits jemandem!";};
_npc setVariable["gekauft",true,true];
_npc setVariable["kaeufer",name player,true];


_action = [
	"Wollen Sie diese Tankstelle wirklich für 10.000$ kaufen? <br/> <br/>Sie erhalten dann, solange Sie online sind, alle 15 Minuten die gesamten Einnahmen der Tankstelle.<br/> Weiterhin können sie den Benzin-Peis selbst bestimmen",
	"LOEWENHERZ Tankstelle",
	"Ja",
	"Ne"
] call BIS_fnc_guiMessage;


if(!_action) exitWith {_npc setVariable["gekauft",nil,true];_npc setVariable["kaeufer",nil,true];};
if((lhm_atmcash - 10000 < 0 )) exitWith {hint "Du hast nicht genügend Geld auf deinem Konto um diese Tankstelle zu kaufen!";_npc setVariable["gekauft",nil,true];_npc setVariable["kaeufer",nil,true];};
lhm_atmcash = lhm_atmcash - 10000;

hint "Diese Tankstelle gehört nun dir, sofern diese Tankstelle einen Gewinn abwirft bekommst du diesen alle 15 Minuten auf dein Konto gezahlt!";


{
	_tankstellen_Marker pushBack format["GasMarker_%1",_x];

} foreach [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

_distanceChosen = 5000;
{
	_distance = _npc distance (getmarkerpos(_x));
	if(_distance < _distanceChosen) then {
		_distanceChosen = _distance;
		_marker = _x;
	};

} foreach _tankstellen_Marker;

_marker setMarkerText format["Gas Station - Preis: 8 $ - Owner: %1",name player];

LHM_gastations_owned pushback _npc;
profileNamespace setVariable["LHM_gastations_owned",LHM_gastations_owned];

_npc setVariable["Geldwert",0,true];

if(!LHM_money_circle_legal) then {
	[] spawn lhm_fnc_LHM_stations_getMoney;
};



















