/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Does things when a player clicks escape
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls","_UID","_btn1","_btn2"];
disableSerialization;

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp","_btn1","_btn2","_btn3","_btn4","_btn5"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_btn1 = (findDisplay 49) displayCtrl 103;
		_btn2 = (findDisplay 49) displayCtrl 122;
		_btn3 = (findDisplay 49) displayCtrl 523;
		_btn4 = (findDisplay 49) displayCtrl 109;
		_btn5 = (findDisplay 49) displayCtrl 1010;
		
		_btn1 ctrlSetText "The Darkside Life";
		_btn1 ctrlCommit 0;
		_btn2 ctrlSetText "Do not Combat Log";
		_btn2 ctrlCommit 0;
		_btn3 ctrlEnable false;
		_btn3 ctrlCommit 0;
		_btn4 ctrlEnable false;
		_btn4 ctrlCommit 0;
		_btn5 ctrlSetText "Created by Huntah";
		_btn5 ctrlCommit 0;

//Huntahs UID for debugging, Gets annoying waiting 10 seconds while testing over and over...
_UID = getPlayerUID player;

if(_UID in DS_adminList5) then {_timeStamp = time + 1;}else{if(DS_requestedMedic)then{_timeStamp = time + 600}else{_timeStamp = time + 5};};

		waitUntil {
			_abortButton ctrlSetText format["Abort available in %1",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		
		if(!isServer)then
			{
			if(DS_player_setup)then
				{
				[] call DS_fnc_compileData; 
				sleep 2;
				};
			};
		
		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	
	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player getVariable["cuffed",FALSE]) OR (player getVariable["Escorted",FALSE]) OR (player getVariable["cuffedVeh",FALSE]) OR (DS_jailed) OR (DS_tazed)) then {false} else {true};
};
	
while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	
	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false;
	
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;

	waitUntil{isNull (findDisplay 49)};
	[] call DS_fnc_stamina;
};