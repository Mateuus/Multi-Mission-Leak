private["_hgItems","_holder","_items","_pwItems","_safeItems","_swItems","_weps","_headgear","_goggles","_vest"];

_safeItems = ["FirstAidKit","ItemRadio","ItemMap","ItemCompass","ItemWatch","NVGoggles","Rangefinder","Binocular","ToolKit"];

_weps = [];

_pwItems = primaryWeaponItems player;
_swItems = secondaryWeaponItems player;
_hgitems = handGunItems player;
_headgear = headgear player;
_goggles = goggles player;
_vest = vest player;

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

removeHeadgear player;
removeGoggles player;
removeVest player;

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

_holder addItemCargoGlobal [_headgear,1];
_holder addItemCargoGlobal [_goggles,1];
_holder addItemCargoGlobal [_vest,1];

call life_fnc_saveGear;

//ALTIS LIFE 4
[[0,format["%1's weapons items were confiscated by %2"]]] remoteExecCall ["life_fnc_broadcast",west];