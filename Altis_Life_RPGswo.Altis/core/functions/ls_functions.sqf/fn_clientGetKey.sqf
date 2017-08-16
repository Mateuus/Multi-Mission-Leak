private["_vehicle","_unit","_giver"];

	_vehicle = _this select 0;
	
	_unit = _this select 1;
	
	_giver = _this select 2;
	
	if(isNil "_unit" OR isNil "_giver") exitWith {};
	
	if(player == _unit && !(_vehicle in DWEV_vehicles)) then
	{
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		hint format["%1 Hat dir ein Schlüssel für %2 gegeben",_giver,_name];
		DWEV_vehicles pushBack _vehicle;
		[getPlayerUID player,(side player),_vehicle,1] remoteExec ["DWEV_fnc_keyManagement",2];
	};