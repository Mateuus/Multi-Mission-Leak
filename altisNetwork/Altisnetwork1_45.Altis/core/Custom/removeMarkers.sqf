while{true} do
{
	{
		_prefix = [_x,0,16] call BIS_fnc_trimString;
		if(_prefix == "bis_fnc_drawminef") then
		{
			deleteMarker _x;
		};
	} foreach allMapMarkers;
	sleep 1;
};