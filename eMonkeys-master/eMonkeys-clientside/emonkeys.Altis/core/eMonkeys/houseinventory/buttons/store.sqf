_row = lbCurSel 4503;
_item = lbData [4503, _row];
hint format ["%1",_item];
if (_item == "") exitWith{hint "Sie haben nichts ausgewaehlt!"};

_weaponsCfg = getNumber(missionConfigFile >> "cfgHousing" >> "maxInv_weapons");
_magazinesCfg = getNumber(missionConfigFile >> "cfgHousing" >> "maxInv_magazines");
_itemsCfg = getNumber(missionConfigFile >> "cfgHousing" >> "maxInv_items");
_uniformsCfg = getNumber(missionConfigFile >> "cfgHousing" >> "maxInv_uniforms");
_vestsCfg = getNumber(missionConfigFile >> "cfgHousing" >> "maxInv_vests");
_backbacksCfg = getNumber(missionConfigFile >> "cfgHousing" >> "maxInv_backbacks");
_headgearCfg = getNumber(missionConfigFile >> "cfgHousing" >> "maxInv_headgear");

switch (selected_tab) do
{
	case 0: 
	{
		_weapon_items =[];
		{
			if (_x select 0 == _item) exitWith{_weapon_items=_x};
		} foreach weaponsItems player;
		
		if (count _weapon_items > 1) then
		{
			if ((_weapon_items select 1) == "" && (_weapon_items select 2) == "" && (_weapon_items select 3) == "" && (_weapon_items select 5) == "" &&(count _weapon_items) ==6 ) then
			{
				if (count (dbgear select 0) < _weaponsCfg)then 
				{
					[_item,false] call EMonkeys_fnc_handleItem;
					playergear = [playergear,0,[_item]] call delete_from_2dim;
					dbgear = [dbgear,0,[_item]] call write_in_2dim;
				}
					else
				{
					hint "Dein Waffenlager ist voll";
				};
			}
				else
			{
				hint "Entfernen Sie zuerst alle Attachments";
			};
		};
	};
	case 1: 
	{
		if (count (dbgear select 1) < _magazinesCfg)then 
		{
			[_item,false] call EMonkeys_fnc_handleItem;
			playergear = [playergear,1,[_item]] call delete_from_2dim;
			dbgear = [dbgear,1,[_item]] call write_in_2dim;
		}
			else
		{
			hint "Dein Magazinlager ist voll";
		};
	};
	case 2: 
	{
		if (_item in house_inventar_restricted_items) then
		{
			hint "Sie müssen die Waffe in die Hand nehmen um sie einzulagern.";
		}
			else
		{
			if (count (dbgear select 2) < _itemsCfg)then 
			{
				[_item,false] call EMonkeys_fnc_handleItem;
				playergear = [playergear,2,[_item]] call delete_from_2dim;
				dbgear = [dbgear,2,[_item]] call write_in_2dim;
			}
				else
			{
				hint "Dein Itemlager ist voll";
			};
		};
	};
	case 3: 
	{
		if ((count uniformitems player) == 0) then
		{
			if (count (dbgear select 3) < _uniformsCfg)then 
			{
				removeUniform player;
				playergear = [playergear,3,[_item]] call delete_from_2dim;
				dbgear = [dbgear,3,[_item]] call write_in_2dim;
			}
				else
			{
				hint "Dein Uniformlager ist voll";
			};
		}
			else
		{
			hint "Leeren Sie zuerst ihre Uniform!";
		};
	};
	case 4: 
	{
		if ((count vestitems player) == 0) then
		{
			if (count (dbgear select 4) < _vestsCfg)then 
			{
				removeVest player;
				playergear = [playergear,4,[_item]] call delete_from_2dim;
				dbgear = [dbgear,4,[_item]] call write_in_2dim;
			}
				else
			{
				hint "Dein Westenlager ist voll";
			};
		}
			else
		{
			hint "Leeren Sie zuerst ihre Weste!";
		};
	};
	case 5: 
	{
		if ((count backpackitems player) == 0) then
		{
			if (count (dbgear select 5) < _backbacksCfg)then 
			{
				removeBackpack player;
				playergear = [playergear,5,[_item]] call delete_from_2dim;
				dbgear = [dbgear,5,[_item]] call write_in_2dim;
			}
				else
			{
				hint "Dein Rucksacklager ist voll";
			};	
		}
			else
		{
			hint "Leeren Sie zuerst ihren Rucksack!";
		};
	};
	case 6: 
	{
		if (count (dbgear select 6) < _headgearCfg)then 
		{
			removeHeadgear player;
			playergear = [playergear,6,[_item]] call delete_from_2dim;
			dbgear = [dbgear,6,[_item]] call write_in_2dim;
		}
			else
		{
			hint "Dein Mützenlager ist voll";
		};
	};
};
[selected_tab,playergear,dbgear] execvm "core\eMonkeys\houseinventory\buttons\houseinventory_select.sqf";