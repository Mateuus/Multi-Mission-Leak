while{true} do
{
	{
		_prefix = [_x,0,16] call BIS_fnc_trimString;
		if(_prefix == "bis_fnc_drawminef") then
		{
			deleteMarker _x;
		};
		//hint format ["marker prefix:%1",_prefix];
	} foreach allMapMarkers;
	sleep 1;
};