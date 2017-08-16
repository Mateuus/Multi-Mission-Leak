/*
	File: fn_bankModeMenu.sqf
	Author: Barney

	Description:
	Fills/Updates the dialog..... and so on



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/


private ["_display","_textWeg1","_textWeg2","_BTNWeg1","_BTNWeg2"];
disableSerialization;

closeDialog 0;
createDialog "bank_group_mode";
waitUntil {!isNull (findDisplay 9500)};
_display = findDisplay 9500;
ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];
_textWeg1 = _display displayCtrl 1100;
_textWeg2 = _display displayCtrl 1101;
_BTNWeg1 = _display displayCtrl 2402;
_BTNWeg2 = _display displayCtrl 2400;

_textWeg1 ctrlSetStructuredText parseText format ["-Suche Loui <br/>-Aktiviere die Server <br/>-Hacke die Security Server"];

_textWeg2 ctrlSetStructuredText parseText format ["-Eigenschaft 1 <br/>-Eigenschaft 2 <br/>-Eigenschaft 3"];



_BTNWeg2 ctrlAddEventHandler ["ButtonDown",
    {
        ["Way2"] spawn lhm_fnc_bankChatDialogMiddle; LHM_BANK_Way = "Way2";
    }];

_BTNWeg1 ctrlAddEventHandler ["ButtonDown",
    {
        ["Way1"] spawn lhm_fnc_bankChatDialogMiddle; LHM_BANK_Way = "Way1";
    }];


