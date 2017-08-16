/*

	Refreshes current dialog

*/
private["_display", "_selectedindex", "_index", "_shortname","_Btn1","_event2"];

disableSerialization;
if(!dialog) exitWith {hint "Could not find dialog.";}; //cancel if no dlg

_display = findDisplay 39500;
_preis = _display displayCtrl 1004;
_prozent = _display displayCtrl 1005;
_items = _display displayCtrl 1500;
_boerse = _display displayCtrl 1007;
_event = _display displayCtrl 1008;

if(isNull _display) exitWith {hint "Dialog not open!"; };


_selectedindex = lbCurSel 1500;
lbClear 1500;

{
	_name = [([_x select 1,0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_vartostr;
	

	_items lbAdd format["%1",_name];
	_items lbSetData [(lbSize _items)-1,_x select 1];
	
}	foreach EMonkeys_Market_price;
/*
_event2 = [];
{
	_event1 = _x;
	if((_event1 select 4) != 0) then
	{
		_event2 pushback [_event1 select 1,_event1 select 2,_event1  select 0,_event1 select 4];
	};
} foreach EMonkeys_market_price select 0;


_list = "";

{
	_item = _x select 1;
	_change = _x select 2;
	_preis2 = _x select 0;
	_prozent1 = _x select 4;

	_item = [([_item,0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_vartostr;



	if(_change >= 0) then
	{
		_list = _list + format["<t align='left' size='0.7' color='#000000'>%1</t><t align='right' size='0.7' color='#00FF00'>%2%3  %4€</t><br/>",_item,_prozent1,"%",round _preis2];
	}
	else
	{
		_list = _list + format["<t align='left' size='0.7' color='#000000'>%1</t><t align='right' size='0.7' color='#FF0000'>%2%3  %4€</t><br/>",_item,_prozent1,"%",round _preis2];
	};

} foreach _event2 select 0;

if(count _list == 0) then {_list = "Aktuell gibt es keine Events."};

_boerse ctrlSetStructuredText parseText format["%1",_list];


*/

if (count eM_market_event != 0) then {
_event ctrlSetStructuredText parseText format["<t align='left' size='0.7' color='#000000'>%1</t>",(eM_market_event select 0)];
};

_items lbSetCurSel 0;