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

_priceTag = ((findDisplay 38400) displayCtrl 38404);
_item = _control lbData _index;
if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	_iS = [_item,(call EMonkeys_weapon_shop_array)] call TON_fnc_index;
	if(_iS == -1) then 
	{
		_price = 0;
	}
		else
	{
		_price = ((call EMonkeys_weapon_shop_array) select _iS) select 1;
	};
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Preis: <t color='#8cff9b'>%1€</t></t>",[(_price)] call EMonkeys_fnc_numberText];
	_control lbSetValue[_index,_price];
}
	else
{
	_price = _control lbValue _index;
	if(_price > EMonkeys_c164) then
	{
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Preis: <t color='#ff0000'>%1€</t><br/>Dir fehlt: <t color='#8cff9b'>%2€</t></t>",[(_price)] call EMonkeys_fnc_numberText,[(_price - EMonkeys_c164)] call EMonkeys_fnc_numberText];
	}
		else
	{
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Preis: <t color='#8cff9b'>%1€</t></t>",[(_price)] call EMonkeys_fnc_numberText];
	};
};