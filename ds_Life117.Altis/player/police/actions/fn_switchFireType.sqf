/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Switches police officers between lethal and stun fire types
*/
private["_stunAmmo"];

if((playerside == west)&&(DS_copLevel < 2))exitwith{};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
_stunAmmo = player getVariable ["stunAmmo",false];
if(((vehicle player) != player)&&((driver(vehicle player) == player)))exitwith{hint "You can't do this while driving a vehicle";DS_doingStuff = false;};
if((DS_infoArray select 21) < 19)then
	{
	if(vehicle player == player)then
		{
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		};
	sleep 4;
	};
{
	if(_x distance player < 100)then
		{
		[[player,"reload"],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
		};
}forEach playableUnits;
if((playerside == west)&&((DS_infoArray select 21) > 27))then
	{
	sleep 2;
	}
	else
	{
	if(vehicle player == player)then
		{
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		};
	sleep 4;
	};
if(_stunAmmo)then
	{
	player setVariable ["stunAmmo",false,true];
	hint "Weapons converted to lethal Ammo";
	}
	else
	{
	player setVariable ["stunAmmo",true,true];
	hint "Weapons converted to Stun Ammo";
	};
DS_doingStuff = false;