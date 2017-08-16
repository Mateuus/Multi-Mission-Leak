/*
	Author: !TS JORDAN
	For: AltisLifeRPG Community
	Description: Takes a players weapons and mags, then drops them on the ground.
*/
private["_hgItems","_holder","_items","_pwItems","_safeItems","_swItems","_weps","_unit"];

_safeItems = ["FirstAidKit","ItemRadio","ItemMap","ItemCompass","ItemGPS","ItemWatch","NVGoggles","Rangefinder","Binocular"];
_unit = player;

[_unit,"patdown"] remoteExec ["life_fnc_say3D",RANY];	

titleText[localize "Your weapons are removed.","PLAIN"];

_weps = [];

_pwItems = primaryWeaponItems player;
_swItems = secondaryWeaponItems player;
_hgitems = handGunItems player;

_mags = magazinesAmmoFull player;

{player removeMagazine _x} foreach (magazines player);

if(primaryWeapon player != "") then
{
	_weps pushBack (primaryWeapon player);
	player removeWeapon (primaryWeapon player);

};
		
if(secondaryWeapon player != "") then
{
	_weps pushBack (secondaryWeapon player);
	player removeWeapon (secondaryWeapon player);

};
		
if(handgunWeapon player != "") then
{
	_weps pushBack (handgunWeapon player);
	player removeWeapon (handgunWeapon player);
};

{
	_items = _x;
	{
		player unassignItem _x;
		player removeItem _x;
	}forEach _items;
	
}forEach [_hgItems, _pwItems, _swItems]; 

{
	if (!(_x in _safeItems)) then
	{
		player removeItem _x;
		_weps pushBack _x;
	};

}forEach (weapons player);

 _holder = createVehicle [ "GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE" ];
 
{
	_holder addWeaponCargoGlobal [_x,1];
}forEach _weps;

{
	_holder addMagazineCargoGlobal [_x select 0,1];
}forEach _mags;

{
	_items = _x;
	{
		_holder addItemCargoGlobal [_x,1];
	}forEach _items;
}forEach [_hgItems, _pwItems, _swItems];

call life_fnc_saveGear;