/*
	File: fn_initDialog.sqf
	Author: Mario2002

	Description:
	init the builder menu
*/


private ["_display","_confirmBTN","_listbox","_foreachindex","_fail","_gefunden","_selected","_wer"];

disableSerialization;


_display = finddisplay 8900;
_confirmBTN = _display displayCtrl 5002;
_confirmBTN ctrlEnable false;
_listbox = _display displayCtrl 8910;



_gefunden = objnull;
_action = ["Wollen Sie dieser Gruppierung wirklich diese Basis zuweisen?","BESTAETIGUNG","JA","NEIN"] call BIS_fnc_guiMessage;
if(_action) then {
	_selected = lbCurSel _listbox;
	if(_selected == -1) exitWith {hint "Nichts ausgewählt"};
	_wer = _listbox lbData _selected;
	diag_log str _wer;
	{
		if((name _x) == _wer) then {
			_gefunden = _x;
		};
	} foreach playableUnits;
	diag_log str _gefunden;
	if(isnull _gefunden) exitWIth {hint "Keinen Spieler gefunden!";};
	[[_gefunden,player],"build_fnc_getGangID",false,false] call lhm_fnc_mp;
	waitUntil {!(isnil "LHM_Basebuild_ID")};
	if(typename LHM_Basebuild_ID == "SCALAR") then {
		lhm_flagpole_gangid = str LHM_Basebuild_ID;
	} else {
		lhm_flagpole_gangid = LHM_Basebuild_ID;
	};
	 sleep 4 ;
	LHM_Basebuild_ID = nil;
	hint "Vorgang war erfolgreich!";
	closeDialog 0;
} else {
	_confirmBTN ctrlEnable true;
};
