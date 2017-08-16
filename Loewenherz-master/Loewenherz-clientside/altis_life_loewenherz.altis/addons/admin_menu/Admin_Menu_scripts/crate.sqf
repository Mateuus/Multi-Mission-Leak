private ["_backpacks","_magazines","_items","_weapons","_glasses","_classname","_dir","_pos","_thebox"];

_magazines = [
"30Rnd_556x45_Stanag",
"20Rnd_556x45_UW_mag",
"30Rnd_9x21_Mag",
"10Rnd_762x51_Mag",
"6Rnd_RedSignal_F",
"6Rnd_GreenSignal_F",
"6Rnd_45ACP_Cylinder",
"9Rnd_45ACP_Mag",
"16Rnd_9x21_Mag",
"30Rnd_65x39_caseless_green",
"SmokeShell"
];

_weapons = [
"arifle_sdar_F",
"hgun_Pistol_Signal_F",
"arifle_TRG20_F",
"arifle_Katiba_F",
"hgun_Rook40_F",
"hgun_Pistol_heavy_02_F",
"hgun_ACPC2_F",
"hgun_PDW2000_F"
];

_items = [
"FirstAidKit",
"NVGoggles",
"ToolKit",
"Binocular",
"V_Rangemaster_belt",
"optic_Holosight",
"acc_flashlight"
];

_glasses = [

];

_backpacks = [
"B_AssaultPack_cbr"
];

_classname = "Box_IND_AmmoVeh_F";
_dir = getDir Player;
_pos = getposATL player;
_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir), (_pos select 2)];
_thebox = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
_thebox setDir _dir;
_thebox setposATL _pos;

clearWeaponCargoGlobal _thebox;
clearMagazineCargoGlobal _thebox;
clearItemCargoGlobal _thebox;
clearBackpackCargoGlobal _thebox;

{_thebox addMagazineCargoGlobal [_x,50];} forEach _magazines;
{_thebox addWeaponCargoGlobal [_x,15];} forEach _weapons;
{_thebox addItemCargoGlobal [_x, 5];} forEach _items;
{_thebox addBackpackCargoGlobal [_x,1];} forEach _backpacks;

Hint "PartyBox spawned in front of you";

[["admin",(format["%1 with UID %2 spawns the Public Ammobox",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;