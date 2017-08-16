/*

	Refreshes current dialog

*/

private["_display", "_selectedindex", "_index", "_shortname"];

disableSerialization;
if(!dialog) exitWith {hint "Could not find dialog.";}; //cancel if no dlg

_display = findDisplay 39500;

if(isNull _display) exitWith {hint "Dialog not open!"; };

//Selected index
_selectedindex = lbCurSel 1500;

ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];

//If selected index is -1, set it to 0 (triggers refresh)
if(_selectedindex == -1) then
{
	lbSetCurSel [1500, 0];

	lbClear 1500;

	//Recreate listbox items
	{
		_index = lbAdd [1500, [ [_x select 0, 0] call lhm_fnc_varHandle ] call lhm_fnc_varToStr ];
		lbSetData [1500, _index, _x select 0];
	}
	foreach lhm_market_resources;
}
//Otherwise set data to selected entry
else
{
	_shortname = lbData [1500, _selectedindex];

	ctrlSetText [1000, lbText [1500, _selectedindex] ]; //Set name

	{
		if((_x select 0) == _shortname) exitWith
		{
			ctrlSetText [1001, format["$%1", [_x select 1] call lhm_fnc_numberText ] ];

			//Trend Global
			ctrlSetText [1004, format["$%1", [_x select 2] call lhm_fnc_numberText ] ];

			if((_x select 2) >= 0) then
			{
				ctrlSetText [1200, "core\economic\icons\trendup.paa"];
			}
			else
			{
				ctrlSetText [1200, "core\economic\icons\trenddown.paa"];
			};

			//Trend local
			ctrlSetText [1005, format["$%1", [_x select 3] call lhm_fnc_numberText ] ];

			if((_x select 3) >= 0) then
			{
				ctrlSetText [1201, "core\economic\icons\trendup.paa"];
			}
			else
			{
				ctrlSetText [1201, "core\economic\icons\trenddown.paa"];
			};
		};
	}
	foreach lhm_market_prices;
};