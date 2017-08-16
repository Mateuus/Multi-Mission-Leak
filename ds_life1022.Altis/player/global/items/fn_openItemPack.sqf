/*
	Darkside Life
	
	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens packs that contain various goods
*/

private ["_item","_itemInfo","_rand"];
_item = _this select 0;
_itemInfo = [];
switch(_item)do
	{
	case "packSteel": {_itemInfo = ["DS_item_mattSteel","Steel Pack","Steel","To craft",200]};
	case "packBronze": {_itemInfo = ["DS_item_mattBronze","Bronze Pack","Bronze","To craft",200]};
	case "packGlass": {_itemInfo = ["mattCrystalGlass","Crystal Glass Pack","Crystal Glass","To craft",200]};
	case "packCircuitBoard": {_itemInfo = ["mattCircuitBoard","CircuitBoard Pack","CircuitBoard","To craft",30]};
	case "packBattery": {_itemInfo = ["mattSmallBattery","Small Battery Pack","Small Battery","To craft",30]};
	case "packCPU": {_itemInfo = ["mattCpu","Cpu Pack","Cpu","To craft",15]};
	};
if((DS_currentWeight + ((_itemInfo select 4)-1)) > DS_maxWeight)exitwith{hint format ["You need at least %1kg of free space before attempting to open this pack. You may need to use steroids.",(_itemInfo select 4)]};
closeDialog 0;
[_item,false,1] call DS_fnc_handleInventory;
_rand = (_itemInfo select 4);
sleep 1;
[(_itemInfo select 0),true,_rand] call DS_fnc_handleInventory;
hint format ["You have opened your %1 and received %2 units of %3\n\nThis can be used %4",(_itemInfo select 1),_rand,(_itemInfo select 2),(_itemInfo select 3)];