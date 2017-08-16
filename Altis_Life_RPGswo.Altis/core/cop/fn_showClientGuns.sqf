#include "..\..\macros.hpp"

private["_cop"];
_cop = param [0,ObjNull,[ObjNull]];
if(isNull _cop) exitWith {};

_holstered_weapon = "";
_primary_weapon = "";
_secondary_weapon = "";
_handgun_weapon = "";
_carryd_wapons = "";

if (!isNil {DWEV_holstered_weapon}) then {_holstered_weapon = ITEM_WAFFE(DWEV_holstered_weapon);};

if ((primaryWeapon player) != "") then {_primary_weapon = ITEM_WAFFE(primaryWeapon player);};

if ((secondaryWeapon player) != "") then { _secondary_weapon = ITEM_WAFFE(secondaryWeapon player);};

if ((handGunWeapon player) != "") then { _handgun_weapon = ITEM_WAFFE(handgunWeapon player);};

{
	_tmp = "";
	_ret = format ["\n"];
	_tmp = format [(ITEM_WAFFE(_x))];
	_carryd_wapons = _carryd_wapons +_ret + _tmp;
	false;
} count ( itemsWithMagazines player );

format["Der Spieler hat folgende Waffen\n\n Geholstert:\n%1\nHauptwaffe:\n%2\nHandfeuerwaffe:\n%3\nZweitwaffe:\n%4\nSonstige:%5", _holstered_weapon, _primary_weapon, _handgun_weapon, _secondary_weapon, _carryd_wapons] remoteExec ["hint",_cop];