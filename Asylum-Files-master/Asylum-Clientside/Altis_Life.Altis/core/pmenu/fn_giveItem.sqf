/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 2010;
ctrlShow[2002,false];
if((lbCurSel 2023) == -1) exitWith {hint "No one was selected!";ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if((lbCurSel 2005) == -1) exitWith {hint "You didn't select an item you wanted to give.";ctrlShow[2002,true];};
_item = lbData [2005,(lbCurSel 2005)];
if(_item == "") exitWith {ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2002,true];};
if(_unit == player) exitWith {ctrlShow[2002,true];};
if(isNull _unit) exitWith {ctrlShow[2002,true];};

//A series of checks *ugh*
if(life_is_processing && life_action_in_use) exitWith {hint "You cannot give items while processing";};
if(!([_val] call life_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format.";ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {hint "You need to enter an actual amount you want to give.";ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};
if (_item == "dirty_money" && (parseNumber _val) < life_inv_dirty_money) exitWith { hint "Dirty money can only be traded when transfering the full amount!"; ctrlShow[2002,true]; };
if (_item in ["goldbar","debitcard"]) exitWith {hint "You can't trade this item!";ctrlShow[2002,true];};
if(!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {hint "Couldn't give that much of that item, maybe you don't have that amount?";ctrlShow[2002,true];};
[[_unit,_val,_item,player],"life_fnc_receiveItem",_unit,false] spawn life_fnc_MP;
_type = [_item,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["You gave %1 %2 %3",name _unit,_val,_type];
[false] call life_fnc_inventory;

ctrlShow[2002,true];