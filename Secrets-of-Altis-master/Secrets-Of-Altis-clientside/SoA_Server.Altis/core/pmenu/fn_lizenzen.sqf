disableSerialization;

_mode = _this select 0;

switch(_mode) do {

	case 0: {
		createdialog "lizenzen";

		_dialog = finddisplay 4000;
		_list = _dialog displayCtrl 4001;

		_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};

		{
			if((_x select 1) == _side) then
			{
				_str = [_x select 0] call life_fnc_varToStr;
				_val = missionNamespace getVariable (_x select 0);
				if(_val) then
				{
					_list lbadd format["%1",_str];
					_list lbSetData [(lbSize _list)-1,(_x select 0)];
				};
			};
		} foreach life_licenses;
		
		_list lbSetCurSel 0;
	};

	case 1: {
		_dialog = finddisplay 4000;
		_list = _dialog displayCtrl 4001;
		_desc = _dialog displayCtrl 4002;
		
		_text = [_list lbData (lbCurSel _list)] call life_fnc_beschreibung;
		
		if(_text == "") exitWith {_text = "Keine Lizenzen vorhanden."; _desc CtrlSetText _text};
		
		_desc CtrlSetStructuredText parseText _text;
	};
};