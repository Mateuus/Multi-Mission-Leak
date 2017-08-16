/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns server rules
*/
_dialog = findDisplay 69696;
_listBox = _dialog displayCtrl 1501;
_textArea = _dialog displayCtrl 1100;
_textArea ctrlSetStructuredText parseText format ["%1","No category selected"];

_listBox lbSetCurSel -1;

DS_rulesMenuIndex = ((_this select 0) select 1);

_listArray = [];

switch(DS_rulesMenuType)do {
	case 0: {
		_listArray = [DS_rulesMenuIndex,true] call DS_fnc_rulesInfoReturn;
	};
};

hint format ["%1",_listArray];

lbClear _listBox;

{
	_listBox lbAdd format ["%1",_x];
	_listBox lbSetData [_forEachIndex,_x];
}forEach _listArray;