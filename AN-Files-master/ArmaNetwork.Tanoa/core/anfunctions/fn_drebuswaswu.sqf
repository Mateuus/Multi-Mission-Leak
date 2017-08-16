/*
	ArmA.Network
	Author: Rathbone
	Copyright (c) ArmA.Network 2015 - 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
with missionNamespace do 
{
	disableSerialization;
	private _display = _this select 0;
	private _ctrlAbort = (_this select 0) displayCtrl 104;
	private _respawnButton = (_this select 0) displayCtrl 1010;
	private _fieldManual = (_this select 0) displayCtrl 122;
	private _saveButton = (_this select 0) displayCtrl 103;

	uiNamespace setVariable ["life_escapeDisplay",_display];

	_saveButton ctrlEnable false;
	_saveButton ctrlSetText "ArmA.Network";
	_respawnButton ctrlEnable false;
	_respawnButton ctrlSetText "Tanoa Life";
	_fieldManual ctrlEnable false;
	_fieldManual ctrlSetText "V2.0";

	_ctrlAbort ctrlSetEventHandler [
		"ButtonClick", 
		"with missionNamespace do { [] spawn life_fnc_koaqouflesoudlu; }; ( uiNamespace getVariable 'life_escapeDisplay' ) closeDisplay 2; true" 
	];

	if(playerSide in [civilian,west] && {(player getVariable["restrained",false] || player getVariable["Escorting",false])}) then 
	{
		_ctrlAbort ctrlEnable false;
	} 
	else 
	{
		if (!isNil "SideInfo" && {SideInfo}) then 
		{
			_ctrlAbort ctrlEnable false;
			private _waitTime = diag_tickTime + 10;
			private _combatTime = missionNamespace getVariable "life_combat_lastTick";
			if (!isNil "_combatTime") then 
			{
				_combatTime = diag_tickTime - _combatTime;
				if (_combatTime < 20) then 
				{
					_waitTime = _waitTime + (20 - _combatTime);
				};
			};

			while {!isNull _display} do 
			{
				private _timeLeft = _waitTime - diag_tickTime;
				if (diag_tickTime < _waitTime) then 
				{
					_ctrlAbort ctrlSetText format [localize "STR_NOTF_AbortESC", [_timeLeft,"SS.MS"] call BIS_fnc_secondsToString ];
				} 
				else 
				{
					_ctrlAbort ctrlSetText "Save and Abort";
					_ctrlAbort ctrlEnable true;
				};
			};
		};
	};
};
true
