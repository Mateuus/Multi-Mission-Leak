



private ["_display","_lb_AllPlayers","_lb_switch","_lb_Mode","_lb_gespeicherte_skripts","_temp","_ordnung_namen","_punkte","_namen","_punkte_geordnet","_found","_calc","_color","_where","_who","_wer","_side_name"];


disableSerialization;

if((call lhm_adminlevel) isEqualTo 0) exitWith {hint "Kein Admin!";};
if(isnull (findDisplay 9858)) exitWith {};

_display = findDisplay 9858;
//Listboxes
_lb_AllPlayers = _display displayCtrl 1500;
_lb_switch = _display displayCtrl 1501;
_lb_Mode = _display displayCtrl 1502;
_lb_gespeicherte_skripts = _display displayCtrl 1503;
LHM_Highest = 0;
_temp = [];
_ordnung_namen = [];
_punkte = [];
_namen = [];


{
	if(alive _x) then {
		[[player,"hard"],"lhm_fnc_searchClient",[_x],false] call lhm_fnc_mp;
		waitUntil {if(isnull (findDisplay 9858)) exitWith {true}; !isnil "LHM_Searched";};
		_temp pushBack LHM_Searched;
		LHM_Searched = nil;

	};

} foreach playableUnits;

LHM_Searched = nil;



{
	_punkte pushback (_x select 1);
	_namen pushback (_x select 0);

} foreach _temp;



_punkte_geordnet = [_punkte,[],{_x},"DESCEND"] call BIS_fnc_sortBy;
_lb_switch lbDelete (lbsize _lb_switch - 1);
_lb_switch lbadd "------------------------------------------------------------------------------------------------------";
_lb_switch lbSetColor[(lbSize _lb_switch - 1),[0,0,1,1]];

{
	_found = false;
	_calc = _x / LHM_Highest;
	switch(true) do {
		case (_calc <= 0.05): {_color = [0,1,0,1]};
		case (_calc > 0.05 && _calc < 0.10): {_color = [0,1,0,1]};
		case (_calc >= 0.10 && _calc < 0.15): {_color = [0.251,1,0,1]};
		case (_calc >= 0.15 && _calc < 0.20): {_color = [0.502,1,0,1]};
		case (_calc >= 0.20 && _calc < 0.25): {_color = [0.604,0.996,0.18,1]};
		case (_calc >= 0.25 && _calc < 0.30): {_color = [0.749,1,0,1]};
		case (_calc >= 0.30 && _calc < 0.35): {_color = [1,1,0,1]};
		case (_calc >= 0.35 && _calc < 0.40): {_color = [0.969,0.996,0.18,1]};
		case (_calc >= 0.40 && _calc < 0.45): {_color = [0.98,0.8,0.18,1]};
		case (_calc >= 0.45 && _calc < 0.50): {_color = [1,0.749,0,1]};
		case (_calc >= 0.50 && _calc < 0.55): {_color = [0.98,0.675,0.345,1]};
		case (_calc >= 0.55 && _calc < 0.60): {_color = [0.996,0.604,0.18,1]};
		case (_calc >= 0.60 && _calc < 0.65): {_color = [1,0.502,0,1]};
		case (_calc >= 0.65 && _calc < 0.70): {_color = [0.875,0.455,0.004,1]};
		case (_calc >= 0.70 && _calc < 0.75): {_color = [0.961,0.663,0.663,1]};
		case (_calc >= 0.75 && _calc < 0.80): {_color = [0.969,0.506,0.506,1]};
		case (_calc >= 0.80 && _calc < 0.85): {_color = [0.98,0.345,0.345,1]};
		case (_calc >= 0.85 && _calc < 0.90): {_color = [0.996,0.18,0.18,1]};
		case (_calc >= 0.90 && _calc < 0.95): {_color = [1,0,0,1]};
		case (_calc >= 0.95 && _calc <= 1): {_color = [0.875,0.004,0.004,1] };
	};



	_where = _punkte find _x;
	_who = _namen select _where;
	_punkte deleteAt _where;
	_namen deleteAt _where;


	{
		if(name _x == _who) then {
			_wer = _x;
			_found = true;
		};

	} foreach playableUnits;


	if(_found) then {

		_side_name = switch(side _wer) do {
				case west : {"COP"};
				case east: {"SEC"};
				case independent : {"independent"};
				case civilian : {"CIV"};
			    };


		_lb_switch lbadd format["%1 - %2 - %3",_who,_side_name,round(_calc * 100)];
		_lb_switch lbSetColor[(lbSize _lb_switch - 1),_color];
	} else {
		_lb_switch lbadd format["%1 - %2 - %3",_who,"unbekannt",round(_calc * 100)];
		_lb_switch lbSetColor[(lbSize _lb_switch - 1),_color];

	};





} forEach _punkte_geordnet;





