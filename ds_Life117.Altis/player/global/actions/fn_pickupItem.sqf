/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Pickup items
*/
private["_object","_itemInfo","_itemName","_illegal","_diff","_weight","_amount"];
if(DS_doingStuff) exitWith {};
DS_doingStuff = true;
_amount = 0;
_object = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if((isNull _object)OR(isPlayer _object)) exitWith {DS_doingStuff = false;};
if((_object getVariable["PickedUp",false])) exitWith {DS_doingStuff = false;deleteVehicle _object;}; //Object was already picked up.
if(player distance _object > 3) exitWith {DS_doingStuff = false;};
_itemInfo = _object getVariable "item";
_itemName = [_itemInfo select 0] call DS_fnc_itemStringConfig;
_weight = [_itemInfo select 0,_itemInfo select 1] call DS_fnc_itemWeight;
if((DS_currentWeight + _weight) > DS_maxWeight)exitwith{DS_doingStuff = false;hint "You do not have enough space to pickup this item(s)"};
_object setVariable["PickedUp",TRUE,TRUE];
player playmove "AinvPknlMstpSlayWrflDnon";
sleep 0.5;
titleText[format["You picked up %1 %2",(_itemInfo select 1),_itemName],"PLAIN"];
deleteVehicle _object;
DS_doingStuff = false;
[(_itemInfo select 0),true,(_itemInfo select 1)] call DS_fnc_handleInventory;