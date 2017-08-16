#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_ammoType = SEL(_this,4);
_projectile = SEL(_this,6);

#define SAFETY_ZONES [["safezone", 1350],["rebelzone1_1",100]]
#define MESSAGE "Vous ne pouvez pas tirer, vous êtes en safe zone!"

if (({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) && playerSide == civilian && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
	player action ["SwitchWeapon", player, player, 100];
	deleteVehicle (_this select 6);
	titleText [MESSAGE, "PLAIN", 3];
	hint parseText format["<t color='#01B0F0'><t size ='2.5'<t align='center'>Safe Zone<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Pas de tirs<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Pas de vols<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Pas de braquage<br/><t"];
};

if(EQUAL(_ammoType,"GrenadeHand_stone")) then {
	_projectile spawn {
		private "_position";
		while {!isNull _this} do {
			_position = ASLtoATL (visiblePositionASL _this);
			sleep 0.1;
		};
		[_position] remoteExec ["life_fnc_flashbang",RCLIENT];
	};
};