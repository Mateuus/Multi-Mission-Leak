/*
	File: fn_way_two_1.sqf
	Author: Barney/Bloodwyn

	Description:
	Weg 2 halt


	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/





private ["_display","_strText","_btn","_tempAll","_fail","_textundSo","_temp","_foreachIndex","_action","_marker"];
disableSerialization;
if(playersnumber west < 5) exitWith {hint "Es müssen mindestens 5 Cops da sein für den Banküberfall!";};
closeDialog 0;

createDialog "bank_chat_dialog";
waitUntil {!isNull (findDisplay 9560)};
_display = findDisplay 9560;

ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];

_strText = _display displayCtrl 1500;
_btn = _display displayCtrl 2400;
_tempAll = [];
_fail = false;
_textundSo = [
	[
		parseText "Ah die schnelle Nummer, also rein, puff und raus. Dafür müssen wir umso mehr vorbereiten.<br/><br/>",
		parseText "Ihr müsst euch zuerst einen unauffaelligen Truck besorgen hm...<br/><br/>",
		parseText "...so ein Zamack mit Plane waer gut... Da bringt ihr den Stuff unter.<br/><br/>",
		parseText "Im Gebirge Suedwestlich der Insel gibt es ein Hoelenversteck...ziemlich cooler Ort fuer technickfreaks...<br/><br/>",
		parseText "...Ich markier sie euch auf der Karte. Ihr muesst dort das EMP einladen.<br/><br/>",
		parseText "Schickt jemanden vorbei, wenn ihr den Truck bereit habt."
	],[
		image "core\textures\icons\Menu\personIcon.jpg"
	]

];


_btn ctrlShow false;



{
	_temp = composeText [ (_textundSo select 1) select 0,(_textundSo select 0) select _foreachIndex];
	_tempAll pushback _temp;

	_strText ctrlSetStructuredText composeText _tempAll;

	if(count(_textundSo select 0) != (_foreachIndex + 1)) then {
		sleep 5;
		if(!dialog) exitWith {_fail = true;};
	};

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
		[] spawn lhm_fnc_way_two_1;
	};
};



// [["wayTwoMarker1","ColorBlue","hd_flag",[0,0,0],"EMP einladen",false],"lhm_fnc_Marker",BankHeist_Team,false] call lhm_fnc_mp;