/*
		fn_schatzsuchestart.sqf
		Author: G00golplexian
		
		Description: Master file for treasure hunting...
*/

private["_schatzitemsdrugs","_schatzitemsfish","_schatzitemsores","_schatzitemsspecial","_schatzmoney","_ui","_progress","_pgText","_random","_random2","_ressource1","_ressource2","_ressource3","_ressource4"];
if(life_schatzsuche) exitWith {hint "Du hast vor kurzem erst eine Schatzsuche durchgeführt. Ein Stündchen Pause tut dir gut!"};

life_schatzsuche = true;

_random = round(random 7);
_random2 = round(random 7);

_schatzitemsfish = [
	"turtle",
	"salema",
	"ornate",
	"mackerel",
	"tuna",
	"mullet",
	"catshark",
	"perlen"
];
_schatzitemsdrugs = [
	"heroinp",
	"marijuana",
	"cocainep",
	"plastik"
];

_schatzitemsores = [
	"copper_r",
	"iron_r",
	"cement",
	"diamondc",
	"plutonium",
	"dublonen"
];

_schatzitemsspecial = [
	"laterne",
	"timemachine",
	"guthaben",
	"netz",
	"jagdmesser",
	"gpsTracker",
	"goldbar",
	"klappstuhl",
	"reichtum"
];

_schatzmoney = round(random 250000);

_sleep = 1;
_cP = 0.01;
_upp = "Schatzsuche gestartet...";

_handle = [_upp,_sleep,_cP,nil,nil] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_schatzsuche = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_schatzsuche = false;};
		
if(player distance boat1 > 25) exitWith {hint "Du bist außerhalb des Schiffswrack, Schatzsuche abgebrochen."; life_schatzsuche = false;};

_ressource1 = _schatzitemsdrugs select floor random count _schatzitemsdrugs;
_ressource2 = _schatzitemsfish select floor random count _schatzitemsfish;
_ressource3 = _schatzitemsores select floor random count _schatzitemsores;

if(_random == 4) then {
_ressource4 = _schatzitemsspecial select floor random count _schatzitemsspecial;
[true,_ressource4,round(random 3)] spawn life_fnc_handleinv;
};
if(_random2 == 2) then {
life_beatgeld = life_beatgeld + _schatzmoney;
};

[true,_ressource1,round(random 10)] spawn life_fnc_handleinv;
[true,_ressource2,round(random 10)] spawn life_fnc_handleinv;
[true,_ressource3,round(random 15)] spawn life_fnc_handleinv;

life_exp = life_exp + round(random(1000));
[] spawn life_fnc_exptolevel;

if(_random == 4 && _random2 == 2) exitWith {hint format ["Unglaublich! Deine Schatzsuche war mehr als erfolgreich. Du hast einen seltenen Fund gemacht und dazu %1€ gefunden! Schau im Rucksack nach!",([_schatzmoney] call life_fnc_numberText)]};
if(_random == 4) exitWith {
hint "Schatzsuche sehr erfolgreich! Du hast einen seltenen Fund gemacht. Schau im Rucksack nach!";
};
if(_random2 == 2) exitWith {
hint format ["Schatzsuche sehr erfolgreich. Du hast zusätzlich zu deinem Fund noch %1€ gefunden! Schau im Rucksack nach!",([_schatzmoney] call life_fnc_numberText)]
};
hint "Schatzsuche erfolgreich! Deinen Fund findest du im Rucksack!";

if(!erfolg_schatzsuche) then {erfolg_schatzsuche = true; ["erfolg_schatzsuche"] spawn life_fnc_erfolgerhalten; sleep 5;};

sleep (60 * 60);
life_schatzsuche = false;