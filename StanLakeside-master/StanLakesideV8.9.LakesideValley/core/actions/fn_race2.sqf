//go karts
private["_skiptotal","_markerstart","_startpos","_vehicle"];

if(life_is_arrested || (player getVariable ["restrained", false]) || (player getVariable ["tied", false])) exitwith {};

if( life_koil_race2 == 1 || life_koil_race == 1 || joinmode == 1 ) exitWith { ["Juz jestes w kolejce, prosze czekac.", false] spawn domsg; };

if(cash_in_hand < 50) exitWith {
["Potrzebujesz $50 aby sie scigac", false] spawn domsg;	
};


if(life_action_inUse) exitWith { };	
if((racemachine2 getVariable "racefull")) exitWith {
	hint "Ten wyscig jest pelen, sprobuj nastepny!";
};	

if((player getVariable ["tied", false])) exitWith { };		
if((player getVariable ["restrained", false])) exitWith { };


_skiptotal = 0;
if(!(racemachine2 getVariable "start")) then {
		[1,format["LAKESIDE GOKARTY: Za 5 minut wyscig rozpocznie sie na torze gokartowym!",player]] remoteExecCall ["life_fnc_broadcast", civilian];
	racemachine2 setVariable["start",true,true];
	racemachine2 setVariable["total",1,true];
	racemachine2 setVariable["racefull",false,true];
	_skiptotal = 1;
	[player] remoteExec ["TON_fnc_dorace2",2];
}; 

uiSleep 1;
koildeb2 = racemachine2 getvariable "total";
if(koildeb2 == 5) exitWith {
	["Wyscig jest pelen, sprobuj nastepnym razem!", false] spawn domsg;
};

if(_skiptotal == 0) then {
    koildeb2 = koildeb2 + 1;
    racemachine2 setVariable["total",koildeb2,true];
};

["cash","take",50] call life_fnc_handleCash;

_startpos = getpos player;
life_koil_race2 = 1;

_className = "A3L_Karts";

if(koildeb2 == 1) then {
	_markerstart = "start_race_1_1";
};
if(koildeb2 == 2) then {
	_markerstart = "start_race_2_1";
};
if(koildeb2 == 3) then {
	_markerstart = "start_race_3_1";
};
if(koildeb2 == 4) then {
	_markerstart = "start_race_4_1";
};
if(koildeb2 == 5) then {
	_markerstart = "start_race_5_1";
	racemachine2 setVariable["racefull",true,true];
};

_vehicle = createVehicle [_className, (getmarkerPos _markerstart), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle allowDamage false;
_vehicle lock 1;
_vehicle setVectorUp (surfaceNormal (getMarkerPos _markerstart));
_vehicle setDir (markerDir _markerstart);
_vehicle setPos (getmarkerPos _markerstart);
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle disableTIEquipment true; 
uiSleep 1;
if(isNull objectParent player && !deadPlayer) then {
	player action ["getInDriver", _vehicle];	
};

if(koildeb2 == 1) then {
	rrvehicle1 = _vehicle;
};
if(koildeb2 == 2) then {
	rrvehicle2 = _vehicle;
};
if(koildeb2 == 3) then {
	rrvehicle3 = _vehicle;
};
if(koildeb2 == 4) then {
	rrvehicle4 = _vehicle;
};
if(koildeb2 == 5) then {
	rrvehicle5 = _vehicle;
};

["Mozesz sie rozgrzewac przed wyscigiem. Zostaniesz teleportowany gdy bedzie sie rozpoczynal", false] spawn domsg;

while{ !(racemachine2 getVariable "racing") } do {


	if((player distance (getmarkerpos "stop_race_1_1")) > 150) then {
		_vehicle setVelocity [0, 0, 0];
		_vehicle setDir (markerDir _markerstart);
		_vehicle setPos (getmarkerPos _markerstart);
	};

uiSleep 0.3;
};

if(isNull objectParent player && !deadPlayer) then {
	player action ["getInDriver", _vehicle];	
};
_racecheck = 1;
_laps = 0;
_timer = 1;
_vehicle setVelocity [0, 0, 0];
_vehicle setDir (markerDir _markerstart);
_vehicle setPos (getmarkerPos _markerstart);
[player,"start"] spawn life_fnc_nearestSound;

_vehicle setdamage 0;
_vehicle allowdamage false;

hint "3";
_num = 1;
while{_num > 0} do {
	uiSleep 0.05;
	_vehicle setVelocity [0, 0, 0];
	_vehicle setDir (markerDir _markerstart);
	_vehicle setPos (getmarkerPos _markerstart);
	_num = _num - 0.05;
};
hint "2";
_num = 1;
while{_num > 0} do {
	uiSleep 0.05;
	_vehicle setVelocity [0, 0, 0];
	_vehicle setDir (markerDir _markerstart);
	_vehicle setPos (getmarkerPos _markerstart);
	_num = _num - 0.05;
};
hint "1";
_num = 1;
while{_num > 0} do {
	uiSleep 0.05;
	_vehicle setVelocity [0, 0, 0];
	_vehicle setDir (markerDir _markerstart);
	_vehicle setPos (getmarkerPos _markerstart);
	_num = _num - 0.05;
};
hint "GO!";
_laptimes = 0;
_fastestlap = 9999;
while { (racemachine2 getVariable "racing") } do {
	uiSleep 0.05;
	_laptimes = _laptimes + 0.05;

	if((player distance (getmarkerpos "race_check_1_1")) < 5 && _racecheck == 1) then {
		[format["Zaliczyles %1 punkt kontrolny",_racecheck], false] spawn domsg;
		[player,"endbeep"] spawn life_fnc_nearestSound;
		_racecheck = 2;
	};

	if((player distance (getmarkerpos "race_check_2_1")) < 5 && _racecheck == 2) then {
		[format["Zaliczyles %1 punkt kontrolny",_racecheck], false] spawn domsg;
		[player,"endbeep"] spawn life_fnc_nearestSound;
		_racecheck = 3;
	};

	if((player distance (getmarkerpos "race_check_3_1")) < 5 && _racecheck == 3) then {
		[format["Zaliczyles %1 punkt kontrolny",_racecheck], false] spawn domsg;
		[player,"endbeep"] spawn life_fnc_nearestSound;
		_racecheck = 4;
	};

	if((player distance (getmarkerpos "race_check_4_1")) < 5 && _racecheck == 4) then {
		_racecheck = 1;
		["Okrazenie zakonczone!", false] spawn domsg;
		[player,"endbeep"] spawn life_fnc_nearestSound;
		_laps = _laps + 1;
		if(_laptimes < _fastestlap) then {
			_fastestlap = _laptimes;
			[format["Nowe najszybsze okrazenie ustanowiono na %1",_fastestlap], false] spawn domsg;
		};
		_laptimes = 0;
	};


	if(_laps == 7) exitWith {
		if((racemachine2 getVariable "start")) then {
			[player] remoteExec ["TON_fnc_racefinish2",2];
			["cash","add",1000] call life_fnc_handleCash;
		};
	};
	if(isNull objectParent player && !deadPlayer) then {
		player allowdamage false;
		_vehicle setdamage 0;
		_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, (getPos _vehicle select 2)+0.2];
		uiSleep 3;
		["Twoje auto zostalo obrocone i naprawione - 3 sekundy kary!", false] spawn domsg;
		player action ["getInDriver", _vehicle];
		player allowdamage true;
	};

	if((player distance (getmarkerpos "stop_race_1_1")) > 150) then {
		_vehicle setVelocity [0, 0, 0];
		_vehicle setDir (markerDir _markerstart);
		_vehicle setPos (getmarkerPos _markerstart);
	};
};
uiSleep 1;


if((player distance (getmarkerpos "stop_race_1_1")) < 150 && !deadPlayer) then {

	_vehicle setVelocity [0, 0, 0];
	deleteVehicle _vehicle;
	player setpos _startpos;
	life_koil_race2 = 0;

	uiSleep 1;
	[0,format["Najlepsze okrazenie %1 wynioslo %2.",name player, _fastestlap]] remoteExecCall ["life_fnc_broadcast", -2];

	if(_laps > 3) then {
		["Wyscig skonczony - wygrales $150.", false] spawn domsg;
		["cash","add",150] call life_fnc_handleCash;
	} else {
		["Nic nie wygrales!", false] spawn domsg;
	};
};