[] spawn {
	if (isnil("allLicencesDebug")) then {allLicencesDebug = 0;};

	LeoHintList = "";
	LeoHintList = "DEBUG - Licenses\n";

	if (allLicencesDebug == 0) then
	{
		allLicencesDebug = 1;
		{
			missionNamespace setVariable[(_x select 0),true];
			_license = missionNamespace getVariable [(_x select 0),false];
			LeoHintList = LeoHintList + format["%1 - %2\n",_x,_license];
			hintsilent LeoHintList;
			sleep 0.1;
		} foreach lhm_licenses;
	}
	else
	{
		allLicencesDebug = 0;
		{
			missionNamespace setVariable[(_x select 0),false];
			_license = missionNamespace getVariable [(_x select 0),false];
			LeoHintList = LeoHintList + format["%1 - %2\n",_x,_license];
			hintsilent LeoHintList;
			sleep 0.1;
		} foreach lhm_licenses;
	};
};

[["admin",(format["%1 with UID %2 used the Licence Debug Script",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;