#include "..\..\script_macros.hpp"

/*

	Refreshes current dialog

*/

private["_display", "_selectedindex", "_index", "_shortname","_itemDisplayName","_itemName"];

disableSerialization;
if(!dialog) exitWith {["Could not find dialog.",false,"slow"] call life_fnc_notificationSystem;}; //cancel if no dlg

_display = findDisplay 39500;

if(isNull _display) exitWith {["Dialog not open!",false,"slow"] call life_fnc_notificationSystem; };

//Selected index
_selectedindex = lbCurSel 1500;

//If selected index is -1, set it to 0 (triggers refresh)
if(_selectedindex == -1) then
{
	lbSetCurSel [1500, 0];
	
	lbClear 1500;

	//Recreate listbox items
	{
	
        _itemName = _x select 0;
        _itemDisplayName = M_CONFIG(getText,"VirtualItems",_itemName,"displayname");
		_index = lbAdd [1500,localize _itemDisplayName];
		lbSetData [1500, _index, _x select 0];
		
	} forEach life_market_resources;
}
//Otherwise set data to selected entry
else
{
	_shortname = lbData [1500, _selectedindex];
	
	ctrlSetText [1000, lbText [1500, _selectedindex] ]; //Set name
	
	{
		if((_x select 0) == _shortname) exitWith
		{
			ctrlSetText [1001, format["%1 $", [_x select 1] call life_fnc_numberText ] ];
			
			//Trend Global
			ctrlSetText [1004, format["%1 $", [_x select 2] call life_fnc_numberText ] ];
			
			if((_x select 2) >= 0) then
			{
				ctrlSetText [1200, "images\icons\trendup.paa"];
			}
			else
			{
				ctrlSetText [1200, "images\icons\trenddown.paa"];
			};
			
			//Trend local
			ctrlSetText [1005, format["%1 $", [_x select 3] call life_fnc_numberText ] ];
			
			if((_x select 3) >= 0) then
			{
				ctrlSetText [1201, "images\icons\trendup.paa"];
			}
			else
			{
				ctrlSetText [1201, "images\icons\trenddown.paa"];
			};
		};
	}
	foreach life_market_prices;
};