/*
	File: fn_spawnPointSelected.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;
private["_control","_selection","_spCfg","_sp"];
_nlrallowed = ["Kavala","Kavala Feuerwehr","Sicherheits HQ Ost","Kavala HQ"];
_control = param [0,controlNull,[controlNull]];
_selection = param [1,0,[0]];

_spCfg = [(side player)] call DWEV_fnc_spawnPointCfg;
_sp = _spCfg select _selection;
_display = (findDisplay 38500);
_map = (_display displayCtrl 38502);
_spawnbtn = (_display displayCtrl 38511);
_pos = getMarkerPos (_sp select 0);

DWEV_SpawnLockTimer = false;

[_map,1,0.1,_pos] call DWEV_fnc_setMapPosition;

if ([_pos] call DWEV_fnc_isInNlrRange) then
{
	if ((_sp select 1) in _nlrallowed) then
	{
		_spawnbtn ctrlEnable true;
		_spawnbtn ctrlSetText "SPAWN";
		DWEV_nlrSpawnAllowedMsg = true;
		hint "!!! ACHTUNG !!!\n\nDu darfst hier zwar Spawnen aber den Spawnort nicht verlassen!\nNaeheres dazu findest du in den Allgemeinen Regeln unter New Life Rule";
	}
	else
	{
		DWEV_nlrSpawnAllowedMsg = false;
		_spawnbtn ctrlEnable false;
		hintsilent "";
		[_pos,_spawnbtn] spawn
		{
			disableSerialization;
			_pos = (_this select 0);
			_spawnbtn = (_this select 1);
			sleep 1.1;
			DWEV_SpawnLockTimer = true;
			while {DWEV_SpawnLockTimer} do
			{
				_spawnbtn ctrlSetText format ["LOCKED %1",[_pos] call DWEV_fnc_getNlrLockTime];
				sleep 1;
			};
		};
	};
}
else
{
	_spawnbtn ctrlEnable true;
	_spawnbtn ctrlSetText "SPAWN";
};

DWEV_spawn_point = _sp;
ctrlSetText[38501,format["Aktueller Spawnpunkt: %1",_sp select 1]];
