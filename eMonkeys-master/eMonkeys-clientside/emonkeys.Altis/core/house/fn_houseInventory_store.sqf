/*
*
*	Store selected item in ##3503
*
*/

private ["_selectedindex", "_count", "_item", "_item_count", "_took_success", "_done", "__lb_item", "__lb_index", "__lb_dstcount", "__lb_current_count", "_house_weight", "_house_max_weight"];

_selectedindex = lbCurSel 3503;
_count = ctrlText 3506;

if( _selectedindex == -1) exitWith
{
	hint "Nichts ausgewählt.";
};
if(! ([_count] call fnc_isnumber)) exitWith
{
	hint "Du musst eine Zahl eingeben.";
};
if(EMonkeys_house_current_inv_running) exitWith
{
	hint "Inventar aktualisiert gerade.";
};

_count = parseNumber _count; //requested number
_count = round _count;

_item = lbData [3503, _selectedindex]; //item name
_item_count = lbValue [3503, _selectedindex]; //how many items are existing in PINV?

//Check data
/*
if(_item == "money") then //Security check: update _item_count 
{
	_item_count = EMonkeys_c164;
};
*/

//Check count
if( _count < 0) exitWith { hint "Ungültige Zahl."; };
if( _count > 999999) exitWith { hint "Ungültige Zahl."; };
if(_count > _item_count) exitWith {hint "Zu hohe Zahl eingegeben.";};

//Check weight
if (EMonkeys_house_current_weight + (_count * ([_item] call EMonkeys_fnc_itemWeight)) > EMonkeys_house_current_maxweight) exitWith
{
	hint "Das Haus kann nicht mehr aufnehmen!";
};

_took_success = false; //because of shit script language

/*
if(_item == "money") then //handle money item
{
	_took_success = true;
	EMonkeys_c164 = EMonkeys_c164 - _count;
}
else
{
*/
	if(([false, _item, _count] call EMonkeys_fnc_handleInv) ) then
	{
		_took_success = true;
	}
	else
	{
		hint "Konnte Item nicht aus Inventar nehmen!";
	};
//};

///////////////////////////Update house items

//Took from player => add to house
if(_took_success) then
{
	_done = false;
	
	{
		if((_x select 0) == _item) then
		{
			EMonkeys_house_current_inv set [_forEachIndex, [_item, (_x select 1) + _count]];
			_done = true;
		};
	}
	foreach EMonkeys_house_current_inv;
	
	if(!_done) then
	{
		EMonkeys_house_current_inv set [count EMonkeys_house_current_inv, [_item, _count]];
	};
};
//Final refresh
[] spawn EMonkeys_fnc_houseInventory_refresh;