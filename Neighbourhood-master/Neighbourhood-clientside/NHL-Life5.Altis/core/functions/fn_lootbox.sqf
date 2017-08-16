//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_DelGWH.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Wenn tot, dann alles ablegen und Lootkiste erzeugen. (Hfftl. Anti-Dupe)
//::::::::::::  ::::::::::::\\

private["_PrimWeapon","_SecWeapon","_WpnItems","_Magazines","_Items","_AssignedItems","_Uniform","_Goggles","_Headgear","_Backpack","_Vest","_Pos"];

	_PrimWeapon = primaryweapon player;
	_SecWeapon = handgunweapon player;
	_WpnItems = primaryWeaponItems player;
	_Magazines = magazines player;
	_Items = Items player;
	_AssignedItems = assignedItems player;
	_Uniform = uniform player;
	_Goggles = goggles player;
	_Headgear = headgear player;
	_Backpack = backpack player;
	_Vest = vest player;
	_Pos = getPos player;
	
	player removeWeaponGlobal _PrimWeapon;
	player removeWeaponGlobal _SecWeapon;
	removeAllContainers player;
	removeUniform player;
	removeAllWeapons player;
	clearWeaponCargo player;
	removeGoggles player;
	removeHeadGear player;
	removeAllAssignedItems player;
	
	
	[[_PrimWeapon,_SecWeapon,_WpnItems,_Magazines,_Items,_AssignedItems,_Uniform,_Goggles,_Headgear,_Backpack,_Vest,_Pos],"TON_fnc_lootboxserver",false,false] spawn life_fnc_MP;