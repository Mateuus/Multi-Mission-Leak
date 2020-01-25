waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
fn_statusBar.sqf
*/

4 cutRsc ["osefStatusBar","PLAIN"]; 

[] spawn {
	uiSleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {!deadPlayer} do
	{
		uiSleep 1;
		_counter = _counter - 1;

		if(!phone_s_2) then {
				((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetStructuredText parseText format["<img size='1' image='icons\itime.paa'/><t size='1px'> %1</t> | <img size='1' image='icons\icop.paa'/><t size='1px'> %2</t> | <img size='1' image='icons\iciv.paa'/><t size='1px'> %3</t> | <img size='1' image='icons\iems.paa'/><t size='1px'> %4</t> | <img size='1' image='icons\icash.paa'/><t size='1px'> %5</t> | <img size='1' image='icons\iatm.paa'/><t size='1px'> %6</t>", [serverTime,"HH:MM:SS"] call BIS_fnc_secondsToString, 
		    west countSide playableUnits, civilian countSide playableUnits,
		    independent countSide playableUnits,[cash_in_hand] call life_fnc_numberText,[cash_in_bank] call   
		    life_fnc_numberText,mapGridPosition player, _counter];
		};
	}; 
};