_mode = [_this,0,-1,[-1]] call BIS_fnc_param;

disableSerialization;
if(_mode == 0) then {
	if (!(isNull (findDisplay 989898))) exitWith {};
	createDialog "Life_hilfe";
	_dialog = findDisplay 989898;
	_contentList = _dialog displayCtrl 1500;
	{
		_contentList lbAdd (_x select 0);
		_contentList lbSetPicture [(lbSize _contentlist)-1,(_x select 3)];
	} forEach Tutorialmenu;

} else {

	_dialog = findDisplay 989898;
	if(isNull _dialog) exitWith {};
	_contentList = _dialog displayCtrl 1500;
	_content = _dialog displayCtrl 2400;
	_title = _dialog displayCtrl 1616;
	_curSel = lbCurSel _contentList;
	_title ctrlSetText ((Tutorialmenu select _curSel) select 1);
	_content ctrlSetStructuredText parseText ((Tutorialmenu select _curSel) select 2);
};