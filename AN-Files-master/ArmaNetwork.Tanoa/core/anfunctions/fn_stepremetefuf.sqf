/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
disableSerialization;
call life_fnc_stusefayaz;
if (life_respawned) then 
{
	("PainFlashLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
	[] call life_fnc_respawned;
	[] call life_fnc_xathaxus;
};

life_respawned = false;
life_killed = false;

if (life_arrested_time > 0) exitWith 
{
	if (life_firstSpawn) then {
		life_firstSpawn = false;
		player allowDamage true;
	};

	if(UpdateThread isEqualTo -1) then {
		UpdateThread = [300,life_fnc_kecedretr,[],true] call life_fnc_phefakefe;
	};
	if(FullThread isEqualTo -1) then {
		FullThread = [1,life_fnc_phoaroefroegoe,[],true] call life_fnc_phefakefe;
	};
	if(MedicThread isEqualTo -1) then {
		MedicThread = [1,life_fnc_houklamoustiup,[],true] call life_fnc_phefakefe;
	};
	if(PayCheckThread isEqualTo -1) then {
		PayCheckThread = [300,life_fnc_hazephap,[],true] call life_fnc_phefakefe;
	};
	[life_arrested_time,life_arrested_reason] spawn life_fnc_fruphumethum;
};

if (Camrunning) then {CamRunning = false;};
closeDialog 0;
createDialog "life_spawn_selection";
(findDisplay 38500) displaySetEventHandler ["KeyDown","_this call life_fnc_displayHandler"];
private _spawnlist = ((findDisplay 38500) displayCtrl 1500);

{
	private _requirement = getText(_x >> "requirement");
	if (_requirement isEqualTo "") then 
	{
		_requirement = compile "true";
	} 
	else 
	{
		_requirement = compile _requirement;
	};
	if (call _requirement) then 
	{
    	private _index = _spawnlist lbAdd getText(_x >> "displayName");
    	_spawnlist lbSetData [_index,configName _x];
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgSpawnPoint" >> str(playerSide)));

life_spawn_point = configName((missionConfigFile >> "CfgSpawnPoint" >> str(playerSide)) select 0);
_spawnlist lbSetCurSel 0;

private _setPlayerPos = getMarkerPos life_spawn_point;
[_setPlayerPos] spawn life_fnc_zuhastayustav;
