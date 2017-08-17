/*
Author: Ryan W. for GhostGamingCommunity (www.GhostGamingCommunity.com)
Description: Makes the cop tazer only one shot, because what tazer is full auto?
If for some reason your tazer is a different weapon, just change the "hgun_P07_snds_F"'s

Please be considerate and leave my name in here, no one like people who steal.
*/

_player = _this select 0;
_weap = currentWeapon _player;
_ammo = _player ammo _weap;

if(side _player != west) exitWith {};

if (_weap == "hgun_Pistol_heavy_01_F") then {
	if (_ammo > 0) then {
	_player setAmmo ["hgun_Pistol_heavy_01_F",0];
	};
};