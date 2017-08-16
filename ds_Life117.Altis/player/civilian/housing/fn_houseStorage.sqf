/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Opens the house storage system
*/

private["_titleImg","_img","_vehMaxWeight","_vehCurWeight","_vehData","_dialog","_title","_list1","_list2","_vehicle","_img1","_img2","_vehTitle","_playerTitle","_vehicleWeight","_takeAmount","_storeAmount","_storedItems","_index","_string","_amount","_short","_btnStore","_btnTake"];
if([getPos player,30,west] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this with police nearby","PLAIN"];};
closeDialog 0;
createDialog "bootMenu";

disableSerialization;

_vehicle = cursorTarget;

DS_bootVeh = _vehicle;

_dialog = findDisplay 666668;
_list1 = _dialog displayCtrl 1500;
_list2 = _dialog displayCtrl 1501;
_img1 = _dialog displayCtrl 1200;
_img2 = _dialog displayCtrl 1201;
_vehTitle = _dialog displayCtrl 1000;
_playerTitle = _dialog displayCtrl 1001;
_vehicleWeight = _dialog displayCtrl 1002;
_takeAmount = _dialog displayCtrl 1400; 
_storeAmount = _dialog displayCtrl 1401; 
_btnStore = _dialog displayCtrl 1203; 
_btnTake = _dialog displayCtrl 1204; 
_titleImg = _dialog displayCtrl 1277;
_titleImg ctrlSetText "extras\textures\menus\houseInv.jpg";
//Text
_playerTitle ctrlSetStructuredText parseText "<t color='#FFFFFF'>Players Inventory</t>";
_vehTitle ctrlSetStructuredText parseText "<t color='#FFFFFF'> House Inventory</t>";

//list
lbClear _list1;
lbClear _list2;

if((_vehicle getVariable ["boot_open",false])) exitWith {hint "This houses storage is already open";closeDialog 0;DS_waitToSync = false};
_vehicle setVariable["boot_open",true,true];
_storedItems = _vehicle getVariable ["boot",[]];
_vehData = _vehicle getVariable ["boot",[[],0]];
_vehMaxWeight = _vehicle getVariable ["storage",0];
_vehMaxWeight = (_vehMaxWeight*500)+500;
_vehCurWeight = _vehData select 1;
_vehicleWeight ctrlSetStructuredText parseText format ["<t color='#FFFFFF'>%1 / %2</t>",_vehCurWeight,_vehMaxWeight];

//if(count _storedItems == 0) then {_storedItems setVariable["boot",[[],0],true]; _storedItems = [];} else {_storedItems = _storedItems select 0;};
if(count _storedItems == 0) then 
	{
	DS_bootVeh setVariable["boot",[[],0],true]; 
	_storedItems = [];
	} 
	else 
	{
	_storedItems = _storedItems select 0;
	};
{

	_string = [_x select 0] call DS_fnc_itemStringConfig;
	_amount = _x select 1;
	//systemchat format ["INDEX %1 || STRING %2 || AMOUNT %3",_amount,_string,_amount];
	if(_amount > 0)then
		{
		_short = [_x select 0,"DS_item_",""] call KRON_Replace;
		_img = format ["extras\icons\%1.jpg",_short];
		_list1 lbAdd format["[%1] - %2",_amount,_string];
		_list1 lbSetPicture [(lbSize _list1)-1, _img];
		_list1 lbSetData [(lbSize _list1)-1,_x select 0];
		};
}forEach _storedItems;

{
	_value = missionNamespace getVariable _x;
	if(_value > 0)then
		{
		_string = [_x] call DS_fnc_itemStringConfig;
		_short = [_x,"DS_item_",""] call KRON_Replace;
		_img = format ["extras\icons\%1.jpg",_short];
		_list2 lbAdd format ["%1x - %2",_value,_string];
		_list2 lbSetPicture [(lbSize _list2)-1, _img];
		_list2 lbSetData [(lbSize _list2)-1,_short];
		};
}forEach DS_itemArray;

_btnStore buttonSetAction "[] spawn DS_civ_houseItemStore;";
_btnTake buttonSetAction "[] spawn DS_civ_houseItemTake;";

_vehicle spawn
{
	waitUntil {isNull (findDisplay 666668)};
	_this setVariable["boot_open",false,true];
	if(DS_waitToSync)exitwith{};
	DS_waitToSync = true;
	sleep 2;
	waitUntil {isNull (findDisplay 666668)};
	DS_waitToSync = false;
	[[_this,0],"HUNT_fnc_updateHouseStorage",false,false] spawn DS_fnc_MP;
	[] call DS_fnc_compileData;
};