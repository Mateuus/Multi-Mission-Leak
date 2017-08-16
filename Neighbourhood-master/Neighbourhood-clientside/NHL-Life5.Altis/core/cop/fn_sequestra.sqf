/*
	File: fn_sequestra.sqf
	Author: Al Morise (Sink)
	Description:
	Rimuove equipaggiamento illegale dalla unit
*/
private ["_cop","_vest","_primaryWeapon","_handgunWeapon","_magazines","_items","_weapAccessories","_weapons","_backpack","_vestItems","_uniformItems","_headgear","_goggles"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isNull _cop) exitWith {};

if (player distance _cop > 5 || !alive player || !alive _cop ) exitWith {};
sleep 3;
_primaryWeapon = primaryWeapon player;
_handgunWeapon = handgunWeapon player;
_vest = vest player;
_headgear = headgear player;
_goggles = goggles player;

if(_primaryWeapon != "") then {
	   _weapAccessories = primaryWeaponItems player;
		{
		    if(_x in life_illegal_stuffs || ((_x in life_all_stuffs) && (!license_civ_gun))) then { player removePrimaryWeaponItem _x; };
		}forEach _weapAccessories;
		
		if(_primaryWeapon in life_illegal_stuffs || ((_primaryWeapon in life_all_stuffs) && (!license_civ_gun))) then {
  		    player removeWeaponGlobal _primaryWeapon;
		};
};

if(_handgunWeapon != "") then {
	   _weapAccessories = handgunItems player;
		{
		    if(_x in life_illegal_stuffs || ((_x in life_all_stuffs) && (!license_civ_gun))) then { player removeHandgunItem _x; };
		}forEach _weapAccessories;
		
		if(_handgunWeapon in life_illegal_stuffs || ((_handgunWeapon in life_all_stuffs) && (!license_civ_gun))) then {
		    player removeWeaponGlobal _handgunWeapon;
		};
};

if(backPack player != "") then {
    _backpack = backpackItems player;
	if(count _backpack > 0) then {
	    {
	        if((_x in life_illegal_stuffs) || ((_x in life_all_stuffs) && (!license_civ_gun))) then {
		         player removeItemFromBackpack _x;
		    };
	    }forEach _backpack;
	};
};

if(_vest != "") then {
    _vestItems = vestItems player;
	if(count _vestItems > 0) then {
	    {
		    if((_x in life_illegal_stuffs) || ((_x in life_all_stuffs) && (!license_civ_gun))) then {
			    player removeItemFromVest _x;
			};
		}forEach _vestItems;
	};
	
    if(_vest in life_illegal_stuffs || (!license_civ_gun && (!(_vest in ["V_RebreatherB","V_RebreatherIR"])))) then {
	    removeVest player;
	};
};

if(uniform player != "") then {
       _uniformItems = uniformItems player;
	   if(count _uniformItems > 0) then {
	       {
		       if((_x in life_illegal_stuffs) || ((_x in life_all_stuffs) && (!license_civ_gun))) then {
			       player removeItemFromUniform _x;
			   };
		   }forEach _uniformItems;
	   };
};

if(_headgear != "") then {
	if(_headgear in life_illegal_stuffs) then {
		removeHeadgear player;
	};
};

if(_goggles != "") then {
	if(_goggles in life_illegal_stuffs) then {
		removeGoggles player;
	};
};

hint format["%1 hat alle illegale Gegenstände entfernt.",name _cop];
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;