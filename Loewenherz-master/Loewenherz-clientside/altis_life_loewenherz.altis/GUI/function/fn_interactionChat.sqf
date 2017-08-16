/*
	File: fn_interactionChat.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/



private ["_display","_strText","_btnOK","_listbox","_tempAll","_fail","_fragen","_antworten","_antwortenNPC","_oft","_count","_default","_temp","_foreachIndex","_index"];
disableSerialization;

waitUntil {!isNull (findDisplay 8540)};
_display = findDisplay 8540;

ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];

_strText = _display displayCtrl 1500;
_btnOK = _display displayCtrl 9998;
_listbox = _display displayCtrl 9999;
_tempAll = [];
_fail = false;
//_fragen = [
//	[
//		parseText "So, du Wurst willst also dem LHPD beitreten?<br/><br/>",
//		parseText "Nun ich kenne dafür 2 Wege, welchen du wählst ist mir egal....<br/><br/>",
//		parseText "Nur ist der eine gefährlicher als der andere, also überleg gut!<br/><br/>",
//		parseText "Und vergiss nicht, dass ist meine Insel und ohne meinen Anteil vom Kuchen läuft hier gar Nichts.<br/><br/>",
//		parseText "Solltest du es vergessen werde ich MS-DOS Manfred und Lötkolben Ludwig vorbeischicken.<br/><br/>",
//		parseText "Jetzt aber richtig, wähle jetzt den Weg Heidi"
//	],[
//		image "core\textures\icons\Menu\personIcon.jpg"
//	]
//
//];


_antworten = [
	[
		["Ja SIR!","Ja"],
		["Ich will für Recht und Ordnung stehen, SIR!","Brauch halt Kohle!","Ich knechte gerne andere","Hab gehört sei ganz cool"],
		["< 17","17","18","> 18"]
	],[
		image "core\textures\icons\Menu\personIcon.jpg"
	]

];


_antwortenNPC = [
	[
		[parseText "So, du Wurst willst also dem LHPD beitreten?<br/><br/>"],
		[parseText "Gut Gut, dann sag mir doch warum sollten wir gerade dich einstellen?<br/><br/>",parseText "Das heißt JA SIR du Hund, warum sollte ich dich nehmen?<br/><br/>"],
		[parseText "Das ist lobenswert, sage mir jungchen wie alt bist du denn?<br/><br/>", parseText "Wenn du Kohle brauchst bist du hier falsch, wie alt sind Sie denn?<br/><br/>", parseText "Dann bist du beim LHPD genau richtig jungchen, wie alt bist du denn?<br/><br/>", parseText "Ja ist, ganz Cool, wie alt sind Sie denn?<br/><br/>"],
		[parseText "Jünger als 17 ist nicht gut, du kannst es allerdings gerne probieren, Bewerbungen sind unter www.lhzp.de möglich!<br/><br/>", parseText "Mit 17 kannst du es gerne mal probieren, Bewerbungen sind unter www.lhzp.de möglich!<br/><br/>", parseText "18, gut bewirb dich jetzt unter www.lhzp.de!!<br/><br/>", parseText "Gutes Alter, bewirb dich jetzt unter www.lhzp.de!!<br/><br/>"]
	],[
		image "core\textures\icons\Menu\personIcon.jpg"
	]

];

_oft = count(_antwortenNPC select 0);
_count = 0;
_default = 0;
{

	lbClear _listbox;
	_count = _count + 1;


	if(_count == 4) then {
		_count = 0;
		_tempAll = [];
	};

	_temp = composeText[((_antwortenNPC select 1) select 0),(((_antwortenNPC select 0) select _foreachIndex)select _default)];

	_tempAll pushBack _temp;

	_strText ctrlSetStructuredText composeText _tempAll;




	{
		_listbox lbAdd _x;
		_listbox lbSetValue[_foreachIndex,_foreachIndex];

	} foreach ((_antworten select 0) select _foreachIndex);

	if(_foreachIndex != (_oft - 1) ) then {
		waitUntil {LHM_Click || !dialog};
		if (!dialog) then {
			_fail = true;
		};
		LHM_Click = false;
		if(_fail) exitWith {};
		_index = _listbox lbValue (lbCurSel _listbox);
 		_temp = parseText format ["<t align='right'>%1</t> <br/><br/> ", ((_antworten select 0)select _foreachIndex) select _index];
		_tempAll pushback _temp;
		_default = _index;
		_strText ctrlSetStructuredText composeText _tempAll;
	};

	if(_fail) exitWith {};

}foreach (_antwortenNPC select 0);

