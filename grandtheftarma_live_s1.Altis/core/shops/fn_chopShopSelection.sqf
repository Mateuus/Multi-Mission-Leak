/*
	File: fn_chopShopSelection.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Displays the pricing for the currently selected vehicle.
*/
disableSerialization;
private["_control","_selection","_price","_priceTag"];
_control = [_this,0,controlNull,[controlNull]] call GTA_fnc_param;
_selection = [_this,1,-1,[0]] call GTA_fnc_param;

//Error checks
if(isNull _control OR _selection == -1) exitWith {};

_price = _control lbValue _selection;

switch true do
{
	case ("Experienced III" in life_talent_talents) : { _price = round(_price * 1.15); };
	case ("Experienced II" in life_talent_talents) : { _price = round(_price * 1.10); };
	case ("Experienced I" in life_talent_talents) : { _price = round(_price * 1.05); };
	default { _price = _price; };
};

if(playerSide == west) then { _price = 0; };
if(playerSide == independent) then { _price = 0; };

_priceTag = ((findDisplay 39400) displayCtrl 39401);
_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>" +(localize "STR_GNOTF_Price")+ "<t color='#8cff9b'>£%1</t></t>",[(_price)] call life_fnc_numberText];	