/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Hostage Taking Script
*/
private ["_hostageTaker"];

_hostageTaker = _this select 0;

_removalAmmount = (DS_atmCoin/5);

[_removalAmmount,true,false] call DS_fnc_handleMoney;

player say3D "fail";
hint format ["$%1 was removed from your bank to pay your captor",[_removalAmmount] call DS_fnc_numberText];

[] call DS_fnc_compileData;

[[player,true,_removalAmmount],"DS_civ_hostageArea",_hostageTaker,false] spawn BIS_fnc_MP;

player allowDamage false;

player setAmmo [currentWeapon player, 0];
player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
player setVariable ["escorted",false,true];
player setVariable ["cuffedVeh",false,true];
player setVariable ["cuffed",false,true];
player setVariable ["ziptied",false,true];
detach player;

sleep 5;

player allowDamage true;

player setPos (getMarkerPos "respawn_civilian");
[] spawn DS_fnc_menuSpawnScreen;