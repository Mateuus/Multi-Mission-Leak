private ["_liste","_index","_control","_info","_cops","_pagerselect","_pager"];
disableSerialization;
_liste = _this select 0;
_index = _this select 1;
_control = ((findDisplay 5689) displayCtrl 8256);
_pagerselect = _control lbData (lbCurSel _control);
_info = ((findDisplay 5689) displayCtrl 8255);
_cops = [];
lbClear _info;

{if (side _x isEqualTo west) then {_cops pushback _x;}} foreach playableunits;

{
	_pager = _x getVariable "pager";
	if (_pagerselect isEqualTo _pager) then {
		_info lbAdd format["%1",_x getVariable["realname",name _x]];
	};
} forEach _cops;