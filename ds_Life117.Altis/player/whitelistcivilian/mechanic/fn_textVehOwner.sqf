/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sends a text to a vehicle owner
*/

//private[""];

closeDialog 0;

createDialog "phoneMenu";

disableSerialization;
_vehicle = cursorTarget;

if((!(_vehicle isKindOf "LandVehicle"))&&(!(_vehicle isKindOf "Air"))&&(!(_vehicle isKindOf "Ship")))exitwith{hint "You are not facing a vehicle"};

_owners = _vehicle getVariable "vehicle_owners";
_owners = (_owners select 0) select 0;
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
_type = "";

//Text
_logText ctrlSetStructuredText parseText "<t color='#FFFFFF'>Message Log</t>";

lbClear _log;
//Incase message log is empty
if(count DS_messageLog == 0) then 
	{
	_log lbAdd "No Messages To Display";
	_log lbSetData [(lbSize _log)-1,""];
	}
	else
	{
//Fill the message log
		{
			_log lbAdd format["%1",_x];
			_log lbSetData [(lbSize _log)-1,_x];
		}forEach DS_messageLog;
	};
//Set up Combo
lbClear _combo;
{
	if((getPlayerUid _x) == _owners) then
		{
		if((side _x) == west)then
			{
			_type = "(Officer)";
			}
			else
			{
			_type = "";
			};
		_combo lbAdd format["%1%2",_type,(name _x)];
		_combo lbSetData [(lbSize _combo)-1,str(_x)];
		};
} foreach playableUnits;

_btn1 ctrlSetText "  Message Player";
_btn1 buttonSetAction "[] spawn DS_fnc_messagePlayer;";
_btn1 ctrlSetTooltip "Send the above message to the selected person";

_btn2 ctrlSetText "  Message Police";
_btn2 buttonSetAction "[] spawn DS_fnc_messagePolice;";
_btn2 ctrlSetTooltip "Send the above message to the police";

_btn3 ctrlSetText "  Message Admins";
_btn3 buttonSetAction "[] spawn DS_fnc_messageAdmins;";
_btn3 ctrlSetTooltip "Send the above message to the admins (NO SPAM)";


_btn4 ctrlSetText "  Message Medics";
_btn4 buttonSetAction "[] spawn DS_fnc_messageMedic;";
_btn4 ctrlSetTooltip "Send the above message to the medics";

_btn5 ctrlEnable false;
_btn5 ctrlSetText "Message Mechanics";
_btn5 buttonSetAction "[] spawn DS_fnc_messageMechanic;";
_btn5 ctrlSetTooltip "Send the above message to the mechanics   (Coming soon)";

_btn6 ctrlEnable false;
_btn6 ctrlSetText "Message Security";
_btn6 buttonSetAction "[] spawn DS_fnc_messageSecurity;";
_btn6 ctrlSetTooltip "Send the above message to the security guards   (Coming soon)";

_btn7 ctrlShow false;
//Disable until used
/*
_btn7 ctrlSetText "Federal Police";
_btn7 buttonSetAction "[] spawn DS_fnc_messageFedPolice;";
_btn7 ctrlSetTooltip "Send the above message to the federal police (Serious police complaints only";
*/
if(player getVariable ["DSAdmin",false])then
	{
	_btn8 ctrlSetText "A: Message Player";
	_btn8 buttonSetAction "[] spawn DS_fnc_messageAdminPlayer;";
	_btn8 ctrlSetTooltip "Send the above message to the selected player";

	_btn9 ctrlSetText "A: Message All";
	_btn9 buttonSetAction "[] spawn DS_fnc_messageAdminAll;";
	_btn9 ctrlSetTooltip "Send the above message to all players";
	}
	else
	{
	_btn8 ctrlShow false;
	_btn9 ctrlShow false;
	};

_btn10 ctrlSetText "Block Number";
_btn10 buttonSetAction "[] spawn DS_fnc_blockNumber;";
_btn10 ctrlSetTooltip "Block the selected players number";

_btn11 ctrlSetText "  Close";
_btn11 buttonSetAction "closeDialog 0;";
_btn11 ctrlSetTooltip "Close Phone";

