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



if(isnil "Louisbox_itemsReq") then {
	_textundSo = [
	[
		parseText "Sehr gut, ihr habt alles besorgen können.<br/><br/>",
		parseText "Nun kümmern wir uns um die Bank.<br/><br/>",
		parseText "Die Codes kann ich dir besorgen, dass ganze ist allerdings nicht ganz so einfach....<br/><br/>",
		parseText "Bevor wir an die Codes rankommen, müssen wir die Sicherheits-Server der LSA offline schalten.<br/><br/>",
		parseText "Ich markiere dir gleich auf deiner Karte 3 Standorte von Terminals<br/><br/>",
		parseText "Diese musst du anschalten, dann können wir weitermachen<br/><br/>",
		parseText "Gehe nun und schalte alle Terminals an, komme danach wieder zu mir!"
	],[
		image "core\textures\icons\Menu\personIcon.jpg"
	]

];
} else {
	_textundSo = [
		[
			parseText "Ihr habt vergessen was ihr braucht ihr Trottel, oder?<br/><br/>",
			parseText "Ihr seid mir ja Helden, und ihr wollt die Bank überfallen?!<br/><br/>",
			parseText "Naja, wenn ihr wissen wollt was ihr braucht, ich habs euch unter M -> Aufgaben nochmal aufgeschrieben!<br/><br/>",
			parseText "Geht jetzt und holt mir das Zeug, ich hab nicht den ganzen Tag zeit....<br/><br/>"
		],[
			image "core\textures\icons\Menu\personIcon.jpg"
		]

	];


};


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

if(!isnil "Louisbox_itemsReq") exitWith {};

[[2],"lhm_fnc_bankHeist_setState",false,false] call LHM_fnc_MP;


waitUntil {!(getmarkerpos "Bank_Way_1_1" isEqualTo [0,0,0])};
waitUntil {!(getmarkerpos "Bank_Way_1_2" isEqualTo [0,0,0])};
waitUntil {!(getmarkerpos "Bank_Way_1_3" isEqualTo [0,0,0])};

waitUntil {isNull (findDisplay 9560)};


sleep 1;
openMap [true, true];
waitUntil {visibleMap};
{
 [((findDisplay 12) displayCtrl 51),2,0.08,getMarkerPos _x] call lhm_fnc_setMapPosition;
 sleep 5;
}
forEach ["Bank_Way_1_1","Bank_Way_1_2","Bank_Way_1_3"];
openMap [false, false];






//_marker = createMarkerlocal["Loui",[13990.3,18703.7,0.00136185]];
//_marker setMarkerColorLocal "ColorBlue";
//_marker setMarkerTypeLocal "hd_destroy";
//_marker setMarkerTextLocal "Loui";

//_temp = LHM_group_Bank;
//_temp = _temp - [player];

//[{ _marker = createMarkerlocal["Loui",[13990.3,18703.7,0.00136185]];_marker setMarkerColorLocal "ColorBlue";_marker setMarkerTypeLocal "hd_destroy";_marker setMarkerTextLocal "Loui";  },"BIS_fnc_spawn", _temp, false] call LHM_fnc_MP;



// [["Way1_1",[13990.3,18703.7,0.00136185],"Assigned","Begebe dich nach Athira und suche nach Loui","Suche Loui auf","Finde Loui in Athira","BankJobAssigned"],"lhm_fnc_getMissionTask", LHM_group_Bank, false] call LHM_fnc_MP;