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
_tempVar = Gericht_1 getvariable["HACK_STATUS",[]];
if(count(_tempVar) < 3) exitWith {hint "Ihr habt noch nicht alle Server aktiviert!";};
//if(playersnumber west < 5) exitWith {hint "Es müssen mindestens 5 Cops da sein für den Banküberfall!";};
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
		parseText "Sehr gut, ihr habt es geschafft alle Server zu aktivieren.<br/><br/>",
		parseText "Jetzt fehlt nur noch eins, wir müssen nun die Security Server infiltrieren.<br/><br/>",
		parseText "Suedoestlich von Kavala gibt es eine Höhle, ich werde sie euch auf der Karte markieren<br/><br/>",
		parseText "Dort findet ihr einen Raum mit vielen Servern, geht dort an den Desktop-PC.<br/><br/>",
		parseText "und ruft die Bedienkonsole auf<br/><br/>",
		parseText "Dann startet ihr das Programm *Sledge*, gebt dies so ein und drückt Enter, dann müsst ihr nur noch warten bis das Programm fertig ist.<br/><br/>",
		parseText "Wenn ihr dies gemacht habt kommt wieder zu mir,dann werde ich in der Lage sein euch den Sicherheitscode für die Banktüren zu geben!"
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


[[3],"lhm_fnc_bankHeist_setState",false,false] call LHM_fnc_MP;

Gericht_1 setvariable["HACK_STATUS",nil,true];

//_marker = createMarkerlocal["Loui",[13990.3,18703.7,0.00136185]];
//_marker setMarkerColorLocal "ColorBlue";
//_marker setMarkerTypeLocal "hd_destroy";
//_marker setMarkerTextLocal "Loui";

//_temp = LHM_group_Bank;
//_temp = _temp - [player];

//[{ _marker = createMarkerlocal["Loui",[13990.3,18703.7,0.00136185]];_marker setMarkerColorLocal "ColorBlue";_marker setMarkerTypeLocal "hd_destroy";_marker setMarkerTextLocal "Loui";  },"BIS_fnc_spawn", _temp, false] call LHM_fnc_MP;



// [["Way1_1",[13990.3,18703.7,0.00136185],"Assigned","Begebe dich nach Athira und suche nach Loui","Suche Loui auf","Finde Loui in Athira","BankJobAssigned"],"lhm_fnc_getMissionTask", LHM_group_Bank, false] call LHM_fnc_MP;