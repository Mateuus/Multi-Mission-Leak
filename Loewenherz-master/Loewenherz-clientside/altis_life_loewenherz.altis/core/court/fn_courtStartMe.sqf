/*
	File: fn_startCourtMe.sqf
	Author: Barney

	Description:
	Initialiazes the court


	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
Private["_action","_verurteilter","_time","_menge","_countdown","_personenMessage","_geschworene","_geschworeneNamen","_geschworener","_namen","_text","_time1","_chair","_handle","_time2","_vote","_unschuldig","_schuldig","_votes","_limit","_mind","_unschuldig","_schuldig","_diff","_limitasked","_save","_stat","_temp","_msgNo","_save"];

player setpos (getmarkerpos "jail_marker");

//knast Satus setzen
LHM_Gericht = true;


lhm_canpay_bail = false;
lhm_bail_amount = 5000;
lhm_bail_paid = false;
lhm_is_arrested = 1;
[5] call SOCK_fnc_updatePartial;
//---------------------------------------


player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
Gericht_1 setVariable["Gericht_Entschieden",false,true];


_handle = [] spawn lhm_fnc_saveGear;
	waitUntil{ScriptDone _handle};

	// remove everything
	_handle = [] spawn lhm_fnc_stripDownPlayer;
	waitUntil {scriptDone _handle};

{missionNamespace setVariable[_x,0];} foreach lhm_inv_items;

lhm_thirst = 100;
lhm_hunger = 100;

player forceaddUniform "U_NikosAgedBody";

closedialog 0;
sleep 1;

"Loewenherz - Gericht" hintC[format["Hallo %1, es wurde ein Gericht einberufen um deinen Fall aufzuklären.", name player],
"Aktuell werden auf der Insel Geschworene gesucht um an dem Prozess teilzunehmen",
"Sollten sich nicht genügend Freiwillige melden wird das Gericht nicht tagen und sie werden ersatzweise eine Haftstrafe antreten müssen",
"Viel Glück"];


_personenMessage = param [0,[],[[]]];
_menge = count(_personenMessage);
_verurteilter = netid player;
_chair = Stuhl_angeklagter;
_limit = LHM_Geschworene_LIMIT;
_limitasked = LHM_Geschworene_ASKED;
_mind = LHM_Geschworene_MIND;
_time = 60;
_time1 = 40;
_time2 = 300;
_geschworeneNamen = [];
_namen = [];
_geschworeneport = [];
_text = "";
_msgNo = [];
_namenTemp = "";
_vote = Gericht_1 getVariable["vote",[]];
_schuldig = count(_vote - ["unschuldig"]);
_unschuldig = count(_vote - ["schuldig"]);



if(_menge > _limitasked) then {
	_diff = _menge - _limitasked;

		for "_l" from 0 to (_diff - 1) do {
			_personenMessage deleteat floor(random(_menge));
			_menge = count(_personenMessage);
		};
};


[[_verurteilter],"lhm_fnc_courtask",_personenMessage,false] call lhm_fnc_mp;


//----------------------Anfrage an Geschworene raus - Warten und Auswertung------------------------------------------------------

sleep 1;

while{_time >= 0} do {
	_countdown = [_time,"MM:SS"] call BIS_fnc_secondsToString;
	_geschworene = count(Gericht_1 getVariable["geschworene",[]]);
	hintsilent format["Verbleibende Zeit: \n %1 \n \n Gefundene Geschworene: \n %2 \n\n Sollten nicht mindestens %3 Geschworene gefunden werden, wird das Gericht nicht zusammenkommen!",_countdown,_geschworene,_mind];
	sleep 1;
	_time = _time -1;

};

if(_geschworene < _mind) exitWith {hintsilent "Es haben sich nicht genügend Geschworene finden lassen";
	lhm_is_arrested = 0;
	lhm_bail_paid = false;
	serv_wanted_remove = [player];
	[[getPlayerUID player],"lhm_fnc_wantedRemove",false,false] call lhm_fnc_mp;
	[5] call SOCK_fnc_updatePartial;

	LHM_Gericht = false;[("Das Gericht wurde leider aufgrund zu geringer Beteiligung abgesagt"),"lhm_fnc_hint",_personenMessage,FALSE] call lhm_fnc_mp;
	Gericht_1 setVariable["Gericht_Status",false,true];
	sleep 5;
	[player] spawn lhm_fnc_jail;
};



//----------------------------------------GERICHT BEGINNT---------------------------------------------------------------
//PORT PLAYER to COURRT
cutText["","BLACK FADED"];
player playaction "Civil";
waitUntil{animationState player == "amovpercmstpsnonwnondnon"};
[[player, "Crew"], "lhm_fnc_animSync"] call lhm_fnc_mp;
 player setPos (getPos _chair);
 player setDir ((getDir _chair) - 180);
 player setpos [getpos player select 0, getpos player select 1,((getpos player select 2) +1)];
_chair enableSimulation false;
player allowdamage false;

sleep 3;

 player setPos (getPos _chair);
 player setDir ((getDir _chair) - 180);
 player setpos [getpos player select 0, getpos player select 1,((getpos player select 2) +1)];
0 cutFadeOut 1;
//////////////////////////////////PLayer auf Stuhl halten/////////////////////////////////////////////////////////////////


[_chair] spawn {
	_stuhl = _this select 0;
		While {LHM_gericht} do {
			if(!alive player) exitWith{Gericht_1 setVariable["Gericht_Status",false,true];};
			if(animationstate player != "Crew") then {
				[[player, "Crew"], "lhm_fnc_animSync"] call lhm_fnc_mp;
				player setPos (getPos _stuhl);
				player setDir ((getDir _stuhl) - 180);
				player setpos [getpos player select 0, getpos player select 1,((getpos player select 2) +1)];
			};
		sleep 3;
		};

	};


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_geschworene = count(Gericht_1 getVariable["geschworene",[]]);
_save = Gericht_1 getVariable["geschworene",[]];   // weiß nicht wieso aber für iwas wollte ich das benutzen .......
_stat = Gericht_1 getVariable["geschworene",[]];

if(_geschworene > _limit) then {
	_diff = _geschworene - _limit;
	_stat = Gericht_1 getVariable["geschworene",[]];

	for "_l" from 0 to (_diff - 1) do {
			_rnd = floor(random(count(_stat)));
			_temp = (_stat select _rnd) select 1;
			_msgNo pushback (objectfromnetid _temp);
			_stat deleteAt _rnd;

	};

	[[_verurteilter,"no"],"lhm_fnc_courtPort",_msgNo,false] call lhm_fnc_mp;
	Gericht_1 setVariable["geschworene",_stat,true];  // damit die Geschworenen nachher korrekt ihrem Stuhl zugeordnet werden

};


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if(!alive player) exitWith{Gericht_1 setVariable["Gericht_Status",false,true];};

_geschworene = count(_stat);
for "_g" from 0 to (_geschworene - 1) do {

_geschworener = (_stat select _g) select 1;

if(alive (objectfromnetid _geschworener)) then {
	_geschworeneport pushback objectfromnetid _geschworener;
	_namenTemp = (_stat select _g) select 0;
	_namen pushback _namenTemp;
	};

	};




{_text = _text + format["%1 \n",_x];} foreach _namen;
_ganzerText = format["- Das Gericht tagt aktuell - \n\n Angeklagter: \n %1\n \n Geschworene:\n",name player] + _text;

[(_ganzerText),"lhm_fnc_hint",true,FALSE] call lhm_fnc_mp;


[[_verurteilter],"lhm_fnc_courtPort",_geschworeneport,false] call lhm_fnc_mp;





_countdown = [_time1,"MM:SS"] call BIS_fnc_secondsToString;

while{_time1 >= 0} do {
_countdown = [_time1,"MM:SS"] call BIS_fnc_secondsToString;
hintsilent format["Verbleibende Zeit bis die ersten Geschworenen erscheinen: \n %1 ",_countdown];
sleep 1;
_time1 = _time1 -1;

};
[[player, "Crew"], "lhm_fnc_animSync"] call lhm_fnc_mp;


while{_time2 >= 0} do {
_vote = Gericht_1 getVariable["vote",[]];
_schuldig = count(_vote - ["unschuldig"]);
_unschuldig = count(_vote - ["schuldig"]);
_countdown = [_time2,"MM:SS"] call BIS_fnc_secondsToString;

sleep 1;
_time2 = _time2 -1;


if(_time2 <= 60) then {
hintsilent format["Verbleibende Zeit bis Urteil: \n %1 \n \n  SCHULDIG: \n %2  \n UNSCHULDIG: \n %3",_countdown,_schuldig,_unschuldig];
} else {
hintsilent format["Verbleibende Zeit bis Urteil: \n %1 ",_countdown];
};


};



//           AUSWERTUNG
_vote = Gericht_1 getVariable["vote",[]];
_schuldig = count(_vote - ["unschuldig"]);
_unschuldig = count(_vote - ["schuldig"]);
_geschworene = count(Gericht_1 getVariable["geschworene",[]]);
_votes = count(Gericht_1 getVariable["vote",[]]);
Gericht_1 setVariable["Gericht_Entschieden",true,true];

player allowdamage true;
player switchMove "";
LHM_Gericht = false;

if(_unschuldig > _schuldig) then {

	cutText["","BLACK FADED"];

	LHM_Gericht = false;
	sleep 6.5;

	player allowdamage true;
	player switchMove "";

	_handle = [] spawn lhm_fnc_stripDownPlayer;
	waitUntil {scriptDone _handle};

	// add old stuff
	_handle = [] spawn lhm_fnc_loadGear;
	waitUntil{ScriptDone _handle};

	sleep floor(random(4));
	_ganzerText = format["- Das Gericht hat entschieden - \n\n Im Namen des Volkes ergeht folgendes Urteil für %1: \n \n Unschuldig \n \n Danke an die Geschworenen:\n",name player] + _text;
	[(_ganzerText),"lhm_fnc_hint",true,FALSE] call lhm_fnc_mp;
	if(_geschworene != 0) then {Gericht_1 setVariable["geschworene",[],true];};
	if(_votes != 0) then {Gericht_1 setVariable["vote",[],true];};
	if(Gericht_1 getVariable "Gericht_Status") then {Gericht_1 setVariable["Gericht_Status",false,true];};

	lhm_is_arrested = 0;
	lhm_bail_paid = false;
	serv_wanted_remove = [player];
	[[getPlayerUID player],"lhm_fnc_wantedRemove",false,false] call lhm_fnc_mp;
	[5] call SOCK_fnc_updatePartial;

	player setPosatl [2323.58,22265.4,0.00179291];
	sleep 1;
	0 cutFadeOut 1;
	[] call lhm_fnc_spawnMenu;
	sleep 1;
	if(!dialog) then {[] call lhm_fnc_spawnMenu;};
} else {
	cutText["","BLACK FADED"];
	_ganzerText = format["- Das Gericht hat entschieden - \n\n Im Namen des Volkes ergeht folgendes Urteil für %1: \n \n Schuldig \n \n Danke an die Geschworenen:\n",name player] + _text;
	[(_ganzerText),"lhm_fnc_hint",true,FALSE] call lhm_fnc_mp;


	lhm_is_arrested = 0;
	lhm_bail_paid = false;
	serv_wanted_remove = [player];
	[[getPlayerUID player],"lhm_fnc_wantedRemove",false,false] call lhm_fnc_mp;
	[5] call SOCK_fnc_updatePartial;

	LHM_Gericht = false;
	sleep 6.5;

	player allowdamage true;
	player switchMove "";

	if(_geschworene != 0) then {Gericht_1 setVariable["geschworene",[],true];};
	if(_votes != 0) then {Gericht_1 setVariable["vote",[],true];};
	if(Gericht_1 getVariable "Gericht_Status") then {Gericht_1 setVariable["Gericht_Status",false,true];};
	sleep 2;
	0 cutFadeOut 1;
	[player] spawn lhm_fnc_jail;
};



