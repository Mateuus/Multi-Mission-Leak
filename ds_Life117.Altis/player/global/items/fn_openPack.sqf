/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Opens packs that contain various goods
*/
private ["_item","_itemInfo","_rand"];
_item = _this select 0;
_itemInfo = [];
switch(_item)do
	{
	case "sodiumPack": {_itemInfo = ["DS_item_sodium","Sodium Hydroxide Pack","Sodium Hydroxide","To process Crystal Meth",20]};
	case "hydroPack": {_itemInfo = ["DS_item_hydro","Hydrochloric Acid Pack","Hydrochloric Acid","To process Crystal Meth",20]};
	};
if((DS_currentWeight + (_itemInfo select 4)) > DS_maxWeight)exitwith{hint format ["You need at least %1kg of free space before attempting to open this pack",(_itemInfo select 4)]};
closeDialog 0;
[_item,false,1] call DS_fnc_handleInventory;
_rand = (_itemInfo select 4) + round random (_itemInfo select 4);
sleep 1;
[(_itemInfo select 0),true,_rand] call DS_fnc_handleInventory;
hint format ["You have opened your %1 and received %2 units of %3\n\nThis can be used %4",(_itemInfo select 1),_rand,(_itemInfo select 2),(_itemInfo select 3)];