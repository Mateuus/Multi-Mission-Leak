/*
KBW_fnc_addweapon
Kevin Webb
Workaround for adding attachments to the weapon
*/
_weapon = param [0,"",[""]];
_attachments = param [1,[],[[]]];
player addWeapon _weapon;
{
	player addPrimaryWeaponItem _x;
} forEach _attachments;