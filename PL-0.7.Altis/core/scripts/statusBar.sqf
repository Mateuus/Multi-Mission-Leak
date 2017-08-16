[] spawn {
    private ["_uiDisp"];

    disableSerialization;
    42 cutRsc["osefStatusBar","PLAIN"];
    _uiDisp = uiNamespace getVariable "osefStatusBar";

	sleep 5;
	_counter = 180;
	while {true} do
	{
		sleep 1.5;
		_counter = _counter - 1;
        if(isNull _uiDisp) then {
            42 cutRsc ["osefStatusBar","PLAIN"];
            _uiDisp = uiNamespace getVariable "osefStatusBar";
        };
		(_uiDisp displayCtrl 1000)ctrlSetText format["Gendarmes: %1 | Médecins: %3 | Civils: %2 | Dépanneurs: %5 | Militaires: %6 | Position: %4",  west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits, mapGridPosition player,{_x getVariable ["job", 0] == 1} count playableUnits, east countSide playableUnits, _counter];
	};
};
