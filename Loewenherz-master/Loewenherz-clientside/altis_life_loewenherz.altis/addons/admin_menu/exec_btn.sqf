




private ["_display","_ListboxPlayers","_ListboxSkripts","_woSkripts","_woPlayer","_fail","_done","_path","_fill","_was","_ret","_spielerJaNein","_skript","_wo","_wer"];
if(!dialog) exitWith {hint "Fehler 2"};
disableSerialization;
_display = finddisplay 6666;
_ListboxPlayers = _display displayCtrl 1500;
_ListboxSkripts = _display displayCtrl 1501;
_woSkripts = lbCurSel _ListboxSkripts;
_woPlayer = lbCurSel _ListboxPlayers;
_fail = false;
_done = false;
_path = "addons\admin_menu\Admin_Menu_scripts\";

if(_woSkripts == -1) exitWith {hint "Du musst ein Skript auswählen, Vollidiot...."};


_fill = compile preprocessFileLineNumbers "addons\admin_menu\admin_menu_skripts.sqf";
_was = _ListboxSkripts lbValue _woSkripts;

_ret = [_was] call _fill;

if(count(_ret) == 0) exitWith {hint "Fehler 3"};

if(count(_ret) == 1) exitWith {hint "Das kann man nicht ausführen!!"};

_spielerJaNein = _ret select 2;
_skript =  _ret select 1;

if(typename _skript == "CODE") then {
	(_ret select 3) spawn _skript;
	_done = true;
} else {
	_wo = _path + _skript;
	//_wo = str _wo;
};

if(_done) exitWith {};


if(_spielerJaNein == 1) then {
	if(_woPlayer == -1) exitWith {_fail = true;};
	_wer = _ListboxPlayers lbData _woPlayer;
	[nil,nil,_wer] execVM _wo;
	_done = true;



};


if(_fail) exitWith {hint "Du musst dafür einen Spieler auswählen, Trottel....."};
if(_done) exitWith {};

execVM _wo;

