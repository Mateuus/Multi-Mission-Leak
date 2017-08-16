/*
	File: fn_popAllItems.sqf
	Author: Alan

	Description:
	Populates textbox with all current items held in inventory.
*/
private["_data","_index","_item","_listBox","_listBoxCtrl","_listBoxIDC","_listboxIndex","_num","_textBox","_trunk"];
_listBox = [_this,0,[],[[]]] call BIS_fnc_param;
_listBoxCtrl = [_listBox,0,controlNull,[controlNull]] call BIS_fnc_paramIn;
_listboxIndex = [_listBox,1,-1,[-1]] call BIS_fnc_paramIn;

if(isNull _listBoxCtrl) exitWith {"exit1"};
if(_listboxIndex == -1) exitWith {"exit2"};
_listBoxIDC = ctrlIDC _listBoxCtrl;
_textBox = 0;
_trunk = false;

switch (_listBoxIDC) do 
{
	case 2005: {_textBox = 2010;};	//inventory
	case 3502: {_textBox = 3505; _trunk = true;}; //trunk vehicle
	case 3503: {_textBox = 3506;};	//trunk player
	case 2402: {_textBox = 2405;};	//virt shop
};

_item = lbData [_listBoxIDC,(lbCurSel _listBoxIDC)];

if(_trunk) then {
	_index = [_item,((life_trunk_vehicle getVariable "Trunk") select 0)] call life_fnc_index;
	_data = (life_trunk_vehicle getVariable "Trunk") select 0;
	if(_index == -1) exitWith {};
	_num = _data select _index select 1;

} else {
	_item = [_item,0] call life_fnc_varHandle;
	_num = call compile format["%1",_item];
};
ctrlSetText [_textBox,format["%1",_num]];

//Debug
/* _text = ctrlText _textBox;
hint format ["%1 :: %2 :: %3 :: %4 :: %5 :: %6 :: %7",_listBoxIDC,typeName _listBoxIDC,_listboxIndex,_item,_num,_textBox,_text]; */
