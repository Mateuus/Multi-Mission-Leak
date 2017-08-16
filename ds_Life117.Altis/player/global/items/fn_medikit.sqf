/*
			File: fn_medikit.sqf
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			virtual item for full player healing.
*/
if (vehicle player != player) exitwith
	{
	["medikit",true,1] call DS_fnc_handleInventory;
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>You can not use this while in a vehicle<br/></t>",_empty];
	hint _str;
	};


player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 4;
player setDamage 0;

_str = parseText "<t color='#01DF01' size='1.5'><br/>You have been fully healed<br/></t>";
hint _str;

[] call DS_fnc_stamina;

if((playerside == west)||(player getVariable ["security",false]))then
	{
	_str = parseText "<t color='#01DF01' size='1.5'><br/>You have been fully healed and a medikit has been added to your inventory if you didn't already have one<br/></t>";
	hint _str;
	if((!("Medikit" in (uniformItems player)))&&(!("Medikit" in (backpackItems player)))&&(!("Medikit" in (vestItems player))))then
		{
		["Medikit"] call DS_fnc_equipItem;
		};
	};