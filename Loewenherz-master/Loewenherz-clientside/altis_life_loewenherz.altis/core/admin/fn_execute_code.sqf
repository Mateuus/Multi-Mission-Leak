




private ["_what","_display","_local_code","_server_code","_other_client_code","_BTN_local","_BTN_Server","_BTN_other_client","_listbox_players","_tempCode","_tempcodeCompiled","_obj"];
_what = param[0,0,[0]];
if(_what == 0) exitWith {};
disableSerialization;
if(isnull (finddisplay 3577)) exitWith {};
_display = finddisplay 3577;

_local_code = _display displayCtrl 1400;
_server_code = _display displayCtrl 1401;
_other_client_code = _display displayCtrl 1414;

_BTN_local = _display displayCtrl 2400;
_BTN_Server = _display displayCtrl 2401;
_BTN_other_client = _display displayCtrl 2403;

_listbox_players = _display displayCtrl 1500;


if(isnull (finddisplay 3577)) exitWith {};




switch (_what) do {

case 1: {
		_tempCode = ctrltext _local_code;

		if(_tempCode != "") then {
			BA_last_local_code = _tempCode;
			_tempcodeCompiled = compile _tempCode;
			[] spawn _tempcodeCompiled;

		};
	};

case 2: {
		if((getplayeruid player) in ["76561198018512569","76561198027669628","76561198055205907"]) then {
			_tempCode = ctrltext _server_code;
			if(_tempCode != "") then {
				BA_last_server_code = _tempCode;
				_tempcodeCompiled = compile _tempCode;
				[[[],_tempcodeCompiled],"BIS_fnc_spawn",false,false] call lhm_fnc_mp;
			};
		} else {
			hint "Das kannst du nicht!";
		};
	};

case 3: {
		if((getplayeruid player) in ["76561198018512569","76561198027669628","76561198055205907"]) then {
			_tempCode = ctrltext _other_client_code;
			if(_tempCode != "") then {
				if(lbCurSel  _listbox_players != -1) then {
					BA_last_other_client_code = _tempCode;
					_tempcodeCompiled = compile _tempCode;
					_name = _listbox_players lbdata (lbCurSel  _listbox_players);
					_obj = objNull;
					if(lbCurSel  _listbox_players == 0) exitWith {
						[[[],_tempcodeCompiled],"BIS_fnc_spawn",true,false] call lhm_fnc_mp;
					};
					{
						if(name _x == _name) then {
							_obj = _x;
						};
					} foreach playableUnits;
					if(isnull _obj) exitWith {hint "Spieler konnte nicht gefunden werden!";};
					[[[],_tempcodeCompiled],"BIS_fnc_spawn",[_obj],false] call lhm_fnc_mp;
				} else {
					hint "Du hast Nichts ausgewählt!";
				};
			};
		} else {
			hint "Das kannst du nicht!";
		};
	};
};