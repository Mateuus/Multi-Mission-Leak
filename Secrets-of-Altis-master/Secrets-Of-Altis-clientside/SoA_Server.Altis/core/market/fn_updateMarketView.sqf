_dialog = finddisplay 39500;
_bank = _dialog displayCtrl 1006;
_bar = _dialog displayCtrl 1007;

_bank ctrlSetText format["%1€",[life_beatbankgeld] call life_fnc_numberText];
_bar ctrlSetText format["%1€",[life_beatgeld] call life_fnc_numberText];