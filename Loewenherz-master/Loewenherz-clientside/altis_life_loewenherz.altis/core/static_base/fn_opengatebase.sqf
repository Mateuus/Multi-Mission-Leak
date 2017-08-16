


private ["_tor1","_fail","_tore","_count","_tor2","_objs","_attachRight","_pforteR","_attachLeft","_pforteL"];



_fail = false;
_tore = nearestObjects[getpos player,["Land_CncWall4_F"],40];

if(count(_tore) < 2) exitWith {hint "Du musst näher an das Tor heran"};

_tor1 = _tore select 0;

_tor2 = _tore select 1;
if(_tor1 getVariable["moving",false]) exitWith {hint "Das Tor bewegt sich aktuell!"};

_tor1 setVariable["moving",true,true];
_tor2 setVariable["moving",true,true];

_objs = nearestObjects [_tor1 modelToWorld [5,0,0], ["Land_Canal_Wall_Stairs_F"], 5];



if(!(_tor1 getvariable["open",false])) then {
		if(count (_objs) > 0) then {
			_attachRight = _objs select 0;
			_pforteR = _tor1;



		} else {

			_objs = nearestObjects [_tor1 modelToWorld [-5,0,0], ["Land_Canal_Wall_Stairs_F"], 5];
			if(count (_objs) == 0) exitWith {_fail = true;};
			_attachLeft = _objs select 0;
			_pforteL = _tor1;
		};



		if(_fail) exitWith {titletext["Something went wrong - Fehlercode:P1","PLAIN"];_tor1 setVariable["moving",nil,true];
	_tor2 setVariable["moving",nil,true];};


		if(!isnil "_attachRight") then {

			_objs = nearestObjects [_tor2 modelToWorld [-5,0,0], ["Land_Canal_Wall_Stairs_F"], 5];
			if(count (_objs) == 0) exitWith {_fail = true;};
			_attachLeft = _objs select 0;
			_pforteL = _tor2;

		} else {
			_objs = nearestObjects [_tor2 modelToWorld [5,0,0], ["Land_Canal_Wall_Stairs_F"], 5];
			if(count (_objs) == 0) exitWith {_fail = true;};
			_attachRight = _objs select 0;
			_pforteR = _tor2;


		};
		diag_log str _pforteL;
		diag_log str _attachLeft;
		diag_log str _pforteR;
		diag_log str _attachRight;

		if(_fail) exitWith {titletext["Something went wrong - Fehlercode:P2","PLAIN"];_tor1 setVariable["moving",nil,true];
	_tor2 setVariable["moving",nil,true];};

		_tor1 setVariable["moving",true,true];
		_tor2 setVariable["moving",true,true];



		_pforteR setdir (getdir _attachRight + 180);
		_pforteR attachto[_attachRight,[8,0.9,-0.1]];
		_pforteR setvariable["Pforte_R",true,true];


		_pforteL setdir (getdir _attachLeft + 180);
		_pforteL attachto[_attachLeft,[-7,0.9,-0.1]];
		_pforteL setvariable["Pforte_L",true,true];





			_tor1 setvariable["open",true,true];
			_tor2 setvariable["open",true,true];


			titleText["Tor öffnet sich","Plain Down"];

		{
			_pforteR setdir (getdir _attachRight + 180);
			_pforteR attachto[_attachRight,(_x select 0)];

			_pforteL setdir (getdir _attachLeft + 180);
			_pforteL attachto[_attachLeft,(_x select 1)];

			sleep 1;

		} foreach [[[8,0.9,-0.1],[-7,0.9,-0.1]],
					[[7,0.9,-0.1],[-6,0.9,-0.1]],
					[[6,0.9,-0.1],[-5,0.9,-0.1]],
					[[5,0.9,-0.1],[-4,0.9,-0.1]],
					[[4,0.9,-0.1],[-3,0.9,-0.1]],
					[[3,0.9,-0.1],[-2,0.9,-0.1]],
					[[2,0.9,-0.1],[-1,0.9,-0.1]],
					[[1,0.9,-0.1],[0,0.9,-0.1]],
					[[0,0.9,-0.1],[0,0.9,-0.1]]];
		titleText["____----Tor geöffnet----____","Plain Down"];

	} else {

		_tor1 setvariable["open",nil,true];
		_tor2 setvariable["open",nil,true];


		{
			if(_x getvariable["Pforte_L",false]) then {
				_pforteL = _x;
				_attachLeft = nearestObject [_pforteL,"Land_Canal_Wall_Stairs_F"];
			};

			if(_x getvariable["Pforte_R",false]) then {
				_pforteR = _x;
				_attachRight = nearestObject [_pforteR,"Land_Canal_Wall_Stairs_F"];

			};


			} foreach _tore;



			titleText["Tor schließt sich","Plain Down"];

			{
					_pforteR setdir (getdir _attachRight + 180);
					_pforteR attachto[_attachRight,(_x select 0)];

					_pforteL setdir (getdir _attachLeft + 180);
					_pforteL attachto[_attachLeft,(_x select 1)];

					sleep 1;

				} foreach [[[0,0.9,-0.1],[0,0.9,-0.1]],
							[[1,0.9,-0.1],[0,0.9,-0.1]],
							[[2,0.9,-0.1],[-1,0.9,-0.1]],
							[[3,0.9,-0.1],[-2,0.9,-0.1]],
							[[4,0.9,-0.1],[-3,0.9,-0.1]],
							[[5,0.9,-0.1],[-4,0.9,-0.1]],
							[[6,0.9,-0.1],[-5,0.9,-0.1]],
							[[7,0.9,-0.1],[-6,0.9,-0.1]],
							[[8,0.9,-0.1],[-7,0.9,-0.1]]];
				detach _pforteL;
				detach _pforteR;

				titleText["____----Tor geschlossen----____","Plain Down"];


};

	_tor1 setVariable["moving",nil,true];
	_tor2 setVariable["moving",nil,true];