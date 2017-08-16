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


private ["_tanke","_done","_fail","_tankstellen_Marker","_rnd","_distanceChosen","_distance","_marker","_upp","_ui","_progress","_pgText","_cP","_sleepdelay","_entf","_wer","_kaeufer"];
_tanke = param[0,objNull,[objNull]];

if((west countSide playableUnits) < 5) exitWith {hint "Du kannst diese Tankstelle nicht einnehmen, es sind nicht genügend Cops da!";};
IF(playerside != civilian) exitWith {hint "Du kannst diese Tankstelle nicht einnehmen!";};
if(_tanke getVariable ["Captured",false]) exitWith {hint "Diese Tankstelle wurde bereits von jemandem eingenommen!";};
if(_tanke getVariable ["Cooldown",false]) exitWith {hint "Diese Tankstelle kann noch nicht wieder eingenommen werden!";};
if(_tanke getVariable ["Kaeufer",""] == name player) exitWith {hint "Du willst deine eigene Tanke berauben?!";};


_tanke setVariable ["Captured",true,true];
_done = false;
_fail = false;
_tankstellen_Marker = [];
hint "Bleibe in einem Radius von 20 Metern um der Verkäufer solange die Tankstelle eingenommen wird!";




{
	_tankstellen_Marker pushBack format["GasMarker_%1",_x];

} foreach [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

_distanceChosen = 5000;
{
	_distance = _tanke distance (getmarkerpos(_x));
	if(_distance < _distanceChosen) then {
		_distanceChosen = _distance;
		_marker = _x;
	};

} foreach _tankstellen_Marker;
_tempTEMPTEMP = markerText _marker;


_marker setMarkerText format["Gas Station - Capturing in Progress - %1",name player];

["An Alle Beamten: \n Jemand ist dabei eine Tankstelle einzunehmen, kümmert euch drum!","lhm_fnc_hint",west,false] call lhm_fnc_mp;





_upp = "Nehme Tanke ein";
disableSerialization;
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "lhm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{

	sleep 1.6;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3  (%1%2)...",round(_cP * 100),"%",_upp];
	_entf = player distance _tanke;
	if(_entf > 20) exitWith {_fail = true;};
	if(_cP >= 1) exitWith {};
	if(player getVariable["restrained",false]) exitWith {"Du wurdest festgenommen, Einnehmen abgebrochen!";};
	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];
if(!alive player) exitWith {_tanke setVariable ["Captured",nil,true]; _marker setMarkerText _tempTEMPTEMP;};
if(_fail) exitWith {hint "Du hast dich zu weit von der Tankstelle entfernt";_tanke setVariable ["Captured",nil,true];_marker setMarkerText _tempTEMPTEMP;};
if(player getVariable["restrained",false]) exitWith {hint "Du wurdest festgenommen, Einnehmen abgebrochen!";_tanke setVariable ["Captured",nil,true];_marker setMarkerText _tempTEMPTEMP;};

_tanke setVariable["Captured",true,true];

[[getPlayerUID player,profileName,"599"],"lhm_fnc_wantedAdd",false,false] spawn lhm_fnc_mp;


_wer = _tanke getVariable["Kaeufer",""];
_kaeufer = objNull;
{
	if(name _x == _wer) then {
		_kaeufer = _x;
	};
} foreach playableUnits;


if(!isnull _kaeufer) then {
	["Jemand hat eine deiner Tankstellen eingenommen!","lhm_fnc_hint",[_kaeufer]] call lhm_fnc_mp;

};

_marker setMarkerType "hd_warning";
_marker setmarkerText format["Gas Station - Captured - %1",name player];

hint "Du hast diese Tankstelle eingenommen, du bekommst nun alle Tankeinnahmen solange diese Tankstelle dir gehört auf dein Konto (alle 5 Minuten), du kannst dich jetzt auch entfernen!";

["An Alle Beamten: \n Jemand hat eine Tankstelle eingenommen, kümmert euch drum!","lhm_fnc_hint",WEST] call lhm_fnc_mp;

LHM_gastations_captured pushback _tanke;
if(!LHM_money_circle_illegal) then {
	[] spawn lhm_fnc_LHM_stations_station_robbery;
};










