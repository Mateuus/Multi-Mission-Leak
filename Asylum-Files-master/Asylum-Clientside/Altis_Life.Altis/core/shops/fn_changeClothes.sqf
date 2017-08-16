/*
	File: fn_changeClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the clothing store to show a 'preview' of the piece of clothing.
*/
disableSerialization;
private["_control","_selection","_data","_price","_total","_totalPrice","_cost"];
_control = (_this select 0) select 0;
_selection = (_this select 0) select 1;
_price = (findDisplay 3100) displayCtrl 3102;
_total = (findDisplay 3100) displayCtrl 3106;
if(_selection == -1) exitWith {hint "No selection";};
if(isNull _control) exitWith {hint "No Display"};

life_clothing_purchase set[life_clothing_filter,(_control lbValue _selection)];

_data = call compile (_control lbData _selection);
_cost = _control lbValue _selection;

if (_data select 0 == uniform player) then { removeUniform player; };
if (life_clothing_store != "faces") then { [_control lbData _selection,true] call life_fnc_handleItem; }
else { player setFace (_data select 0)};
_price ctrlSetStructuredText parseText format ["Price: <t color='#8cff9b'>$%1</t>",[_cost] call life_fnc_numberText];

_totalPrice = 0;
{
	if(_x != -1) then
	{
		_totalPrice = _totalPrice + _x;
	};
} foreach life_clothing_purchase;

_total ctrlSetStructuredText parseText format ["Total: <t color='#8cff9b'>$%1</t>",[_totalPrice] call life_fnc_numberText];

[] call life_fnc_equipGear;