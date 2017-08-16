#include "..\..\script_macros.hpp"
/*
	File: fn_lactions.sqf
	Author: RPGforYOU
	Description: Actions for the custom loadout menu
*/
private["_amount","_item_list","_gear_list","_shop_data","_name","_price","_txtbox","_list"];
_action = [_this,1,-1,[0]] call BIS_fnc_param;
disableSerialization;
//dialog
_txtbox = ctrlText 3005;
_list = lbtext[3001,(lbCurSel 3001)];

switch (_action) do {
	case 1 : {
	if(_list != '') then {
	[player, [profileNamespace, _list]] call BIS_fnc_loadInventory;
	[] spawn life_fnc_lprice;
	};
	};
	case 2 : {
	if(_txtbox == '') exitWith {hint "Name your loadout first!";systemchat format['Name your loadout first!'];};
	if(count _txtbox > 20) exitWith {hint "Length of your name has a maximum of 20 Characters!";systemchat format['Length of your name has a maximum of 20 Characters!'];};
	
	if((count OVcustoml >= 5) && (FETCH_CONST(life_donorlevel) < 1)) then {
	hint "You have to be a DONATOR to be able to save MORE then 5 loadouts! You can delete an old loadout also to save your new one.";
	systemchat format['You have to be a DONATOR to be able to save MORE then 5 loadouts! You can delete an old loadout also to save your new one.'];
	} else {
	if!(_txtbox in OVcustoml)then
	{
		OVcustoml pushBack _txtbox;
		profileNamespace setVariable['OVcustoml',OVcustoml];
		saveprofileNamespace;
	};
	[player, [profileNamespace, _txtbox]] call BIS_fnc_saveInventory;
	};
	[] spawn life_fnc_lmenu;
	};
	case 3 : {
	if(_list != '') then {
		if(_list in OVcustoml) then {
			_subtract = OVcustoml find _list; if(_subtract == -1) exitWith {hint "Dafuq mate? Doesn't exist bro!"}; _deletel = OVcustoml deleteAt _subtract;
			systemchat format['Deleted Custom Loadout: %1',_deletel];hint parseText format["Deleted Custom Loadout: <br/> %1",_deletel];
			profileNamespace setVariable['OVcustoml',OVcustoml];saveprofileNamespace;
			[player, [profileNamespace, _list]] call BIS_fnc_deleteInventory;
			//reload listbox
			[] spawn life_fnc_lmenu;
		};
	};
	};
};
/*
My references:
https://community.bistudio.com/wiki/BIS_fnc_saveInventory
https://community.bistudio.com/wiki/BIS_fnc_loadInventory
*/
