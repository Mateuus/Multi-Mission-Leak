/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens and updates the phone menu
*/

disableSerialization;

_dialog = findDisplay 666672;
_gangList = _dialog displayCtrl 1500;

_index = lbCurSel _gangList;
_gangName = _gangList lbData _index;

_group = [_gangName] call DS_civ_gangGetGroup;
if(isNull _group)exitWith{};

DS_className = _group;

createDialog "phoneMenu";

_dialog = findDisplay 666669;
_title = _dialog displayCtrl 1400;
_log = _dialog displayCtrl 1500;
_logText = _dialog displayCtrl 1100;
_combo = _dialog displayCtrl 2100;
_btn1 = _dialog displayCtrl 2400;
_btn2 = _dialog displayCtrl 2401;
_btn3 = _dialog displayCtrl 2402;
_btn4 = _dialog displayCtrl 2403;
_btn5 = _dialog displayCtrl 2404;
_btn6 = _dialog displayCtrl 2405;
_btn7 = _dialog displayCtrl 2406;
_btn8 = _dialog displayCtrl 2407;
_btn9 = _dialog displayCtrl 2408;
_btn10 = _dialog displayCtrl 2409;
_btn11 = _dialog displayCtrl 2410;

_logText ctrlSetStructuredText parseText "<t color='#FFFFFF'>Message Log</t>";

lbClear _log;

if(DS_messageLog isEqualTo [])then {
	_index = _log lbAdd "No messages to display";
	_log lbSetData [_index,""];
} else {
	_counter = (count (DS_messageLog));
	while{!(_counter isEqualTo 0)}do {
		_index = _log lbAdd format ["%1",(DS_messageLog select ((_counter)-1))];
		_log lbSetData [_index,(DS_messageLog select ((_counter)-1))];

		_counter = _counter - 1;
	};
};

_btn1 ctrlSetText "Message Gang";
_btn1 buttonSetAction "[] spawn DS_fnc_messageGang;";
_btn1 ctrlSetTooltip "Send the above message to the selected gang";

_btn2 ctrlShow false;
_btn3 ctrlShow false;
_btn4 ctrlShow false;
_btn5 ctrlShow false;
_btn6 ctrlShow false;
_btn7 ctrlShow false;
_btn8 ctrlShow false;
_btn9 ctrlShow false;
_btn10 ctrlShow false;

_btn11 ctrlSetText "Close";
_btn11 buttonSetAction "closeDialog 0;";
_btn11 ctrlSetTooltip "Close Phone";