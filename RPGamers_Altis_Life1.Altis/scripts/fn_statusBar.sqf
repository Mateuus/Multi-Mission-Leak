waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

4 cutRsc ["osefStatusBar","PLAIN"];
//systemChat format["Loading game server info...", _rscLayer];

[] spawn {
	sleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetStructuredText parseText format["<t color='#993299'>FPS: %1</t> | <t color='#4752e0'>Police: %2</t> | <t color='#bf7e00'>Civilian: %3</t> | <t color='#00DD00'>Medics: %4</t> | <t color='#cccc00'>CASH: %5</t> | <t color='#cccc00'>BANK: %6</t> | <t color='#199619'>GRIDREF: %7</t>  ", round diag_fps, west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[life_cash] call life_fnc_numberText,[life_atmbank] call life_fnc_numberText,mapGridPosition player, _counter];
	};
};