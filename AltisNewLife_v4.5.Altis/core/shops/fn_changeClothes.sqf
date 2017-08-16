disableSerialization;
private["_control","_selection","_data","_price","_total","_totalPrice"];
_control = (_this select 0) select 0;
_selection = (_this select 0) select 1;
_price = (findDisplay 3100) displayCtrl 3102;
_total = (findDisplay 3100) displayCtrl 3106;
if(_selection == -1) exitWith {hint "Pas de sélection";};
if(isNull _control) exitWith {hint "Pas d'affichage"};
if(life_cMenu_lock) exitWith {};
life_cMenu_lock = true;
life_clothing_purchase set[life_clothing_filter,(_control lbValue _selection)];
_data = _control lbData _selection;
[_data,true,nil,nil,nil,nil,nil,true] call life_fnc_handleItem;
life_cMenu_lock = false;
_price ctrlSetStructuredText parseText format ["Prix : <t color='#8cff9b'>%1€</t>",[(_control lbValue _selection)] call life_fnc_numberText];
_totalPrice = 0;
{
	if(_x != -1) then
	{
		_totalPrice = _totalPrice + _x;
	};
} foreach life_clothing_purchase;
_total ctrlSetStructuredText parseText format ["Total : <t color='#8cff9b'>%1€</t>",[_totalPrice] call life_fnc_numberText];