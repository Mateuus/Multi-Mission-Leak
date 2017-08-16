private["_gemaelde","_gemaeldetype","_exit","_handle"];
disableSerialization;

_gemaelde = _this select 0;
_gemaeldetype = _gemaelde getVariable ["gemaeldeType","ERROR"];
_exit = false;

if((life_kunstraubActive select 0) && (life_kunstraubActive select 1) != player) exitWith {hint format["Der Kunstraub kann nur noch von %1 vollzogen werden!",name (life_kunstraubActive select 1)]};
if(_gemaeldetype == "ERROR") exitWith {hint "Ein Fehler ist aufgetreten!"};
if(isNull _gemaelde) exitWith {};
if!([player] call life_fnc_inBuilding) exitWith {hint "Du befindest dich nicht innerhalb der Galerie!"};
if(life_inv_longbox == 0) exitWith {hint "Du benötigst ein Kunstbehältnis pro Gemälde!"};
if(player distance _gemaelde > 5) exitWith {hint "Du bist außerhalb der Reichweite des Gemäldes!"};
if(count life_gemaelde >= 5) then {hint "Du hättest nun die benötigte Anzahl an Gemälden um diese, jetzt wird es riskant und spannend!"};
if((west countside playableUnits) < 4) exitWith {hint "Es müssen mindestens 4 Polizisten aktiv sein!"};

life_kunstraubActive = [true,player];
PublicVariable "life_kunstraubActive";

[2,">> In die Kunstgalerie wird eingebrochen! <<"] remoteExecCall ["life_fnc_broadcast",west];

_sleep = 2;
_cP = 0.01;
_upp = format["%1 klauen...",_gemaeldetype];

_handle = [_upp,_sleep,_cP,nil,(_this select 0),4] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
if(life_process_bad) exitWith {life_kunstraubActive = [false,ObjNull]; publicVariable "life_kunstraubActive"; life_process_bad = false};

[false,"longbox",1] call life_fnc_handleinv;
deletevehicle _gemaelde;
life_gemaelde pushback _gemaeldetype;
titleText [format["%1/min. 5 Gemälden geklaut...",(count life_gemaelde)],"PLAIN DOWN"];

if(license_civ_rebel) then {life_exp = life_exp + round(random(1000));} else {life_exp = life_exp - round(random(1000));};
[] spawn life_fnc_exptolevel;