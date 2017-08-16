/*
	File: fn_initLaser.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Laser tag has begun!
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_jailed"];
_team = [_this,0,1,[1]] call BIS_fnc_param;
_endTime = time + 200; //[_this,1,0,[0]] call BIS_fnc_param;

player setVariable["laserTagged", nil, true];
player setVariable["laserTeam", _team, true];
life_laser_blue = 0;
life_laser_red = 0;
[] call life_fnc_civFetchGear;
life_laser_inprogress = true;
removeVest player;
removeHeadgear player;
removeBackpack player;
removeUniform player;
removeAllWeapons player;

player setDamage 0;
player setFatigue 0;

_uniform = "U_O_Protagonist_VR";
_smoke = "SmokeShellRed";
if (_team == 1) then { _uniform = "U_B_Protagonist_VR"; _smoke = "SmokeShellBlue"; };
player forceAddUniform _uniform;

player addHeadgear "G_Goggles_VR";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addWeapon "hgun_Rook40_snds_F";
player addWeapon "NVGoggles";
player assignItem "NVGoggles";
player addMagazine _smoke;

_teamName = "BLUE";
_enemyName = "RED";
if (_team > 1) then
{
	_teamName = "RED";
	_enemyName = "BLUE";
};
[[0,2], format["Get ready, the round is about to begin. You are team %1, eliminate team %2!", _teamName, _enemyName]] call life_fnc_broadcast;

[] spawn
{
	while {life_laser_inprogress} do
	{
		if (cameraView == "EXTERNAL") then { player switchCamera "INTERNAL"; };
	};
};

[_uniform] spawn
{
	private ["_uniform","_oldUniform"];
	_uniform = _this select 0;
	while {life_laser_inprogress} do
	{
		_oldUniform = uniform player;
		waitUntil { !life_laser_inprogress || (_oldUniform != (uniform player)) };
		if (life_laser_inprogress) then { player forceAddUniform _uniform; };
	};
};

[] spawn
{
	private ["_blueScore", "_redScore"];
	while {life_laser_inprogress} do
	{
		_blueScore = life_laser_blue;
		_redScore = life_laser_red;
		waitUntil { !life_laser_inprogress || _blueScore != life_laser_blue || _redScore != life_laser_red };
		if (life_laser_inprogress) then
		{
			systemChat format["Blue Team: [%1 remaining] :: Red Team: [%2 remaining]", life_laser_blue, life_laser_red];
		};
	};
};

waitUntil { !life_laser_inprogress || time > _endTime };
if (isWeaponDeployed player) then { player playMove ""; };
life_laser_inprogress = false;
player setPos (player getVariable ["life_laser_pos", getMarkerPos "city"]);
player setVariable["laserTeam", nil, true];
if (count (units life_old_group) < 10) then
{
	[player] joinSilent (life_old_group);
}
else
{
	[player] joinSilent (createGroup civilian);
};
[] call life_fnc_civLoadGear;
[] call life_fnc_equipGear;