/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Applies weapon/gear to player
*/
disableSerialization;
private["_addToUniform","_className","_items","_addToBackpack","_kindOf","_isWeapon","_configEntryBase","_configEntry","_itemInfo","_addToVest","_onWeapon"];

_className = [_this,0,"",[""]] call BIS_fnc_param;
_addToBackpack = [_this,1,false,[false]] call BIS_fnc_param;
_addToVest = [_this,2,false,[false]] call BIS_fnc_param;
_onWeapon = [_this,3,false,[false]] call BIS_fnc_param;
_addToUniform = [_this,4,false,[false]] call BIS_fnc_param;

_isWeapon = false;
_action = false;
_itemInfo = -1;

if(_className == "") exitWith {};//NFI

//systemchat format ["Equipping %1",_className];


_type = if(alive player)then
{
	switch (true) do
	{
		case (isClass (configFile >> "CfgMagazines" >> _className)) : {"CfgMagazines";};
		case (isClass (configFile >> "CfgWeapons" >> _className)) : {"CfgWeapons";};
		case (isClass (configFile >> "CfgVehicles" >> _className)) : {"CfgVehicles";};
		case (isClass (configFile >> "CfgGlasses" >> _className)) : {"CfgGlasses";};
	};
};

//systemchat format ["%1 || %2",_type,_className];
switch(_type)do
	{
	case "CfgGlasses":
		{
			if(_addToBackpack)exitwith
				{
				player addItemToBackpack _classname;
				};
			if(_addToVest)exitwith
				{
				player addItemToVest _classname;
				};
			if(goggles player != "") then
				{
				removeGoggles player;
				};
				player addGoggles _className;
		};
	case "CfgVehicles":
		{
			if(backpack player != "") then
				{
					_items = (backpackItems player);
					removeBackpack player;
				};
				player addBackpack _className;
				
				clearAllItemsFromBackpack player;
				if(!isNil {_items}) then 
				{ 
					{[_x,true] spawn DS_fnc_equipItem; } foreach _items;
				};
		};
	case "CfgMagazines":
		{
			if(_addToUniform)exitwith
				{
				player addItemToUniform _className;
				};
			if(_addToBackpack)exitwith
				{
				player addItemToBackpack _className;
				};
			if(_addToVest)exitwith
				{
				player addItemToVest _classname;
				};
			player addMagazine _className;
		};
	case "CfgWeapons":
		{
			if(_addToBackpack)exitwith
				{
				player addItemToBackpack _className;
				};
			if(_addToVest)exitwith
				{
				player addItemToVest _classname;
				};
			if(_onWeapon)exitwith
				{
				_type = [_className,101] call DS_fnc_attachType;
				//systemchat format ["SCOPE DEBUG :: Class = %1 || Type = %2",_className,_type];
				switch(_type)do
					{
					case 0: {player addPrimaryWeaponItem _className};
					case 2: {player addSecondaryWeaponItem _className};
					case 3: {player addHandgunItem _className};
					};
				};
			_configEntryBase = configFile >> _type >> _className;
			_configEntry = getNumber(_configEntryBase >> "type");
			
			if(_configEntry in [1,2,4,5,4096])then
				{
				if(_configEntry == 4096)then
					{
					if(_configEntry == -1)then
						{
						_isWeapon = true;
						};
					}
					else
					{
					_isweapon = true;
					};
				};
			
			if(_isWeapon)exitwith
				{
				player addWeapon _className;
				};
				
			if(isClass (_configEntryBase >> "ItemInfo")) then
				{
					_itemInfo = getNumber(_configEntryBase >> "ItemInfo" >> "Type");
				};
			//systemchat format ["%1",_itemInfo];
			switch (_itemInfo) do
				{
				case 0:
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};
					player addItem _className;
					if(!(_className in (assignedItems player)))then
						{
						player assignItem _className;
						};
					};
				case -1:
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};
					player addWeapon _className;
					if(!(_className in (assignedItems player)))then
						{
						player addWeapon _className;
						};
					};
				case 605:
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};	
					if(headGear player == _className)then
						{
						player addItem _className;
						}
						else
						{
						if(headGear player != "")then
							{
							removeHeadGear player;
							};
						player addHeadGear _className;
						};
					};
				case 801:
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};
					if(playerside == civilian)then
						{
						if(uniform player == _className)then
							{
							player addItem _className;
							}
							else
							{
							if(uniform player != "")then
								{
								_items = uniformItems player;
								removeUniform player;
								};
								
								player addUniform _className;
								
								if(!isNil "_items")then
									{
									{player addItemToUniform _x}forEach _items;
									};
							};
						}
						else
						{
						if(uniform player != "")then
							{
							_items = uniformItems player;
							removeUniform player;
							};
						if(!(player isUniformAllowed _className))then
							{
							player forceAddUniform _className;
							}
							else
							{
							player addUniform _className;
							};
						if(!isNil "_items")then
							{
								{player addItemToUniform _x}forEach _items;
							};
						};
					};
				case 701:
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};
					if(vest player == _className)then
						{
						player addItem _className;
						}
						else
						{
						if(vest player != "")then
							{
							_items = vestItems player;
							removeVest player;
							};
						player addVest _className;
						if(!isNil "_items")then
							{
							{[_x,false,true] spawn DS_fnc_equipItem; }foreach _items;
							};
						};
					};
				case 201:
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};
					private ["_type"];
					_type = [_className,201] call DS_fnc_attachType;
					if(_onWeapon)then
						{
						switch(_type)do
							{
							case 1: {player addPrimaryWeaponItem _className};
							case 2: {player addSecondaryWeaponItem _className};
							case 3: {player addHandgunItem _className};
							};
						}
						else
						{
						private ["_weaponItems","_action","_slotInUse"];
						_weaponItems = switch(_type) do{case 1:{primaryWeaponItems player}; case 2:{secondaryWeaponItems player}; case 3:{handGunItems player};default {["","",""]};};
						_slotInUse = false;
						//systemchat format ["Type = %2 || WeaponItems %1",((_weaponItems select 0)),_type];
						if((_weaponItems select 0) != "")then{_slotInUse = true};

						if(_slotInUse)then
							{
							_action = 
								[
								"This weapon already has an item attached, where would you like to add this item",
								"Attachment slot in use",
								"Weapon",
								"Inventory"
								] call BIS_fnc_guiMessage;
							if(_action)then
								{
								switch(_type)do
									{
									case 1: {player addPrimaryWeaponItem _className;};
									case 2: {player addSecondaryWeaponItem _className;};
									case 3: {player addHandGunItem _className;};
									//default {player addItem _className;}:
									};
								if(!(_case in [1,2,3]))then{player addItem _className};
								};
								if(!_action)then
								{
								player addItem _className;
								};
							}
							else
							{
							switch(_type) do 
								{
								case 1: {player addPrimaryWeaponItem _className;};
								case 2: {player addSecondaryWeaponItem _className;};
								case 3: {player addHandgunItem _className;};
								default {player addItem _className;};
								};
							};
						};
					};
				case 301:
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};
					private ["_type"];
					_type = [_className,301] call DS_fnc_attachType;
					if(_onWeapon)then
						{
						switch(_type)do
							{
							case 1: {player addPrimaryWeaponItem _className};
							case 2: {player addSecondaryWeaponItem _className};
							case 3: {player addHandgunItem _className};
							};
						}
						else
						{
						private ["_weaponItems","_action","_slotInUse"];
						_weaponItems = switch(_type) do{case 1:{primaryWeaponItems player}; case 2:{secondaryWeaponItems player}; case 3:{handGunItems player};default {["","",""]};};
						_slotInUse = false;
						
						if((_weaponsItems select 0) != "")then{_slotInUse = true};
						
						if(_slotInUse)then
							{
							_action = 
								[
								"This weapon already has an item attached, where you like to add this item",
								"Attachment slot in use",
								"Weapon",
								"Inventory"
								] call BIS_fnc_guiMessage;
							if(_action)then
								{
								switch(_type)do
									{
									case 1: {player addPrimaryWeaponItem _className};
									case 2: {player addSecondaryWeaponItem _className};
									case 3: {player addHandGunItem _className};
									//default {player addItem _className}:
									};
								if(!(_case in [1,2,3]))then{player addItem _className};
								};
								if(!_action)then
								{
								player addItem _className;
								};
							}
							else
							{
							switch(_type) do 
								{
								case 1: {player addPrimaryWeaponItem _className;};
								case 2: {player addSecondaryWeaponItem _className;};
								case 3: {player addHandgunItem _className;};
								default {player addItem _className;};
								};
							};
						};
					};
				case 101:
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};
					private ["_type"];
					_type = [_className,101] call DS_fnc_attachType;
					if(_onWeapon)then
						{
						switch(_type)do
							{
							case 1: {player addPrimaryWeaponItem _className};
							case 2: {player addSecondaryWeaponItem _className};
							case 3: {player addHandgunItem _className};
							};
						}
						else
						{
						private ["_weaponItems","_action","_slotInUse"];
						_weaponItems = switch(_type) do{case 1:{primaryWeaponItems player}; case 2:{secondaryWeaponItems player}; case 3:{handGunItems player};default {["","",""]};};
						_slotInUse = false;
						
						if((_weaponItems select 0) != "")then{_slotInUse = true};
						
						if(_slotInUse)then
							{
							_action = 
								[
								"This weapon already has an item attached, where you like to add this item",
								"Attachment slot in use",
								"Weapon",
								"Inventory"
								] call BIS_fnc_guiMessage;
							if(_action)then
								{
								switch(_type)do
									{
									case 1: {player addPrimaryWeaponItem _className};
									case 2: {player addSecondaryWeaponItem _className};
									case 3: {player addHandGunItem _className};
									//default {player addItem _className}:
									};
								if(!(_case in [1,2,3]))then{player addItem _className};
								}
								else
								{
								player addItem _className;
								};
							}
							else
							{
							switch(_type) do 
								{
								case 1: {player addPrimaryWeaponItem _className;};
								case 2: {player addSecondaryWeaponItem _className;};
								case 3: {player addHandgunItem _className;};
								default {player addItem _className;};
								};
							};
						};
					};
				case 621:
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};
					player addItem _className;
					player assignItem _className;
					};
				case 616:
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};
					player addItem _className;
					player assignItem _className;
					};
				default 	
					{
					if(_addToBackpack)exitwith
						{
						player addItemToBackpack _className;
						};
					player addItem _className;
					};
				};
		};
	};	










