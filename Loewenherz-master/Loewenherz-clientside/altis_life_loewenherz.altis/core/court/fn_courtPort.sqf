/*
	File: fn_courtPort.sqf
	Author: Barney

	Description:
	Ports Player into Court



	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
Private["_chair","_verurteilter","_geschworene","_number","_failed","_time","_handle","_votes","_height","_action","_pos","_gericht","_pos1","_pos1","_hint","_hint_normal","_hint_vote","_vote","_position","_no","_inv"];

sleep 1;
if(!alive player) exitWith{};
if(lhm_is_arrested == 1 || lhm_is_arrested == 2) exitWith {};
LHM_Gericht = true;
_verurteilter = objectfromnetid (_this select 0);
_failed = false;
_time = 40;
_time1 = 300;
_pos = getposatl player;
_geschworene = Gericht_1 getVariable["geschworene",[]];
_vote = Gericht_1 getVariable["vote",[]];
_schuldig = count(_vote - ["unschuldig"]);
_unschuldig = count(_vote - ["schuldig"]);
_no = param [1,"",[""]];

if(_no == "no") exitWith {Hint "Leider wurden Sie nicht als Geschworener ausgesucht"};

if(count(_geschworene) < LHM_Geschworene_MIND) exitWith {hintsilent "Something went WRONG!";};
if(!alive player) exitWith{};
_number = _geschworene find [name player,netid player];

if(_number == -1) exitWITH {};  //FUCK!!

switch(_number) do {
case 0 : { _position = [9010.32,21380,0.996414];};
case 1 : { _position = [9010.86,21379.5,0.994364];};
case 2 : { _position = [9011.52,21378.9,0.992128];};
case 3 : { _position = [9011.93,21378.1,0.98868];};
case 4 : { _position = [9012.42,21377.5,0.986029];};
case 5 : { _position = [9012.87,21376.7,0.982368];};
case 6 : {_position =  [9013.14,21375.8,0.978237];};
case 7 : { _position = [9014.67,21377,2.06401];};
case 8 : { _position = [9014.33,21378,2.06797];};
case 9 : {_position = [9013.84,21378.8,2.07126];};
case 10 : { _position = [9013.25,21379.6,2.07429];};
case 11 : {_position =  [9012.6,21380.4,2.07764];};
case 12 : {_position = [9011.83,21381,2.08001];};
default {_failed = true;};
};

if(_failed) exitWith {hintsilent "No chair for u"};
if(player getVariable["restrained",false]) exitWith {};

while{_time >= 0} do {
_countdown = [_time,"MM:SS"] call BIS_fnc_secondsToString;

hintsilent format["Das Gericht beginnt, Sie werden nun in das Gericht gebracht!! \n \n Verbleibende Zeit: \n %1 \n\n Angeklagter \n %2",_countdown, name _verurteilter];
sleep 1;
_time = _time -1;

};
closeDialog 0;
if(!alive _verurteilter) exitWITH {hintsilent "Der Verurteile ist verschwunden, das Gericht wurde abgesagt!"};
if(player getVariable["restrained",false]) exitWith {};
LHM_LOCAL_WANTED_LIST = [];

if(!alive player) exitWith{};


///////////P-P-P-P-POOOOORRRRTTTTTT////////////////////

cutText["","BLACK FADED"];

player setposatl[2323.58,22265.4,0.00179291];
sleep 0.2;

if(!alive player) exitWith{};
///save Gear
_handle = [] spawn lhm_fnc_saveGear;
	waitUntil{ScriptDone _handle};

	// remove everything
	_handle = [] spawn lhm_fnc_stripDownPlayer;
	waitUntil {scriptDone _handle};


{missionNamespace setVariable[_x,0];} foreach lhm_inv_items;
_inv = lhm_carryweight;
lhm_carryweight = 0;
player playaction "Civil";
waitUntil{animationState player == "amovpercmstpsnonwnondnon"};

player setVelocity [0,0,0];
player setposatl _position;
player allowdamage false;


player forceaddUniform "U_NikosAgedBody";

sleep 2;

player setposatl _position;





[_position] spawn {
	Private["_posloop"];
	_posloop = _this select 0;
	While{LHM_Gericht} do {
		if(!alive player) exitWith{};
		if((getposatl player distance _posloop) > 0.1) then {
		player setposatl _posloop
		};
	sleep 1;

};

};



0 cutFadeOut 1;
/////Player Ported and sitting///////////////////////////////


if(!alive player) exitWith{};


[[player,_verurteilter],"lhm_fnc_courtFetch",false,false] call lhm_fnc_mp;


while{_time1 >= 0} do {
_countdown = [_time1,"MM:SS"] call BIS_fnc_secondsToString;


_vote = Gericht_1 getVariable["vote",[]];
_schuldig = count(_vote - ["unschuldig"]);
_unschuldig = count(_vote - ["schuldig"]);

if(Gericht_1 getVariable["Gericht_Entschieden",false]) exitWIth {};

if(_time1 <= 60) then {
hintsilent format["Verbleibende Zeit bis Urteil: \n %1 \n \n  SCHULDIG: \n %2  \n UNSCHULDIG: \n %3",_countdown,_schuldig,_unschuldig];
} else {
hintsilent format["Verbleibende Zeit bis Urteil: \n %1 ",_countdown];
};


sleep 1;
_time1 = _time1 -1;
if (_time1 == 60) then {[] spawn lhm_fnc_courtDecide;};
};





if(!alive player) exitWith{};



cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
LHM_gericht = false;
sleep 2;
// force remove stuff
	_handle = [] spawn lhm_fnc_stripDownPlayer;
	waitUntil {scriptDone _handle};

	// add old stuff
	_handle = [] spawn lhm_fnc_loadGear;
	waitUntil{ScriptDone _handle};

player setposatl[2323.58,22265.4,0.00179291];

closeDialog 0;

_action = [
	"Möchten Sie zu ihrer alten Position zurück oder möchten Sie auswählen?",
	"LOEWENHERZ GERICHT",
	"Alte Position",
	"Neu Wählen"
] call BIS_fnc_guiMessage;
lhm_carryweight = _inv;

waituntil{ str _action == "true" or  str _action == "false"};
if(!alive player) exitWith{};
if(_action)	then
{


	player allowdamage true;

	player setposatl _pos;
	if(_pos distance (getposatl player) > 5)then {player setposatl _pos};
	sleep floor(random(4));

	_votes = count(Gericht_1 getVariable["vote",[]]);
	_geschworene = count(Gericht_1 getVariable["geschworene",[]]);
	if(_geschworene != 0) then {Gericht_1 setVariable["geschworene",[],true];};
	if(_votes != 0) then {Gericht_1 setVariable["vote",[],true];};
	if(Gericht_1 getVariable "Gericht_Status") then {Gericht_1 setVariable["Gericht_Status",false,true];};
	0 cutFadeOut 1;
}else {

	player allowdamage true;
	sleep floor(random(4));
	_votes = count(Gericht_1 getVariable["vote",[]]);
	_geschworene = count(Gericht_1 getVariable["geschworene",[]]);
	if(_geschworene != 0) then {Gericht_1 setVariable["geschworene",[],true];};
	if(_votes != 0) then {Gericht_1 setVariable["vote",[],true];};
	if(Gericht_1 getVariable "Gericht_Status") then {Gericht_1 setVariable["Gericht_Status",false,true];};
	0 cutFadeOut 1;
	[] call lhm_fnc_spawnMenu;
	sleep 1;
	if(!dialog) then {[] call lhm_fnc_spawnMenu;};
};



