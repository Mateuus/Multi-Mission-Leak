disableSerialization;
private["_control","_selection","_price","_priceTag"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_selection = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _control OR _selection == -1) exitWith {};
_price = _control lbValue _selection;
_priceTag = ((findDisplay 39400) displayCtrl 39401);
_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Prix : <t color='#8cff9b'>%1€</t></t>",[(_price)] call life_fnc_numberText];	