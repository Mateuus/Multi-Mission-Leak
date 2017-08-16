/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Removes the given item from a player
*/
private ["_item","_type","_config","_gun","_inPack","_complete"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_gun = false;
_complete = false;
switch (true) do
	{
		case (isClass (configFile >> "CfgMagazines" >> _item)) : {_type = "CfgMagazines";};
		case (isClass (configFile >> "CfgWeapons" >> _item)) : {_type = "CfgWeapons";};
		case (isClass (configFile >> "CfgVehicles" >> _item)) : {_type = "CfgVehicles";};
		case (isClass (configFile >> "CfgGlasses" >> _item)) : {_type = "CfgGlasses";};
	};
_config = configFile >> _type >> _item;
//systemchat format ["Item Name %1 || Type = %3 || Item config %2 || Config # %4 || Other # %5",_item,_config,_type,(getNumber(_config >> "type")),(getNumber(_config >> "ItemInfo" >> "Type"))];
switch(_type)do
	{
	case "CfgVehicles":
		{
		if(backpack player == _item)then
			{
			removeBackpack player;
			_complete = true;
			};
		};
	case "CfgMagazines":
		{
		if(_item in magazines player)then
			{
			player removeMagazine _item;
			_complete = true;
			};
		};
	case "CfgGlasses":
		{
		if(_item in (goggles player))then
			{
			removeGoggles player;
			_complete = true;
			}
			else
			{
			player removeItem _item;
			_complete = true;
			};
		};
	case "CfgWeapons":
		{
		if(getNumber(_config >> "type") in [1,2,4,5,4096])then
			{
			if(getNumber(_config >> "type") isEqualTo 4096)then
				{
				if(getNumber(_config >> "ItemInfo" >> "Type") isEqualTo -1)then
					{
					_gun = true;
					};
				}
				else
				{
				_gun = true;
				};
			};
		if(_gun)then
			{
			switch(true)do
				{
				case (primaryWeapon player isEqualTo _item):{_inPack = false};
				case (secondaryWeapon player isEqualTo _item):{_inPack = false};
				case (handgunWeapon player isEqualTo _item):{_inPack = false};
				case (_item in assignedItems player):{_inPack = false};
				default {_inpack = true};
				};
				private["_tmpfunction"];
					_tmpfunction = {
						private["_tWeapons","_tWeaponCount"];
						switch(true) do {
							case (_this in (uniformItems player)): {
								_tWeapons = (getWeaponCargo (uniformContainer player)) select 0;
								_tWeaponCount = (getWeaponCargo (uniformContainer  player)) select 1;

								clearWeaponCargo (uniformContainer player);
								{
									_numVestWeps = _tWeaponCount select _forEachIndex;
									if(_x == _this) then
									{
										_numVestWeps = _numVestWeps - 1;                        
									};
									(uniformContainer player) addWeaponCargo [ _x,_numVestWeps];
								}forEach _tWeapons;
							};

							case (_this in (vestItems player)): {
								_tWeapons = (getWeaponCargo (vestContainer player)) select 0;
								_tWeaponCount = (getWeaponCargo (vestContainer  player)) select 1;

								clearWeaponCargo (vestContainer player);
								{
									_numVestWeps = _tWeaponCount select _forEachIndex;
									if(_x == _this) then
									{
										_numVestWeps = _numVestWeps - 1;                        
									};
									(vestContainer player) addWeaponCargo [ _x,_numVestWeps];
								}forEach _tWeapons;
							};

							case (_this in (backpackItems player)): {
								_tWeapons = (getWeaponCargo (backpackContainer player)) select 0;
								_tWeaponCount = (getWeaponCargo (backpackContainer  player)) select 1;

								clearWeaponCargo (backpackContainer player);
								{
									_numVestWeps = _tWeaponCount select _forEachIndex;
									if(_x == _this) then
									{
										_numVestWeps = _numVestWeps - 1;                        
									};
									(backpackContainer player) addWeaponCargo [ _x,_numVestWeps];
								}forEach _tWeapons;
							};
						};
					};
				if(_inPack)then
					{
					_item call _tmpfunction;
					}
					else
					{
					switch(true)do
						{
						case (_item in (uniformItems player)):{_item call _tmpfunction};
						case (_item in (vestItems player)):{_item call _tmpfunction};
						case (_item in (backpackItems player)):{_item call _tmpfunctions};
						default {player removeWeapon _item;_complete = true;};
						};
					};
			}
			else
			{
			switch(getNumber(_config >> "ItemInfo" >> "Type"))do
					{
					case 0: {if(_item in (assignedItems player))then{player unassignItem _item; player removeItem _item;_complete = true;} else {if(_item in (backpackItems player))then{player removeItem _item;_complete = true;}else{if(_item in (uniformItems player))then{player removeItem _item;_complete = true;}else{if(_item in (vestItems player))then{player removeItem _item;_complete = true;};};};};};
					case 605: {if(headGear player == _item)then{removeHeadgear player;;_complete = true;} else {if(_item in (backpackItems player))then{player removeItem _item;_complete = true;}else{if(_item in (uniformItems player))then{player removeItem _item;_complete = true;}else{if(_item in (vestItems player))then{player removeItem _item;_complete = true;};};};};};
					case 801: {if(uniform player == _item)then{removeUniform player;;_complete = true;} else {if(_item in (backpackItems player))then{player removeItem _item;_complete = true;}else{if(_item in (uniformItems player))then{player removeItem _item;_complete = true;}else{if(_item in (vestItems player))then{player removeItem _item;_complete = true;};};};};};
					case 701: {if(vest player == _item)then{removeVest player;;_complete = true;} else {if(_item in (backpackItems player))then{player removeItem _item;_complete = true;}else{if(_item in (uniformItems player))then{player removeItem _item;_complete = true;}else{if(_item in (vestItems player))then{player removeItem _item;_complete = true;};};};};};
					case 621: {if(_item in (assignedItems player))then{player unassignItem _item; player removeItem _item;_complete = true;} else {if(_item in (backpackItems player))then{player removeItem _item;_complete = true;}else{if(_item in (uniformItems player))then{player removeItem _item;_complete = true;}else{if(_item in (vestItems player))then{player removeItem _item;_complete = true;};};};};};
					case 616: {if(_item in (assignedItems player))then{player unassignItem _item; player removeItem _item;_complete = true;} else {if(_item in (backpackItems player))then{player removeItem _item;_complete = true;}else{if(_item in (uniformItems player))then{player removeItem _item;_complete = true;}else{if(_item in (vestItems player))then{player removeItem _item;_complete = true;};};};};};
					default 
						{
						switch (true) do
							{
							case (_item in (primaryWeaponItems player)) : {player removePrimaryWeaponItem _item;_complete = true;};
							case (_item in (handgunItems player)) : {player removeHandgunItem _item;_complete = true;};
							default {player removeItem _item;_complete = true;};
							};
						};
					};
			};
		};	
	};
_complete;













/*
case 0: {if(_item in (assignedItems player))then
			{
			player unassignItem _item; 
			player removeItem _item;
			_complete = true;
			} 
			else 
			{
			if(_item in (backpackItems player))then
				{
				player removeItem _item;
				_complete = true;
				}
				else
				{
				if(_item in (uniformItems player))then
					{
					player removeItem _item;
					_complete = true;
					}
					else
					{
					if(_item in (vestItems player))then
						{
						player removeItem _item;
						_complete = true;
						};
					};
				};
			};
		};
*/


