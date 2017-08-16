 
 
 
 
 
 
 
private["_Weapons","_WpnItems","_Magazines","_Items","_AssignedItems","_Uniform","_Goggles","_Headgear","_Backpack","_Vest","_Pos","_GWH","_ItemCount","_GWHD"]; 
 
_PrimWeapon = _this select 0; 
_SecWeapon = _this select 1; 
_WpnItems = _this select 2; 
_Magazines = _this select 3; 
_Items = _this select 4; 
_AssignedItems = _this select 5; 
_Uniform = _this select 6; 
_Goggles = _this select 7; 
_Headgear = _this select 8; 
_Backpack = _this select 9; 
_Vest = _this select 10; 
_Pos = _this select 11; 
 
_GWH = "Box_NATO_Ammo_F" createVehicle _Pos; 
_GWH allowDamage false; 
 
clearWeaponCargoGlobal _GWH; 
clearMagazineCargoGlobal _GWH; 
clearItemCargoGlobal _GWH; 
clearBackpackCargoGlobal _GWH; 
 
if(_PrimWeapon != "")then{_GWH addWeaponCargoGlobal [_PrimWeapon,1];}; 
if(_SecWeapon != "")then{_GWH addItemCargoGlobal [_SecWeapon,1];}; 
{if(_x != "")then {_GWH addItemCargoGlobal [_x,1];};}forEach _WpnItems; 
{_GWH addMagazineCargoGlobal [_x,1];}forEach _Magazines; 
_ItemCount = count(_Items); for "_x" from 0 to _ItemCount do {_GWH addItemCargoGlobal [_Items select _x,1];}; 
{if(_x == "Binocular")exitWith {}; if(_x == "Rangefinder")exitWith {}; _GWH addItemCargoGlobal [_x,1]; }forEach _AssignedItems; 
if(_Uniform != "") then {_GWH addItemCargoGlobal [_Uniform,1];}; 
if(_Goggles != "") then {_GWH addItemCargoGlobal [_Goggles,1];}; 
if(_Headgear != "") then {_GWH addItemCargoGlobal [_Headgear,1];}; 
if(_Backpack != "") then {_GWH addBackpackCargoGlobal [_Backpack,1];}; 
if(_Vest != "")  then {_GWH addItemCargoGlobal [_Vest,1];}; 
sleep 600; 
_GWHD = getPos _GWH nearestObject "Box_NATO_Ammo_F"; 
deleteVehicle _GWHD;