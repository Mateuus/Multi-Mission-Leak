/*
	File: fn_changeClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the clothing store to show a 'preview' of the piece of clothing.
*/
disableSerialization;
private["_control","_selection","_data","_price","_totalPrice"];
_control = (_this select 0) select 0;
_selection = (_this select 0) select 1;
_price = (findDisplay 3100) displayCtrl 3102;
if(_selection == -1) exitWith {["Oh nein!",localize "STR_Shop_NoSelection","#ff1000","#ffffff",4] call life_fnc_texttiles;};
if(isNull _control) exitWith {["Oh nein!",localize "STR_Shop_NoDisplay","#ff1000","#ffffff",4] call life_fnc_texttiles;};
if(life_cMenu_lock) exitWith {};
life_cMenu_lock = true;

life_clothing_purchase set[life_clothing_filter,(_control lbValue _selection)];

_data = _control lbData _selection;


[_data,true,nil,nil,nil,nil,nil,true] call life_fnc_handleItem; 

life_cMenu_lock = false;

_totalPrice = 0;
{
	if(_x != -1) then
	{
		_totalPrice = _totalPrice + _x;
	};
} foreach life_clothing_purchase;

_price ctrlSetStructuredText parseText format ["%1 <t size='0.8' color='#8cff9b'>%2€</t><br>%3 <t size='0.8' color='#8cff9b'>%4€</t>",(localize "STR_GNOTF_Price"),[(_control lbValue _selection)] call life_fnc_numberText,(localize "STR_Shop_Total"),[_totalPrice] call life_fnc_numberText];

[] call life_fnc_updateClothing;