/*
	File: fn_simpleShopFilter.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Applies the filter selected and changes the list.
*/
private["_itemList","_index","_config","_priceTag","_price"];
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["Weapon_Shop",""];
if(_index == -1 OR _shop == "") exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.
 
uiNamespace setVariable["Weapon_Shop_Filter",_index];
//Setup List Control & Purge it.

_priceTag = ((findDisplay 38400) displayCtrl 38404);
_priceTag ctrlSetStructuredText parseText "";
_itemList = ((findDisplay 38400) displayCtrl 38403);
lbClear _itemList;

switch (_index) do
{
	case 0:
	{
		_config = [_shop] call life_fnc_weaponShopCfg;
		
		if (worldName == "Australia") then
		{
			_addedMags = [];
			_magConfig = [];
			{
				_gun = _x select 0;
				_mags = [(configfile >> "CfgWeapons" >> "RH_m9"), "magazines", []] call BIS_fnc_returnConfigEntry;
				if (count _mags > 0) then
				{
					{
						if !(_x in _addedMags) then
						{
							_magName = switch (_x) do { case "hlc_30Rnd_9x19_SD_MP5": { "30Rnd MP5 Rubber" }; default {nil} };
							_magConfig pushBack [_x,_magName,ceil(_gun / 20)];
							_addedMags pushBack _x;
						};
					} forEach _mags;
				};
			} forEach _config select 1;
			_config set [1, (_config select 1) + _magConfig];
		};
		
		{
			_itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",if(isNil {_x select 1}) then {_itemInfo select 1} else {_x select 1}];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			_price = _x select 2;
			if ((life_configuration select 3) > 0) then
			{
				_price = round (_price + (_price * ((life_configuration select 3) / 100)));
			};
			//_price = _price - (((life_donator * 4) / 100) * _price);
			_qty = (_itemInfo select 0) call life_fnc_getQuantity;
			if (playerSide in [west,independent]) then { _qty = -1; };
			_price = [_itemInfo select 0,_price,_qty] call life_fnc_calcPrice;
			_point = life_capture_list select 0;
			_armsDealer = ((_point select 1) != "0" && (_point select 1) == life_gang && (_point select 2) == 1);
			if (_qty == 0) then { _price = _price * 1.25 };
			_turfOwned = 0;
			{ if (_x select 1 == life_gang) then { _turfOwned = _turfOwned + 1; } } foreach life_turf_list;
			if (_armsDealer && _turfOwned > 1) then { _price = _price * 0.60 }
			else
			{
				if (_armsDealer || _turfOwned > 1) then { _price = _price * 0.75 };
			};
			_itemList lbSetValue[(lbSize _itemList)-1,_price];
		} foreach (_config select 1);
		
		((findDisplay 38400) displayCtrl 38405) ctrlSetText "Buy";
	};
	
	case 1:
	{
		private["_listedItems"];
		_config = [];
		_listedItems = [];
		//Go through weapons
		if(primaryWeapon player != "") then {_config set[count _config,primaryWeapon player]};
		if(secondaryWeapon player != "") then {_config set[count _config,secondaryWeapon player]};
		if(handgunWeapon player != "") then {_config set[count _config,handgunWeapon player]};
		
		//Go through items
		_config = _config + primaryWeaponItems player;
		_config = _config + (assignedItems player);
		_config = _config + (uniformItems player);
		_config = _config + (vestItems player);
		_config = _config + (backPackItems player);
		
		((findDisplay 38400) displayCtrl 38405) ctrlSetText "Sell";
		{
			if(!(_x in _listedItems) && _x != "") then
			{
				_itemInfo = [_x] call life_fnc_fetchCfgDetails;
				_listedItems set[count _listedItems,_x];
				
				_itemCount = {_x == (_itemInfo select 0)} count _config;
				if(_itemCount > 1) then
				{
					_itemList lbAdd format["[%2] %1",_itemInfo select 1,_itemCount];
				}
					else
				{
					_itemList lbAdd format["%1",_itemInfo select 1];
				};
				_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
				_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			};
		} foreach _config;
	};
};

if(isNil {_this select 0}) then {_itemList lbSetCurSel 0;};