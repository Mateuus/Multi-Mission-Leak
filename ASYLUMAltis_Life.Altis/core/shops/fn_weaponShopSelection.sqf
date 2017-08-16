/*
	File: fn_weaponShopSelection.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks the weapon & adds the price tag.
*/
private["_control","_index","_priceTag","_price","_item"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _control OR _index == -1) exitWith {closeDialog 0;}; //Bad data

_priceTag = ((findDisplay 39400) displayCtrl 39410);
_availTag = ((findDisplay 39400) displayCtrl 39411);
_magList = ((findDisplay 39400) displayCtrl 39404);
_item = _control lbData _index;

_price = _control lbValue _index;
_qty = _item call life_fnc_getQuantity;
if (playerSide in [west,independent]) then { _qty = -1; };

_available = switch (_qty) do
{
	case -1: { "<t color='#00ff00'>Unlimited</t>" };
	case 0: { "<t color='#ff0000'>DEMAND</t>" };
	default { format["<t color='#00ff00'>%1</t>",_qty] };
};

_availTag ctrlSetStructuredText parseText format ["<t size='0.6'>Available: %1</t>",_available];

if(_price > life_money) then
{
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.6'>Price: <t color='#ff0000'>$%1</t>",[(_price)] call life_fnc_numberText];
}
	else
{
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.6'>Price: <t color='#8cff9b'>$%1</t>",[(_price)] call life_fnc_numberText];
};

if (_control != _magList) then { lbClear _magList; };
_mags = [(configfile >> "CfgWeapons" >> _item), "magazines", []] call BIS_fnc_returnConfigEntry;
if (count _mags > 0) then
{
	_shop = uiNamespace getVariable ["Weapon_Shop", ""];
	_addons = [_shop] call life_fnc_weaponAddons;
	
	{
		_addonEntry = [];
		_mag = _x;
		{
			if (_x select 0 == _mag) then { _addonEntry = _x };
		} forEach _addons;
		if (count _addonEntry == 0 && worldName == "Australia") then {
			_magName = switch(_mag) do
			{
				case "hlc_30Rnd_9x19_SD_MP5": { "30Rnd 9mm Rubber" };
				case "hlc_30rnd_556x45_S": { "30Rnd 5.56 Rubber" };
				case "29rnd_300BLK_STANAG_S": { "29Rnd .300 Rubber" };
				default { nil };
			};
			_addonEntry = [_mag, _magName, floor (_price/20)]
		};
		if (count _addonEntry > 0) then
		{
			_itemInfo = [_x] call life_fnc_fetchCfgDetails;
			_magList lbAdd format["%1",if(isNil {_addonEntry select 1}) then {_itemInfo select 1} else {_addonEntry select 1}];
			_magList lbSetData[(lbSize _magList)-1,_mag];
			_magList lbSetPicture[(lbSize _magList)-1,_itemInfo select 2];
			_magList lbSetValue[(lbSize _magList)-1,_addonEntry select 2];
		};
	} forEach _mags;
	
	_compatibleItems = [];
    {
        _cfgCompatibleItems = _x >> "compatibleItems";
        if (isarray _cfgCompatibleItems) then {
            {
                if !(_x in _compatibleItems) then {_compatibleItems pushBack _x;};
            } forEach getArray _cfgCompatibleItems;
        } else {
            if (isclass _cfgCompatibleItems) then {
                {
                    if (getnumber _x > 0 && {!((configname _x) in _compatibleItems)}) then {_compatibleItems pushBack configname _x};
                } foreach configproperties [_cfgCompatibleItems, "isNumber _x"];
            };
        };
    } foreach configproperties [configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo","isclass _x"];
	
	{
		_addonEntry = [];
		_mag = _x;
		{
			if (_x select 0 == _mag) then { _addonEntry = _x };
		} forEach _addons;
		if (count _addonEntry > 0) then
		{
			_itemInfo = [_x] call life_fnc_fetchCfgDetails;
			_magList lbAdd format["%1",if(isNil {_addonEntry select 1}) then {_itemInfo select 1} else {_addonEntry select 1}];
			_magList lbSetData[(lbSize _magList)-1,_mag];
			_magList lbSetPicture[(lbSize _magList)-1,_itemInfo select 2];
			_magList lbSetValue[(lbSize _magList)-1,_addonEntry select 2];
		};
	} forEach _compatibleItems;
		
};