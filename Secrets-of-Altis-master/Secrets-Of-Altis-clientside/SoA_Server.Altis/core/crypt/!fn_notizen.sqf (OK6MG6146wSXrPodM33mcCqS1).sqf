disableSerialization;

_mode = _this select 0;
_dialog = finddisplay 6200;
_textfeld = _dialog displayCtrl 6201;
_liste = _dialog displayCtrl 6202;

switch(_mode) do {

	case 0: {
		_struct = "";
	
		{
			_struct = _struct + format["• %1<br/><br/>",_x];
		} foreach life_notizen;

		if(_struct == "") then
		{
			_struct = "Keine Notiz eingetragen.";
		};
		_liste ctrlSetStructuredText parseText format["<t size='0.9px'>%1</t>",_struct];
	};
	
		case 1: {
		_text = (ctrlText _textfeld);
		life_notizen pushback _text;
		[0] call life_fnc_notizen;
	};
	
		case 2: {
		life_notizen = [];
		_textfeld ctrlSetText "";
		[0] call life_fnc_notizen;
	};
};