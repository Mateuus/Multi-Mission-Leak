/*
	File: fn_handleFired.sqf
	Author: MarkusSR1984

	Idea and Base Script from Killzone Kid: http://killzonekid.com/arma-scripting-tutorials-how-to-override-lmb/
*/

_unit = param [0, objNull, [objNull]];
_weapon = param [1, "", [""]];
_muzzle = param [2, "", [""]];
_mode = param [3, "", [""]];
_ammo = param [4, "", [""]];
_magazine = param [5, "", [""]];
_projectile = param [6, objNull, [objNull]];

if (isNil "DWEV_shootcounter") then {DWEV_shootcounter = 0;};
if (isNil "DWEV_lastWeapon") then {DWEV_lastWeapon = currentWeapon player;};
if (isNil "DWEV_lastammo") then {DWEV_lastammo = 300;};

//diag_log format ["###################################[Shootinfo] %1",_this];

if (DWEV_lastWeapon != currentWeapon player) then {DWEV_shootcounter = 0;DWEV_lastammo = 300;};

if (DWEV_shootcounter > 200) then
{
	DWEV_weapon_overheat = true;
};

if (DWEV_shootcounter < 150) then
{
	DWEV_weapon_overheat = false;
};

if ((DWEV_lastammo == (player ammo DWEV_lastWeapon)) && (DWEV_shootcounter > 5)) then
{
	AmmoCatcher = false;
	publicVariable "AmmoCatcher";
};
DWEV_lastammo = player ammo DWEV_lastWeapon;


if (random 1 < (0.025 + (DWEV_shootcounter / 1000))) then  // Zufallsgenerator für die Ladehemmung
{
	[] spawn
	{
		_frame = diag_frameno;
		_wep = currentWeapon player;
		_ammo = player ammo _wep;
		if (_ammo > 0) then
		{
			DWEV_weapon_malfunktion = true;
			player setAmmo [_wep, 0];
			waitUntil {_frame < diag_frameno};
			player setAmmo [_wep, _ammo];
		};
	};
};


if (DWEV_shootcounter <= 0) then
{
	[] spawn
	{
		while {DWEV_shootcounter > 0} do
		{
			DWEV_shootcounter = DWEV_shootcounter -1;
			sleep 3;
		};



	};

};

DWEV_shootcounter = DWEV_shootcounter + 1;

