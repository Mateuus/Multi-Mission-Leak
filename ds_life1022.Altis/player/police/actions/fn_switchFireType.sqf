/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Switches police officers between lethal and stun fire types
*/

private["_stunAmmo","_cop","_targets"];

if((playerSide isEqualTo west)&&(DS_copLevel < 3)&&(!(miscInfoArray select 8)))exitwith{};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
_stunAmmo = player getVariable ["stunAmmo",false];
if((!isNull objectParent player)&&((driver (vehicle player) isEqualTo player)))exitwith{hint "You can't do this while driving a vehicle";DS_doingStuff = false;};
if((DS_infoArray select 21) < 19)then
	{
	if(isNull objectParent player)then
		{
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		};
	sleep 4;
	};
_cop = player;
_targets = allPlayers select {(_x distance player) < 100};
[_cop,"reload"] remoteExecCall ["DS_fnc_playSounds",_targets];
if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 27))then
	{
	sleep 2;
	}
	else
	{
	if(isNull objectParent player)then
		{
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		};
	sleep 4;
	};
if(_stunAmmo)then
	{
	player setVariable ["stunAmmo",false,true];
	hint "Weapons converted to lethal ammo";
	}
	else
	{
	player setVariable ["stunAmmo",true,true];
	hint "Weapons converted to stun ammo";
	};
DS_doingStuff = false;