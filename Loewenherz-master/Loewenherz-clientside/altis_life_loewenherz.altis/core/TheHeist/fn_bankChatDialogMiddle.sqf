/*
	File: fn_bankChatDialog.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/


private ["_display","_weg","_strText","_btn","_tempAll","_fail","_textundSo","_temp","_foreachIndex","_action"];

closeDialog 0;
_weg = param[0,"",[""]];
waituntil{!dialog};
createDialog "bank_chat_dialog";
disableSerialization;
waitUntil {!isNull (findDisplay 9560)};






ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];
_display = findDisplay 9560;
_strText = _display displayCtrl 1500;
_btn = _display displayCtrl 2400;
_tempAll = [];
_fail = false;
_textundSo = [[],[]];
if(!(_weg in ["Way1","Way2"])) exitWith {hint "Fehler Sequenz 1A, diese Nachricht wird sich in 5 Sekunden selbst zerstören"; sleep 5; closeDialog 0;};
diag_log _weg;
if(_weg == "Way1") then {
	diag_log "gefunden";

	_textundSo = [
		[
			parseText "Du hast dich also für Weg 1 entschieden, gut.<br/><br/>",
			parseText "Ich kenne da jemanden von der Security Firma der dir helfen kann.<br/><br/>",
			parseText "Dazu aber später mehr....<br/><br/>",
			parseText "Wähle nun erstmal dein Team."
		],[
			image "core\textures\icons\Menu\personIcon.jpg"
		]

		];

};



if(_weg == "Way2") then {

	_textundSo = [
		[
			parseText "Weg 2 Text<br/><br/>",
			parseText "Weg 2 Text<br/><br/>",
			parseText "Weg 2 Text<br/><br/>",
			parseText "Weg 2 Text<br/><br/>",
			parseText "Weg 2 Text<br/><br/>",
			parseText "Weg 2 Text"
		],[
			image "core\textures\icons\Menu\personIcon.jpg"
		]

		];
};

diag_log "72";
_btn ctrlSetText "Weiter!";
_btn buttonSetAction "closeDialog 0; [] spawn lhm_fnc_bankgroupmenu;";

_btn ctrlShow false;
diag_log str _btn;
diag_log str _strText;
diag_log str _textundSo;

{
	_temp = composeText [ (_textundSo select 1) select 0,(_textundSo select 0) select _foreachIndex];
	_tempAll pushback _temp;

	_strText ctrlSetStructuredText composeText _tempAll;

	diag_log str _tempAll;
	sleep 5;
	if(!dialog) exitWith {_fail = true;};

} foreach (_textundSo select 0);

if(_fail) exitWIth {
	closeDialog 0;
	sleep 0.2;
	_action = [
		"Wollen Sie wirklich den Vorgang abrechen?",
		"Bestaetigung",
		"JA",
		"NEIN"
	] call BIS_fnc_guiMessage;

	waituntil{ str _action == "true" or  str _action == "false"};

	if(!_action) then {
		closeDialog 0;
		[] spawn lhm_fnc_bankChatDialogMiddle;
	};
};
_btn ctrlShow true;
