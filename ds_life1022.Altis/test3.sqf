private ["_listArray"];

closeDialog 0;
createDialog "rulesMenu";

_dialog = findDisplay 69696;

//Buttons 
_btn1 = _dialog displayCtrl 2400; //Rules
_btn2 = _dialog displayCtrl 2401; //Laws
_btn3 = _dialog displayCtrl 2402; //Police
_btnClose = _dialog displayCtrl 2403; //Close

_listBox = _dialog displayCtrl 1500; //Listbox

_btn1 ctrlSetText "Server Rules";
_btn1 ctrlSetTooltip "Show all server rules";
_btn1 buttonSetAction "closeDialog 0;";

_btn2 ctrlSetText "Server Laws";
_btn2 ctrlSetTooltip "Show all server laws";
_btn2 buttonSetAction "closeDialog 0;";

_btn3 ctrlSetText "Police Procedures";
_btn3 ctrlSetTooltip "Show all police procedures";
_btn3 buttonSetAction "closeDialog 0;";

_btnClose ctrlSetText "Close";
_btnClose ctrlSetTooltip "Closes the rules menu";
_btnClose buttonSetAction "closeDialog 0;";

if(isNil "DS_rulesMenuIndex")then {DS_rulesMenuType = 0;DS_rulesMenuIndex = 0;};

_listArray = [];

switch(DS_rulesMenuType)do {
	case 0: {
		_listArray = [666] call DS_fnc_rulesInfoReturn;
	};
};

if(count(_listArray) isEqualTo 0)exitwith {closeDialog 0};

lbClear _listBox;

{
	_listBox lbAdd format ["%1",(_x select 0)];
	_listBox lbSetData [_forEachIndex,(_x select 0)];
}forEach _listArray;
