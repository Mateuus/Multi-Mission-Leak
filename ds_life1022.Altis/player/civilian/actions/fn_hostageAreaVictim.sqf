/*
	Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Hostage Taking Script
*/

private ["_hostageTaker","_removalAmount"];

_hostageTaker = _this select 0;
_removalAmount = (DS_atmCoin/5);

[_removalAmount,true,false] call DS_fnc_handleMoney;

player say3D "fail";
hint format ["$%1 was removed from your bank to pay your captor",[_removalAmount] call DS_fnc_numberText];

[] call DS_fnc_compileData;

[player,true,_removalAmount] remoteExec ["DS_civ_hostageArea",_hostageTaker];

player allowDamage false;

player setAmmo [currentWeapon player, 0];
player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
player setVariable ["escorted",false,true];
player setVariable ["restrained",false,true];
detach player;

sleep 5;

player allowDamage true;

player setPos (getMarkerPos "respawn_civilian");
[] spawn DS_fnc_menuSpawnScreen;

if(playerSide isEqualTo west)then
		{
		_policeGroup = player getVariable "policeGroup";
		if(!isNil "_policeGroup")then
			{
			[_policeGroup] call DS_fnc_joinGroup;
			player setVariable["policeGroup",nil,true];
			};
		};