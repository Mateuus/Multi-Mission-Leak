#include <macro.h>
private ["_nbrAmmo","_curAmmo","_curBack","_curWep","_curVest","_type","_curitem ","_curmag","_cursil","_curlas","_curopt"];
_type = _this select 0;
_curWep = currentWeapon player;
_curBack = backpackItems player;
_curVest = vestItems player;
_curAmmo = magazinesAmmoFull player;
_curmag = currentMagazine player;
_curitem = player weaponAccessories RIFLE; //[silencer, laserpointer/flashlight, optics, bipod]
_cursil = _curitem select 0;
_curopt = _curitem select 2;
_nbrAmmo = 0;

switch (_type) do {
	case 0:
	{
		if (!isNil "life_curWep_h" && {(life_curWep_h != "")}) then
		{
			if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
				player selectWeapon life_curWep_h;
			};
		}else
		{
			{
				if ( (getNumber(configFile >> "cfgWeapons" >> _x >> "type")) in [1,2,4] ) exitWith
				{
					_curWep = _x;
					player removeItemFromBackpack _curWep;
					player addWeapon _curWep;
				};
			} forEach _curBack;
			if (_curWep != "") exitWith {};
			
			{
				if ( (getNumber(configFile >> "cfgWeapons" >> _x >> "type")) in [1,2,4] ) exitWith
				{
					player removeItemFromVest _x;
					player addWeapon _x;
				};
			} forEach _curVest;
		};
	};
	case 1:
	{
		if((player canAddItemToBackpack _curWep) || (player canAddItemToVest _curWep)) then
		{
			{
				if(_x select 4 == _curWep) exitWith
				{
					_curAmmo = _x select 0;
					_nbrAmmo = _x select 1;
				};
			}forEach _curAmmo;
			player removeWeapon _curWep;
			if(player canAddItemToBackpack _curWep) then {   
			    player addItemToBackpack _curWep;
				player addItemToBackpack _cursil;
				player addItemToBackpack _curopt;
				hint "Ton arme est dans ton sac";
			} else {
				player addItemToVest _curWep;
				player addItemToBackpack _cursil;
				player addItemToVest _curopt;
				hint "Ton arme est dans ta veste";
			};
			
			if (_nbrAmmo > 0) then {player addMagazine [_curAmmo, _nbrAmmo];};
			//player addMagazines [_curmag, _nbrAmmo];
		}else
		{
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
	};
};