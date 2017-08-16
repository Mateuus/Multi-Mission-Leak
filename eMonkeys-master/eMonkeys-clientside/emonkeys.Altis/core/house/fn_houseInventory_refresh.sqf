/*
*	Refreshes text of inventory listbox items
*
*/

private ["_house_inv", "_item", "_count", "_index", "_item_name", "_house_weight", "_house_max_weight", "_house_current_exdata", "_selected_index", "_house_inv", "_weight","_longname"];

disableSerialization;

if(!dialog) exitWith {hint "Could not find dialog.";}; //cancel if no dlg

//Set exdata for later use
_house_current_exdata = missionNamespace getVariable "house_current_exdata";

//init
_house_weight = 0;

//remember selection
_selected_index = lbCurSel 3502;

//HOUSE_INVENTORY
lbClear 3502; //clear and rebuild ^^^^ cannot clear & rebuild HOUSE_INVENTORY, because the items are important DATA
EMonkeys_house_current_inv_running = true;

{
	_item =  _x select 0; //convert to shortname
	_count = _x select 1; //Get count from MissionNamespace; using longname as var name
	_weight = [_item] call EMonkeys_fnc_itemWeight;
	
	_longname =  [_item,0] call EMonkeys_fnc_varHandle; //convert to shortname
	_item_name = [_longname] call EMonkeys_fnc_varToStr; //get name from longname
	
	switch(_item) do 
	{
		case "money": { _item_name = format ["%1€", [_count] call EMonkeys_fnc_numberText]; };
		case "illegalmoney": { _item_name = format ["%1€ (Illegal)", [_count] call EMonkeys_fnc_numberText]; };
		default { _item_name = format ["%2x %1", _item_name, [_count] call EMonkeys_fnc_numberText]; };
	};
	if( _item == "money") then{
	EMonkeys_house_money = _count
	};
	
	if( _count > 0) then
	{	
		_house_weight = _house_weight + (_count * _weight ); //add to house weight
		
		_index = lbAdd [3502, _item_name ];
		lbSetData [3502, _index, _item];
		lbSetValue [3502, _index, _count];	
		
	};


	
}
foreach EMonkeys_house_current_inv;

EMonkeys_house_current_weight = _house_weight;

if(_selected_index != -1 && _selected_index < (lbSize 3502)) then
{
	lbSetCurSel [3502, _selected_index]; //set selection back
};

//PLAYER_INVENTORY
lbClear 3503; //clear and rebuild

//+ Add money item manually
///////////////////////////////
_index = lbAdd [3503, format ["%1€", [EMonkeys_c164] call EMonkeys_fnc_numberText] ];
lbSetData [3503, _index, "money"];
lbSetValue [3503, _index, EMonkeys_c164];

{
	_item =  [_x,1] call EMonkeys_fnc_varHandle; //convert to shortname
	_count = missionNamespace getVariable _x ; //Get count from MissionNamespace; using longname as var name
	
	_item_name = [_x] call EMonkeys_fnc_varToStr; //get name from longname
	
	switch(_item) do 
	{
		case "money": { _item_name = format ["%1€", [_count] call EMonkeys_fnc_numberText]; };
		case "illegalmoney": { _item_name = format ["%1€ (Illegal)", [_count] call EMonkeys_fnc_numberText]; };
		default { _item_name = format ["%2x %1", _item_name, [_count] call EMonkeys_fnc_numberText]; };
	};
	
	if( _count > 0) then
	{
		_index = lbAdd [3503, _item_name ];
		lbSetData [3503, _index, _item];
		lbSetValue [3503, _index, _count];
	};
	
}
foreach EMonkeys_inv_items;

EMonkeys_house_current_inv_running = false;

////////////////////////////Update weight label
ctrlSetText [3504, format ["%1 / %2", EMonkeys_house_current_weight, EMonkeys_house_current_maxweight] ];