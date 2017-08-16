/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
cutText ["","BLACK IN"];
if(count DWEV_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = [(side player)] call DWEV_fnc_spawnPointCfg;
	_sp = _spCfg select 0;

	if((side player) == civilian) then
	{
		if(isNil {(call compile format["%1", _sp select 0])}) then
		{
			player setPos (getMarkerPos (_sp select 0));
		}
		else
		{
			_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
			if (worldname == "Tanoa") then
			{
//				diag_log format ["########### Player spawned in typeof House: %1", typeOf(_spawnPos)];
//				systemChat format ["########### Player spawned in typeof House: %1", typeOf(_spawnPos)];
			};
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (_sp select 0));
	};
	titleText[format["Du bist gespawned in %1",_sp select 1],"BLACK IN"];
}
	else
{
	if((side player) == civilian) then
	{
		if(isNil {(call compile format["%1",DWEV_spawn_point select 0])}) then {
			if((["house",DWEV_spawn_point select 0] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (DWEV_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call DWEV_fnc_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (DWEV_spawn_point select 0));
				};

				{_bPos = _bPos - [(_house buildingPos _x)];} foreach (_house getVariable ["slots",[]]);
				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (DWEV_spawn_point select 0));
			};
		} else {
			_spawnPos = (call compile format["%1", DWEV_spawn_point select 0]) call BIS_fnc_selectRandom;

			if (worldname == "Tanoa") then
			{
				diag_log format ["########### Player spawned in typeof House: %1", typeOf(_spawnPos)];
				systemChat format ["########### Player spawned in typeof House: %1", typeOf(_spawnPos)];
			};
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (DWEV_spawn_point select 0));
	};
	titleText[format["Du bist gespawned in %1",DWEV_spawn_point select 1],"BLACK IN"];
};


[] spawn
{
   private["_handle"];
   cutText ["","BLACK IN"];

   if(DWEV_firstSpawn) then {
      DWEV_firstSpawn = false;
      //[] call DWEV_fnc_welcomeNotification;
	  if (player getVariable["noobschutz",false] && (side player) == civilian) then {execVM "dialog\welcomeMessage.sqf";};
   };
};

[] spawn
{
   private["_handle"];
   cutText ["","BLACK IN"];

	if (DWEV_combatlog) then
	{
		dwf_cash = 0;
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		player linkItem "ItemMap";
		player linkItem "ItemRadio";
		player linkItem "ItemWatch";
		player linkItem "ItemCompass";
		player forceaddUniform "U_IG_Guerilla2_2";
		player setObjectTextureGlobal [0,'textures\kleidung\civ\combatlog.paa'];
		[3] call SOCK_fnc_updatePartial;
		[0] call SOCK_fnc_updatePartial;
		[getPlayerUID player,0, side player] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen
		execVM "dialog\combatlog.sqf";
		[9,player,"Combatlog"] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
};

[] spawn
{
   private["_handle"];
   cutText ["","BLACK IN"];

	if (actionWeaponfree) then
	{
		["join"] spawn  DWEV_fnc_weaponfreeInfoMsg;
	};
};
/*
[] spawn
{
   private["_handle"];
   cutText ["","BLACK IN"];

	if (welcomeMessageSwitch) then
	{
	execVM "dialog\Messageoftheday.sqf";
	};
};
*/
[] call DWEV_fnc_sensorLoop;
[player, uniform player] call DWEV_fnc_equipTextures;
[player, backpack player] call DWEV_fnc_equipTextures;
DWEV_var_spawnInProcess = false;
