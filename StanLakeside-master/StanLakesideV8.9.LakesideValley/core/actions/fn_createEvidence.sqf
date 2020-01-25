/*
File: create evidence
*/
private["_curTarget","_suspect","_victim","_crime"];

_chance = 351;
if(headgear _suspect IN HatList || goggles _suspect IN GoggleList) then {
	_chance = round (random 1000);
};

if(_chance < 350) exitwith {
	["Dzieki masce nie upuscili dowodow!",false] spawn domsg;
};
_chance = 2;
_luck = 1;
if(life_karma < 0) then {
	_rand = 0;
	_luck = 1;
	while{_rand > life_karma} do {
		_luck = _luck + 1;
		_rand = _rand -1000;
	};
	if(_luck > 8) then {
		_luck = 8;
	};
	_chance = round (random 10);
};

if(_chance < _luck) exitwith {
	["Ich umiejetnosci w rabowaniu sprawily ze nie upuscili dowodow!",false] spawn domsg;
};


_suspect = param [0,ObjNull,[ObjNull]];
_victim = param [1,ObjNull,[ObjNull]];
_crime = param [2];
_vehicle = createVehicle ["Land_Suitcase_F", (player), [], 0, "NONE"];

if(_crime == "187") then {
	_vehicle setVariable ["evidence", [_suspect, _victim, "187"], true];
};
if(_crime == "211") then {
	_vehicle setVariable ["evidence", [_suspect, _victim, "211"], true];
};
if(_crime == "487") then {
	_vehicle setVariable ["evidence", [_suspect, _victim, "487"], true];
};
if(_crime == "334") then {
	_vehicle setVariable ["evidence", [_suspect, _victim, "334"], true];
};
_vehicle enablesimulation false;
_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, (getPos _vehicle select 2) + 0.5];

_obj = "Land_ClutterCutter_small_F" createVehicle (getPos _vehicle);
_obj setPos (getPos _vehicle);
_vehicle attachTo [_obj,[0,0,0]];


uiSleep 1200;
deletevehicle _obj;
deletevehicle _vehicle;