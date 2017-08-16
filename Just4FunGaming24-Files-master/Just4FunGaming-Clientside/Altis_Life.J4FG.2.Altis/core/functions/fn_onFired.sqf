/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/

private _ammoType = _this select 4; 
private _projectile = _this select 6;

if( _ammoType isEqualTo "GrenadeHand_stone" ) then {
	_projectile spawn {
		private["_position"];
		while { !(isNull _this) } do {
			_position = getPosATL _this;
			sleep 0.1;
		};
		[_position] remoteExec ["XY_fnc_flashbang", -2];
	};
};