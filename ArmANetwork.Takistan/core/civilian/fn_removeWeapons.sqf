/*
	Author: Tobias 'Xetoxyc' Sittenauer

	File: fn_removeWeapons.sqf
*/

private["_timer","_removed","_hgItems","_holder","_items","_pwItems","_safeItems","_swItems","_weps","_victim","_robber"];
_victim = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_robber = [_this,2,objNull,[objNull]] call BIS_fnc_param;
if(_robber == _victim) exitWith {};
_safeItems = ["FirstAidKit","ItemRadio","ItemMap","ItemCompass","ItemWatch","NVGoggles","Rangefinder","Binocular"];
_timer = 15;
_removed = false;

0 cutText["Your weapons are removed.","PLAIN"];

//--Get weapons, attachments and magazines of player
_weps = [];

_pwItems = primaryWeaponItems player;
_swItems = secondaryWeaponItems player;
_hgitems = handGunItems player;
_mags = magazinesAmmoFull player;


if(vehicle player != _robber) exitWith { hint "You need to exit your vehicle!"; }; 
if (alive _robber && {currentWeapon _robber != "" OR "Binocular"}) then {
hint format ["Removing Weapons. Wait %1 sec.",_timer];

while {true} do {
		hintsilent format ["%1 seconds remaining.",_timer];
		sleep 1;
		_timer = _timer - 1;
	};
if(_timer < 1) exitWith { _removed = true; };

if (!_removed) exitWith{};

//--Now remove stuff

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

//--Anything in backpack, vest etc we forgot? Make sure we don't include rangefinders etc. 

{
	if (!(_x in _safeItems)) then
	{
		player removeItem _x;
		_weps pushBack _x;
	};

}forEach (weapons player);


//-- Create holder and add everything to it.
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

//player say3D "Patdown";
//[[player,"PatDown"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
//--Save the player's updated gear.
[3] spawn SOCK_fnc_updatePartial;
hint ["Removed Weapons",_timer];
};