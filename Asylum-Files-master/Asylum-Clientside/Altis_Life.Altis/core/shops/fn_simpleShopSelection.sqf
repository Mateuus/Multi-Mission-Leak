/*
	File: fn_simpleShopSelection.sqf
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

_price = _control lbValue _index;
_qty = _item call life_fnc_getQuantity;
if (playerSide in [west,independent]) then { _qty = -1; };

_available = switch (_qty) do
{
	case -1: { "<t color='#00ff00'>Unlimited</t>" };
	case 0: { "<t color='#ff0000'>DEMAND</t>" };
	default { format["<t color='#00ff00'>%1</t>",_qty] };
};

if(_price > life_money) then
{
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Available: %2<br/>Price: <t color='#ff0000'>$%1</t>",[(_price)] call life_fnc_numberText,_available];
}
	else
{
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Available: %2<br/>Price: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText,_available];
};