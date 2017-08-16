
/*
	Author: Bryan "Tonic" Boardwine
	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_unit = _this select 0;
_weapon = _this select 1;
_ammoType = _this select 4;
_magazine = _this select 5;
_projectile = _this select 6;

life_combat_lastTick = diag_tickTime;

switch (_ammoType) do
{
	case "GrenadeHand_stone":
	{
		_projectile spawn
		{
			private["_position"];
			while {!isNull _this} do
			{
				_position = getPosATL _this;
				sleep 0.1;
			};
			[_position] remoteExec ["life_fnc_flashbang",-2];
		};
	};
};

if(player getVariable ["restrained",false]) then
{
    deleteVehicle _projectile;
};
