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





private ["_display","_strText","_btn","_tempAll","_fail","_textundSo","_temp","_foreachIndex","_action","_marker"];
disableSerialization;

//if(playersnumber west < 5) exitWith {hint "Es müssen mindestens 5 Cops da sein für den Banküberfall!";};
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
		parseText "Sehr gut, du hast dein Team gefunden.<br/><br/>",
		parseText "Ich kenne da wen, sein Name ist Loui, er treibt sich immer in Athira rum.<br/><br/>",
		parseText "Wenn du wirklich die Zugangscodes willst, ist er der Richtige.<br/><br/>",
		parseText "Er ist bei der Bank angestellt, ist jedoch mit seinem Arbeitgeber nicht zufrieden.<br/><br/>",
		parseText "Ich bin mir sicher gegen die entsprechende Leistung wird er dir die Codes geben.<br/><br/>",
		parseText "Achja, bevor ich es vergesse, vergesst nicht eine Bombe für den Tresor und einen Bolzenschneider zur Bank mitzunehmen.<br/><br/>",
		parseText "Geht nun und suche Loui auf, ich markier ihn dir auf deiner Karte, ich werde Loui auch über dein Eintreffen informieren"
	],[
		image "core\textures\icons\Menu\personIcon.jpg"
	]

];


_btn ctrlShow false;



{
	_temp = composeText [ (_textundSo select 1) select 0,(_textundSo select 0) select _foreachIndex];
	_tempAll pushback _temp;
	if(count(_tempAll) > 5) then {
		_tempall deleteAt  0;
	};

	_strText ctrlSetStructuredText composeText _tempAll;

	if(count(_textundSo select 0) != (_foreachIndex + 1)) then {
		sleep 5;
		if(!dialog) exitWith {_fail = true;};
	};

} foreach (_textundSo select 0);

[[LHM_BANK_Way,LHM_group_Bank],"lhm_fnc_bankHeist_Monitor",false,false] call lhm_fnc_mp;



/*

this addAction["ansprechen",lhm_fnc_way_one_2_1,"",0,FALSE,FALSE,"",'BankHeistState == 0 && LHM_BANK_Way == "Way1"'];

this addAction["ansprechen",lhm_fnc_way_one_2,"",0,FALSE,FALSE,"",'BankHeistState == 1 && LHM_BANK_Way == "Way1"'];

this addAction["ansprechen",lhm_fnc_way_one_3,"",0,FALSE,FALSE,"",'BankHeistState == 2 && LHM_BANK_Way == "Way1"'];


this addAction["ansprechen",lhm_fnc_way_one_4,"",0,FALSE,FALSE,"",'BankHeistState == 4 && LHM_BANK_Way == "Way1"'];

this addAction["bedienen",lhm_fnc_terminal_open,"",0,FALSE,FALSE,"",'BankHeistState == 3 && LHM_BANK_Way == "Way1"'];
*/