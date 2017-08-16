/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Does things when a player clicks escape
*/

private ["_escSync","_canUseControls","_checkForDuping","_abortButton","_respawnButton","_fieldManual","_usebleCtrl"];

disableSerialization;

_escSync = {
	private ["_abortButton","_thread","_syncManager"];

	disableSerialization;

	_syncManager = {
		private ["_abortButton","_btn1","_btn2","_btn3","_btn4","_btn5","_timeStamp"];

		disableSerialization;

		_abortButton = (findDisplay 49) displayCtrl 104;
		_btn1 = (findDisplay 49) displayCtrl 103;
		_btn2 = (findDisplay 49) displayCtrl 122;
		_btn3 = (findDisplay 49) displayCtrl 523;
		_btn4 = (findDisplay 49) displayCtrl 109;
		_btn5 = (findDisplay 49) displayCtrl 1010;

		_btn1 ctrlSetText "The Darkside Life";
		_btn1 ctrlCommit 0;
		_btn2 ctrlSetText "Do Not Combat Log";
		_btn2 ctrlCommit 0;
		_btn3 ctrlEnable false;
		_btn3 ctrlCommit 0;
		_btn4 ctrlEnable false;
		_btn4 ctrlCommit 0;
		_btn5 ctrlSetText "Created by Huntah";
		_btn5 ctrlCommit 0;

		//Huntahs UID for debugging, gets annoying waiting 10 seconds while testing over and over...
		if((getPlayerUID player) in DS_adminList5)then {
			_timeStamp = time + 1;
		} else {
			_timeStamp = if(DS_requestedMedic)then{time + 600}else{time + 5};
		};

		waitUntil {
			_abortButton ctrlSetText format ["Abort available in %1",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			(round(_timeStamp - time) <= 0) || (isNull (findDisplay 49))
		};

		if(!isServer)then {
			if(DS_player_setup)then {
				[] call DS_fnc_compileData;
				sleep 2;
			};
		};

		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};

	_abortButton = (findDisplay 49) displayCtrl 104;

	if(_this)then {
		_thread = [] spawn _syncManager;
		waitUntil {(scriptDone _thread)||(isNull (findDisplay 49))};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = {
	if(playerSide isEqualTo west)exitWith{true};
	if((player getVariable ["restrained",false])||(player getVariable ["escorted",false])||(DS_jailed)||(DS_tazed))then{false}else{true};
};

_checkForDuping = {
	private ["_invDisplay","_bootDisplay"];

	//Wait until an open inventory is detected or the escape menu is closed
    waitUntil {(!isNull (findDisplay 602))||(!isNull (findDisplay 666668))||(isNull (findDisplay 49))};

    disableSerialization;

	//Escape Menu + I Inventory
	_invDisplay = findDisplay 602;
    if(!isNull _invDisplay)then{_invDisplay closeDisplay 0;};

	//Escape Menu + Boot Menu
	_bootDisplay = findDisplay 666668;
    if(!isNull _bootDisplay)then{_bootDisplay closeDisplay 0;};
};

while{true}do {
	waitUntil {!isNull (findDisplay 49)};

	//Check for duping attempts
	[] spawn _checkForDuping;

	//Define the buttons
	_abortButton = (findDisplay 49) displayCtrl 104;
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;

	//Block off our buttons first
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false;

	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;

	waitUntil {isNull (findDisplay 49)};

	[] call DS_fnc_stamina;
};