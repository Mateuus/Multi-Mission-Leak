/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/

private["_unit","_weapon"];

_unit = _this select 0;
_weapon = _this select 1;

if (_weapon in ["hgun_P07_snds_F","hgun_Pistol_heavy_01_snds_F"]) then
{
	_unit setAmmo [_weapon, 0];
	sleep 1;
	_unit setAmmo [_weapon, 1];
};