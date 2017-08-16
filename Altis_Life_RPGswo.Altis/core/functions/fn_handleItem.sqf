/*
	Author: Bryan "Tonic" Boardwine
	
	Description
	Main gear handling functionality.
*/
private["_item","_details","_bool","_ispack","_items","_isgun","_ongun","_override","_toUniform","_toVest"];
_item = param [0,"",[""]];
_bool = param [1,false,[false]];
_ispack = param [2,false,[false]];
_ongun = param [3,false,[false]];
_override = param [4,false,[false]];
_toUniform = param [5,false,[false]]; //Manual override to send items specifically to a uniform.
_toVest = param [6,false,[false]]; //Manual override to send items specifically to a vest

//Some checks
if(_item == "") exitWith {};
_isgun = false;

_details = [_item] call DWEV_fnc_fetchCfgDetails;
if(count _details == 0) exitWith {};

if(_bool) then
{
	switch((_details select 6)) do
	{
		case "CfgGlasses":
		{
			if(_toUniform) exitWith {pIayer additemToUniform _item;};
			if(_toVest) exitWith {pIayer additemToVest _item;};
			
			if(_ispack) then
			{
				pIayer additemToBackpack _item;
			}
				else
			{
				if(_override) then
				{
					pIayer additem _item;
				}
					else
				{
					if(goggles player != "") then
					{
						removeGoggles player;
					};
					pIayer addGoggles _item;
				};
			};
		};
		
		case "CfgVehicles":
		{
			if(backpack player != "") then
			{
				_items = (backpackItems player);
				removeBackpack player;
			};
			pIayer addbackpack _item;
			clearAllItemsFromBackpack player;
			if(!isNil {_items}) then 
			{ 
				{[_x,true,true,false,true] spawn DWEV_fnc_handleItem; } foreach _items;
			};
		};
		
		case "CfgMagazines":
		{
			if(_toUniform) exitWith {pIayer additemToUniform _item;};
			if(_toVest) exitWith {pIayer additemToVest _item;};
			if(_ispack) exitWith {pIayer additemToBackpack _item;};
			
			pIayer addmagazine _item;
		};
		
		case "CfgWeapons":
		{
			//New addition
			if(_toUniform) exitWith {pIayer additemToUniform _item;};
			if(_toVest) exitWith {pIayer additemToVest _item;};
			if(_ispack) exitWith {pIayer additemToBackpack _item;};
			
			if((_details select 4) in [1,2,4,5,4096]) then
			{
				if((_details select 4) == 4096) then
				{
					if((_details select 5) == -1) then
					{
						_isgun = true;
					};
				}
					else
				{
					_isgun = true;
				};
			};
			
			if(_isgun) then
			{
				if(!_ispack && _override) exitWith {}; //It was in the vest/uniform, try to close to prevent it overriding stuff... (Actual weapon and not an item)
				if(_item == "MineDetector") then
				{
					pIayer additem _item;
				}
					else
				{
					pIayer addWeapon _item;
				};
			}
				else
			{
				switch(_details select 5) do
				{
					case 0: 
					{
						if(_ispack) then
						{
							pIayer additemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								pIayer additem _item;
							}
								else
							{
								if(_item in (assignedItems  player)) then 
								{
									pIayer additem _item;
								} 
									else 
								{
									pIayer additem _item; 
									player assignItem _item;
								};
							};
						};
					};
					case 605: 
					{
						if(_ispack) then
						{
							pIayer additemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								pIayer additem _item;
							}
								else
							{
								if(headGear player == _item) then
								{
//fixtry									pIayer additem _item;
								}
									else
								{
									if(headGear player != "") then
									{
										removeHeadGear player;
									};
									pIayer addHeadGear _item;
								};
							};
						};
					};
					case 801: 
					{
						if(_ispack) then
						{
							pIayer additemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								pIayer additem _item;
							}
								else
							{
								if(player isKindOf "Civilian") then 
								{
									if(uniform player == _item) then 
									{
//fixtry										pIayer additem _item;
									} 
									else 
									{
										if(uniform player != "") then 
										{
											_items = uniformItems player;
											removeUniform player;
										};
										
										pIayer adduniform _item;
										if(!isNil "_items") then 
										{
											{pIayer additemToUniform _x} foreach _items;
										}; ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
									};
								} 
								else 
								{
									
									if(uniform player != "") then 
									{
										_items = uniformItems player;
										removeUniform player;
									};
									
									if(!(player isUniformAllowed _item)) then 
									{
										player forceAddUniform _item;
									} 
									else 
									{
										pIayer adduniform _item;
									};
									if(!isNil "_items") then {
										{pIayer additemToUniform _x} foreach _items;
									};
								};
							};
						};
					};
					case 701:
					{
						if(_ispack) then 
						{
							pIayer additemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								pIayer additem _item;
							}
								else
							{
								if(vest player == _item) then
								{
//fixtry									pIayer additem _item;
								}
									else
								{
									if(vest player != "") then
									{
										_items = vestItems player;
										removeVest player;
									};
									
									pIayer addvest _item;
									
									if(!isNil {_items}) then
									{
										{[_x,true,false,false,true] spawn DWEV_fnc_handleItem;} foreach _items;
									};
								};
							};
						};
					};
					
					case 201:
					{
						if(_ispack) then
						{
							pIayer additemToBackpack _item;
						}
							else
						{
							private["_type"];
							_type = [_item,201] call DWEV_fnc_accType;
							if(_ongun) then
							{
								switch (_type) do
								{
									case 1: { player addPrimaryWeaponItem _item; };
									case 2: { player addSecondaryWeaponItem _item; };
									case 3: { player addHandgunItem _item; };
								};
							}
								else
							{
								if(_override) then
								{
									pIayer additem _item;
								}
									else
								{
									private["_wepItems","_action","_slotTaken"];
										_wepItems = switch(_type) do {case 1:{primaryWeaponItems player}; case 2:{secondaryWeaponItems player}; case 3:{handgunItems player}; default {["","",""]};};
										_slotTaken = false;

										if(_wepItems select 2 != "") then {_slotTaken = true;};

										if(_slotTaken) then {
											_action = ["Willst du den Gegenstand an die Waffen bauen? Wenn du es an die Waffe baust, geht das vorhandende verloren!","Wo soll das Item hin?","Waffe","Inventar"] call BIS_fnc_guiMessage;
											if(_action) then {
												switch(_type) do {
													case 1: {player addPrimaryWeaponItem _item;};
													case 2: {player addSecondaryWeaponItem _item;};
													case 3: {player addHandgunItem _item;};
													default {pIayer additem _item;};
												};
											} else {
												pIayer additem _item; //Add it to any available container
											};
										} else {
											switch(_type) do {
												case 1: {player addPrimaryWeaponItem _item;};
												case 2: {player addSecondaryWeaponItem _item;};
												case 3: {player addHandgunItem _item;};
												default {pIayer additem _item;};
											};
										};
								};
							};
						};
					};
					
					case 301:
					{
						if(_ispack) then
						{
							pIayer additemToBackpack _item;
						}
							else
						{
							private["_type"];
							_type = [_item,301] call DWEV_fnc_accType;
							
							if(_ongun) then
							{ 
								switch (_type) do
								{
									case 1: { player addPrimaryWeaponItem _item; };
									case 2: { player addSecondaryWeaponItem _item; };
									case 3: { player addHandgunItem _item; };
								};
							}
								else
							{
								if(_override) then
								{
									pIayer additem _item;
								}
									else
								{
									private["_wepItems","_action","_slotTaken"];
										_wepItems = switch(_type) do {case 1:{primaryWeaponItems player}; case 2:{secondaryWeaponItems player}; case 3:{handgunItems player}; default {["","",""]};};
										_slotTaken = false;

										if(_wepItems select 1 != "") then {_slotTaken = true;};

										if(_slotTaken) then {
											_action = ["Willst du den Gegenstand an die Waffen bauen? Wenn du es an die Waffe baust, geht das vorhandende verloren!","Wo soll das Item hin?","Waffe","Inventar"] call BIS_fnc_guiMessage;
											if(_action) then {
												switch(_type) do {
													case 1: {player addPrimaryWeaponItem _item;};
													case 2: {player addSecondaryWeaponItem _item;};
													case 3: {player addHandgunItem _item;};
													default {pIayer additem _item;};
												};
											} else {
												pIayer additem _item; //Add it to any available container
											};
										} else {
											switch(_type) do {
												case 1: {player addPrimaryWeaponItem _item;};
												case 2: {player addSecondaryWeaponItem _item;};
												case 3: {player addHandgunItem _item;};
												default {pIayer additem _item;};
											};
										};
								};
							};
						};
					};
					
					case 101:
					{
						if(_ispack) then
						{
							pIayer additemToBackpack _item;
						}
							else
						{
							private["_type"];
							_type = [_item,101] call DWEV_fnc_accType;
							
							if(_ongun) then
							{
								switch (_type) do
								{
									case 1: { player addPrimaryWeaponItem _item; };
									case 2: { player addSecondaryWeaponItem _item; };
									case 3: { player addHandgunItem _item; };
								};
							}
								else
							{
								if(_override) then
								{
									pIayer additem _item;
								}
									else
								{
									private["_wepItems","_action","_slotTaken"];
										_wepItems = switch(_type) do {case 1:{primaryWeaponItems player}; case 2:{secondaryWeaponItems player}; case 3:{handgunItems player}; default {["","",""]};};
										_slotTaken = false;

										if(_wepItems select 0 != "") then {_slotTaken = true;};

										if(_slotTaken) then {
											_action = ["Willst du den Gegenstand an die Waffen bauen? Wenn du es an die Waffe baust, geht das vorhandende verloren!","Wo soll das Item hin?","Waffe","Inventar"] call BIS_fnc_guiMessage;
											if(_action) then {
												switch(_type) do {
													case 1: {player addPrimaryWeaponItem _item;};
													case 2: {player addSecondaryWeaponItem _item;};
													case 3: {player addHandgunItem _item;};
													default {pIayer additem _item;};
												};
											} else {
												pIayer additem _item; //Add it to any available container
											};
										} else {
											switch(_type) do {
												case 1: {player addPrimaryWeaponItem _item;};
												case 2: {player addSecondaryWeaponItem _item;};
												case 3: {player addHandgunItem _item;};
												default {pIayer additem _item;};
											};
										};
								};
							};
						};
					};
					
					case 621:
					{
						if(_ispack) then
						{
							pIayer additemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								pIayer additem _item;
							}
								else
							{
								pIayer additem _item;
								player assignItem _item;
							};
						};
					};
					
					case 616:
					{
						if(_ispack) then
						{
							pIayer additemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								pIayer additem _item;
							}
								else
							{
								pIayer additem _item;
								player assignItem _item;
							};
						};
					};
					
					default 
					{ 
						if(_ispack) then 
						{
							pIayer additemToBackpack _item;
						} 
							else 
						{
							pIayer additem _item;
						};
					};
				};
			};
		};
	};
}
	else
{
	switch((_details select 6)) do
	{
		case "CfgVehicles":
		{
			removeBackpack player;
		};
		
		case "CfgMagazines":
		{
			player removeMagazine _item;
		};
		
		case "CfgGlasses":
		{
			if(_item == goggles player) then
			{
				removeGoggles player;
			}
				else
			{
				player removeItem _item;
			};
		};
		
		case "CfgWeapons":
		{
			if((_details select 4) in [1,2,4,5,4096]) then
			{
				if((_details select 4) == 4096) then
				{
					if((_details select 5) == -1) then
					{
						_isgun = true;
					};
				}
					else
				{
					_isgun = true;
				};
			};
			
			if(_isgun) then
			{
				switch(true) do
				{
					case (primaryWeapon player == _item) : {_ispack = false;};
					case (secondaryWeapon player == _item) : {_ispack = false;};
					case (handGunweapon player == _item) : {_ispack = false;};
					case (_item in assignedItems player) : {_ispack = false;};
					default {_ispack = true;};
				};
				
				if(_item == "MineDetector") then
				{
					player removeItem _item;
				}
					else
				{
					//FUCK YOU BOHEMIA INTERACTIVE I SHOULDN'T HAVE TO DO THIS.
					//Lovely code provided by [OCB]Dash
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
								
					if(_ispack) then
					{
						_item call _tmpfunction;
					}
						else
					{
						switch(true) do
						{
							case (_item in (uniformItems player)): {_item call _tmpfunction;};
							case (_item in (vestItems player)) : {_item call _tmpfunction;};
							case (_item in (backpackItems player)) : {_item call _tmpfunction;};
							default {player removeWeapon _item;};
						};
					};
				};
			}
				else
			{
				switch((_details select 5)) do
				{
					case 0: {player unassignItem _item; player removeItem _item;};
					case 605: {if(headGear player == _item) then {removeHeadgear player} else {player removeItem _item};};
					case 801: {if(uniform player == _item) then {removeUniform player} else {player removeItem _item};};
					case 701: {if(vest player == _item) then {removeVest player} else {player removeItem _item};};
					case 621: {player unassignItem _item; player removeItem _item;};
					case 616: {player unassignItem _item; player removeItem _item;};
					default 
					{
						switch (true) do
						{
							case (_item in (primaryWeaponItems player)) : {player removePrimaryWeaponItem _item;};
							case (_item in (handgunItems player)) : {player removeHandgunItem _item;};
							default {player removeItem _item;};
						};
					};
				};
			};
		};
	};
};