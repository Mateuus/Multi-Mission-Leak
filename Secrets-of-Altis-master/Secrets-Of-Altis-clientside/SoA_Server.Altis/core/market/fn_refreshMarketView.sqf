/*

	Refreshes current dialog

*/

private["_display","_selectedindex","_shortname"];

disableSerialization;
if(!Dialog) exitWith {hint "Could not find dialog.";};
_display = findDisplay 39500;
_selectedindex = lbCurSel 1500; //Selected index
if(isNull _display) exitWith {};
if(_selectedindex == -1) exitWith{}; //If selected index is -1, set it to 0 (triggers refresh)

	_shortname = lbData [1500, _selectedindex];
	
	ctrlSetText [1000, lbText [1500, _selectedindex] ]; //Set name
	
	{
		if((_x select 0) == _shortname) exitWith
		{
			ctrlSetText [1001, format["%1€", [_x select 1] call life_fnc_numberText ] ];
			
			//Trend Global
			ctrlSetText [1004, format["%1€", [_x select 2] call life_fnc_numberText ] ];
			
			if((_x select 2) >= 0) then
			{
				ctrlSetText [1200, "icons\trendup.paa"];
			}
			else
			{
				ctrlSetText [1200, "icons\trenddown.paa"];
			};
			
			//Trend local
			ctrlSetText [1005, format["%1€", [_x select 3] call life_fnc_numberText ] ];
			
			if((_x select 3) >= 0) then
			{
				ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{
				ctrlSetText [1201, "icons\trenddown.paa"];
			};
		};
	}
	foreach life_market_prices;