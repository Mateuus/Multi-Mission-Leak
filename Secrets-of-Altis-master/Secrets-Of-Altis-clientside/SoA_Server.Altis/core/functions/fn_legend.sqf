disableSerialization;

private["_mode","_switch","_bool"];

_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_switch = [_this,1,-1,[0]] call BIS_fnc_param;

_bool = switch(_switch) do {
	case 0: {false};
	case 1: {true};
};

switch(_mode) do {
	
	case 0: {life_legend set [0,_switch]};
	case 1: {life_legend set [1,_switch]};
	case 2: {life_legend set [2,_bool]};
	case 3: {life_legend set [3,_bool]};
	case 4: {life_legend set [4,_bool]};
	case 5: {life_legend set [5,_bool]};
	case 6: {life_legend set [6,_bool]};
	case 7: {life_legend set [7,_bool]};
	case 8: {life_legend set [8,_bool]};
	case 9: {life_legend set [9,_bool]};
	case 10: {life_legend set [10,_bool]};
	case 11: {life_legend set [11,_bool]};
	case 12: {life_legend set [12,_bool]};
	case 13: {life_legend set [13,_bool]};
	case 14: {life_legend set [14,_bool]};

	case 15: {
		_display = finddisplay 12;

		if(life_legend_show) then {
			(_display displayctrl 4980) ctrlSettext "Legende einblenden";
			for "_i" from 4983 to 5017 do {
				_disp = _display displayCtrl _i;
				_disp ctrlSetFade 1; 
				_disp ctrlCommit 1;
			};
			life_legend_show = false;
		} else {
			(_display displayctrl 4980) ctrlSettext "Legende ausblenden";
			for "_i" from 4983 to 5017 do {
				_disp = _display displayCtrl _i;
				_disp ctrlSetFade 0; 
				_disp ctrlCommit 1;
			};
			life_legend_show = true;
		};
	};

	case 16: {
		hint "Legende wurde gespeichert.";
		profileNamespace setVariable [format["%1_legend_%2",missionName,getplayerUID player],life_legend]; 
		saveProfileNamespace;
	};
};

if(_mode > 14) exitWith {};
[_mode,_switch] call life_fnc_marker;