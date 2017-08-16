/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens and updates the phone menu
*/

createDialog "phoneMenu";

disableSerialization;

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

if(DS_messageLog isEqualTo []) then {
	_index = _log lbAdd "No messages to display";
	_log lbSetData [_index,""];
} else {
	_counter = (count(DS_messageLog));
	while{!(_counter isEqualTo 0)}do {
		_index = _log lbAdd format ["%1",(DS_messageLog select ((_counter)-1))];
		_log lbSetData [_index,(DS_messageLog select ((_counter)-1))];

		_counter = _counter - 1;
	};

	/*
	{
		_index = _log lbAdd format ["%1",_x];
		_log lbSetData [_index,_x];
	} forEach DS_messageLog;
	*/
};

lbClear _combo;

if(_this isEqualTo [])then {
	{
		if(alive _x) then {
			_type = if((side _x) isEqualTo west)then{"(Officer)"}else{""};
			_index = _combo lbAdd format ["%1%2",_type,(name _x)];
			_combo lbSetData [_index,(_x call BIS_fnc_objectVar)];
		};
	} forEach allPlayers;
} else {
	if(_this select 0)then {
		{
			if((alive _x)&&(_x isEqualTo DS_cursorTarget))exitWith {
				_type = if((side DS_cursorTarget) isEqualTo west)then{"(Officer)"}else{""};
				_index = _combo lbAdd format ["%1%2",_type,(name _x)];
				_combo lbSetData [_index,(_x call BIS_fnc_objectVar)];
			};
		} forEach allPlayers;
	} else {
		{
			if((alive _x)&&(_x in DS_recentCallers))then {
				_type = if((side _x) isEqualTo west)then{"(Officer)"}else{""};
				_index = _combo lbAdd format ["%1%2",_type,(name _x)];
				_combo lbSetData [_index,(_x call BIS_fnc_objectVar)];
			};
		} forEach allPlayers;
	};
};

lbSort [_combo,"ASC"];

_btn1 ctrlSetStructuredText parseText "<t size='0.9'>Message Player</t>";
_btn1 buttonSetAction "[] spawn DS_fnc_messagePlayer;";
_btn1 ctrlSetTooltip "Send the above message to the selected person";

_btn2 ctrlSetStructuredText parseText "<t size='0.9'>Message Police</t>";
_btn2 buttonSetAction "[] spawn DS_fnc_messagePolice;";
_btn2 ctrlSetTooltip "Send the above message to the police";

_btn3 ctrlSetStructuredText parseText "<t size='0.9'>Message Admins</t>";
_btn3 buttonSetAction "[] spawn DS_fnc_messageAdmins;";
_btn3 ctrlSetTooltip "Send the above message to the admins (NO SPAM)";

_btn4 ctrlSetStructuredText parseText "<t size='0.9'>Message Medics</t>";
_btn4 buttonSetAction "[] spawn DS_fnc_messageMedic;";
_btn4 ctrlSetTooltip "Send the above message to the medics";

_btn5 ctrlSetStructuredText parseText "<t size='0.9'>Message Mechanics</t>";
_btn5 buttonSetAction "[] spawn DS_fnc_messageMechanic;";
_btn5 ctrlSetTooltip "Send the above message to the mechanics";

_btn6 ctrlSetStructuredText parseText "<t size='0.9'>Message Security</t>";
_btn6 buttonSetAction "[] spawn DS_fnc_messageSecurity;";
_btn6 ctrlSetTooltip "Send the above message to the security contractors";

_btn7 ctrlShow true;
_btn7 ctrlSetStructuredText parseText "<t size='0.9'>Show News</t>";
_btn7 buttonSetAction "[] spawn DS_fnc_showNews;";
_btn7 ctrlSetTooltip "Get a log of all recent events on the Island";

if(player getVariable ["DSAdmin",false])then {
	_btn8 ctrlSetStructuredText parseText "<t size='0.9'>A: Message Player</t>";
	_btn8 buttonSetAction "[] spawn DS_fnc_messageAdminPlayer;";
	_btn8 ctrlSetTooltip "Send the above message to the selected player";

	_btn9 ctrlSetStructuredText parseText "<t size='0.9'>A: Message All</t>";
	_btn9 buttonSetAction "[] spawn DS_fnc_messageAdminAll;";
	_btn9 ctrlSetTooltip "Send the above message to all players";
} else {
	_btn8 ctrlShow false;
	_btn9 ctrlShow false;
};

_btn10 ctrlSetStructuredText parseText "<t size='0.9'>Block Number</t>";
_btn10 buttonSetAction "[] spawn DS_fnc_blockNumber;";
_btn10 ctrlSetTooltip "Block the selected players number";

_btn11 ctrlSetStructuredText parseText "<t size='0.9'>Close</t>";
_btn11 buttonSetAction "closeDialog 0;";
_btn11 ctrlSetTooltip "Close Phone";