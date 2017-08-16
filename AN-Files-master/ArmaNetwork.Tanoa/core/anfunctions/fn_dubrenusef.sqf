/*
	Strip search

	fn_stripSearch.sqf
*/
private["_hgItems","_holder","_items","_pwItems","_safeItems","_swItems","_weps"];

titleText["Your weapons are removed.","PLAIN"];
[player,"patdown1",20] remoteExecCall ["life_fnc_quvucamaph",-2];

_safeItems = ["FirstAidKit","ItemMap","ItemCompass","ItemWatch","TRYK_Shemagh_shade_N","TRYK_Headset_NV","Rangefinder","Binocular"];
_weps = [];
_all = [];

_pwItems = primaryWeaponItems player;
_swItems = secondaryWeaponItems player;
_hgitems = handGunItems player;
_assItems = assignedItems player;
_invItems = items player;
_weapons = weapons player;

{
	_temp = _x;
	{
		if(!(_x in _weapons) && !(_x in _safeItems)) then
		{
			_all pushBack _x;

		};
	}forEach _temp;

} forEach [_assItems,_invItems];

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

}forEach [_hgItems, _pwItems, _swItems, _all];

{
	if (!(_x in _safeItems)) then
	{
		player removeWeapon _x;
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
}forEach [_hgItems, _pwItems, _swItems, _all];

_uniform = uniform player;
_vest = vest player;
_back = backpack player;

[_uniform,_vest,_back] spawn {
	_uniform = _this select 0;
	_vest = _this select 1;
	_back = _this select 2;
	removeBackpackglobal player;
	uiSleep 0.25;
	removeVest player;
	uiSleep 0.25;
	removeUniform player;
	uiSleep 2;
	player forceAddUniform _uniform;
	uiSleep 0.5;
	player addVest _vest;
	uiSleep 0.5;
	player addBackpackglobal _back;
	life_gear = [] call life_fnc_hewudefr;
}
