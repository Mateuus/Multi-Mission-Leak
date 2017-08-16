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
		parseText "Moin, Loui hat mich über euch informiert.<br/><br/>",
		parseText "Er sagte ich solle euch die Türen zur Bank öffnen.<br/><br/>",
		parseText "Für gewöhnlich mache ich sowas ja nicht, aber Loui hat was gut bei mir, meine kleine Schwester......<br/><br/>",
		parseText "Sie war so jung!!!<br/><br/>",
		parseText "Aber egal.....<br/><br/>",
		parseText "Ich mache euch jetzt die Türen zu den Keypads auf, den Code für die Zweittüren müsst ihr aber schon selbst eingeben.<br/><br/>",
		parseText "Ihr müsstest den Code an beiden Terminals gleichzeitig eingeben, die beiden Terminals befinden sich getrennt in den beiden kleinen vorderen Kuppeln.<br/><br/>",
		parseText "Doch passt auf, solltet ihr es nicht schaffen den Code 3-mal richtig bzw. gleichtzeitig einzugeben geht der Alarm los und die Polizei rückt sofort an!<br/><br/>",
		parseText "Und vergesst nicht, werdet ihr erwischt, ich kenne euch nicht, ihr kennt mich nicht.<br/><br/>",
		parseText "Achja, bevor ich es vergesse, ihr braucht um die Tür zum Tresor zu knacken einen Bolzenschneider und für den Tresor nachher eine Bombe.<br/><br/>",
		parseText "Aber genug jetzt, ich mache euch jetzt die Türen auf, viel Glück!<br/><br/>"
	],[
		image "core\textures\icons\Menu\personIcon.jpg"
	]

];


_btn ctrlShow false;



{
	_temp = composeText [ (_textundSo select 1) select 0,(_textundSo select 0) select _foreachIndex];
	_tempAll pushback _temp;
	if(count(_tempAll) > 4) then {
		_tempall deleteAt  0;
	};
	_strText ctrlSetStructuredText composeText _tempAll;

	if(count(_textundSo select 0) != (_foreachIndex + 1)) then {
		sleep 5;
		if(!dialog) exitWith {_fail = true;};
	};

} foreach (_textundSo select 0);


[[6],"lhm_fnc_bankHeist_setState",false,false] call LHM_fnc_MP;