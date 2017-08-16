/*
	File: fn_way_one_1.sqf
	Author: Baney

	Description:
	Keine Zeit für Beschreibung, Star Trek gucken


	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/






private ["_display","_arr","_haben","_was","_show","_temp","_strText","_btn","_tempAll","_fail","_textundSo","_foreachIndex","_action","_marker"];

if(!(Gericht_1 getvariable["Hack_done",false])) exitWith {hint "Ihr habt den Hack noch nicht durchgeführt";};
//if(playersnumber west < 5) exitWith {hint "Es müssen mindestens 5 Cops da sein für den Banküberfall!";};
if(isNil "fed_code") exitWith {hint "Fehler: Bankcode nicht bekannt";};
disableSerialization;
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
		parseText "Sehr gut, ihr habt es geschafft das Programm zu aktivieren.<br/><br/>",
		parseText "Ich habe nun vollen Zugriff auf die Server der Bank.<br/><br/>",
		parseText "So, mal schauen, wo haben die Trottel denn den Code versteckt<br/><br/>",
		parseText "mhmhm.......<br/><br/>",
		parseText "Aja, da ist er ja<br/><br/>",
		parseText format["Der Code für die Fronttüren lautet: %1<br/><br/>",fed_code],
		parseText "Schreibt euch den bloß irgendwo auf!<br/><br/>",
		parseText "Nun könnt ihr zur Bank fahren, ich habe dort einen Freund, er steht in einem der Bürogebäude.<br/><br/>",
		parseText "Er ist dort Security Officer und würde euch die Türen zu den Keypads öffnen.<br/><br/>",
		parseText "Geht nun zu ihm!<br/><br/>"
	],[
		image "core\textures\icons\Menu\personIcon.jpg"
	]

];


_btn ctrlShow false;



{
	_temp = composeText [ (_textundSo select 1) select 0,(_textundSo select 0) select _foreachIndex];
	_tempAll pushback _temp;
	if(count(_tempAll) > 6) then {
		_tempall deleteAt  0;
	};
	_strText ctrlSetStructuredText composeText _tempAll;

	if(count(_textundSo select 0) != (_foreachIndex + 1)) then {
		sleep 5;
		if(!dialog) exitWith {_fail = true;};
	};

} foreach (_textundSo select 0);


[[5],"lhm_fnc_bankHeist_setState",false,false] call LHM_fnc_MP;