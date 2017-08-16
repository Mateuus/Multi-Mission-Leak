/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_ammoType = _this select 4; 
_projectile = _this select 6;

if(_ammoType == "GrenadeHand_stone") then {
	_projectile spawn {
		private["_position"];
		while {!isNull _this} do {
			_position = getPosATL _this;
			sleep 0.1;
		};
		[_position] remoteExec ["life_fnc_flashbang",0];
	};
};

if(_ammoType == "SmokeShellGreen") then {
	[_projectile] remoteExec ["life_fnc_teargas",0];
};