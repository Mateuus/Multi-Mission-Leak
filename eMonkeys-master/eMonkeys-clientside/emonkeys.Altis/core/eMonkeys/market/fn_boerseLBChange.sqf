/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl","_list_1x","_list_2x"];
_control = _this select 0;
_index = _this select 1;
_display = findDisplay 39500;
_name1 = _display displayCtrl 1000;
_preis1 = _display displayCtrl 1001;
_preis2 = _display displayCtrl 1004;
_prozent2 = _display displayCtrl 1005;
if(isNull _display) exitWith {hint "Dialog not open!"; };
//Fetch some information.
_item = _control lbData _index;

_index2 = [_item,EMonkeys_Market_price] call TON_fnc_index;
_name = (EMonkeys_Market_price select _index2) select 1;
_preis = (EMonkeys_Market_price select _index2) select 0;
_change = (EMonkeys_Market_price select _index2) select 2;
_prozent = (EMonkeys_Market_price select _index2) select 3;

_name = [([_name,0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_vartostr;

_prozent = (EMonkeys_Market_price select _index2) select 3;




_name1 ctrlSetStructuredText parseText format["<t align='center' size='1.5' color='#000000'>%1</t>",_name];
_preis1 ctrlSetStructuredText parseText format["<t align='center' size='1.5' color='#00FF00'>%1€</t>",_preis];
			
// /*Trend Global*/
			
if(_change >= 0) then
{
	ctrlSetText [1200, "core\textures\menu_icons\icon_trendup.paa"];
	_preis2 ctrlSetStructuredText parseText format["<t align='center' color='#00FF00'>+%1€</t>",[_change] call EMonkeys_fnc_numberText];
}
else
{
	ctrlSetText [1200, "core\textures\menu_icons\icon_trenddown.paa"];
	_preis2 ctrlSetStructuredText parseText format["<t align='center' color='#FF0000'>%1€</t>",[_change] call EMonkeys_fnc_numberText];
};
			
// /*Trend local*/
		
if(_prozent >= 0) then
{
	ctrlSetText [1201, "core\textures\menu_icons\icon_trendup.paa"];
	_prozent2 ctrlSetStructuredText parseText format["<t align='center' color='#00FF00'>+%1%2</t>",[_prozent] call EMonkeys_fnc_numberText,"%"];
}
else
{
	ctrlSetText [1201, "core\textures\menu_icons\icon_trenddown.paa"];
	_prozent2 ctrlSetStructuredText parseText format["<t align='center' color='#FF0000'>%1%2</t>",[_prozent] call EMonkeys_fnc_numberText,"%"];
};
