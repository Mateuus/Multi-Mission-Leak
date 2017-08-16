private ["_mode","_display","_listbox","_id","_text"];
disableSerialization;
_mode = _this select 0;

_display = findDisplay 9000;
_listbox = _display displayCtrl 9001;
_id = _listbox lbData (lbCurSel _listbox);

switch (_mode) do
{
	case 0:
	{
		[[player,_id],"TON_fnc_auction_selectDate",false,false] call EMonkeys_fnc_mp;
	};
	case 1:
	{
		_text = _display displayCtrl 9004;
		_textformat = format ["<t align='left' size='1.1' color='#000000' >Auktionsende: %1</t>",(_this select 1) select 0];
		_text ctrlSetStructuredText parseText _textformat;
	};
};