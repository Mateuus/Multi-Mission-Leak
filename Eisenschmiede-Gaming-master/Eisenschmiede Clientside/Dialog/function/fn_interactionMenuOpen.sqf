disableSerialization;
#define BASE_ID 37450
_menuTitle = [_this,0,"",[""]] call BIS_fnc_param;
_menuData = [_this,1,[],[[]]] call BIS_fnc_param;
if(dialog) exitWith {};
if(!createDialog "interaction_menu") exitWith {};
_display = findDisplay 37400;
(_display displayCtrl 37401) ctrlSetText _menuTitle;
_menuData pushBack["Schliesse Menu","closeDialog 0;"];

for "_i" from 0 to count _menuData -1 do {
	_item = _menuData select _i;
	_id = BASE_ID + _i;
	_ctrl = _display displayCtrl _id;
	_ctrl ctrlSetText (_item select 0);
	_ctrl buttonSetAction (_item select 1);
	_ctrl ctrlShow true;
};