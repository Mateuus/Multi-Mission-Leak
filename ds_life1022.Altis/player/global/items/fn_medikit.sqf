/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Medikit
*/

if (!isNull objectParent player) exitwith
	{
	["medikit",true,1] call DS_fnc_handleInventory;
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You can not use this while in a vehicle<br/></t>";
	hint _str;
	};

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 4;
player setDamage 0;

_str = parseText "<t color='#01DF01' size='1.5'><br/>You have been fully healed<br/></t>";
hint _str;

[] call DS_fnc_stamina;

if((playerSide isEqualTo west)||(player getVariable ["security",false]))then
	{
	_str = parseText "<t color='#01DF01' size='1.5'><br/>You have been fully healed and a medikit has been added to your inventory if you didn't already have one<br/></t>";
	hint _str;
	if((!("Medikit" in (uniformItems player)))&&(!("Medikit" in (backpackItems player)))&&(!("Medikit" in (vestItems player))))then
		{
		["Medikit"] call DS_fnc_equipItem;
		};
	};

player setVariable["selections",[],true];
player setVariable["getHit",[],true];