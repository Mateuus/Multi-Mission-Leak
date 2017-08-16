/*---------------------------------------------------------------------------
	File: fn_adacMarkers.sqf
	Author: Skrow & Skyfezzer
	
	Description:
	Marks downed players on the map when it's open.
---------------------------------------------------------------------------*/

private["_markers","_units"];
_markers = [];
_units = [];
sleep 0.25;
if(life_adac_onDuty) then{
	if(visibleMap) then {
		{
			//diag_log format["::ADAC::%1::", getPos (_x select 0)];
		
				_marker = createMarkerLocal [format["%1_adac_marker",_x select 0],getPos (_x select 0)];
				_marker setMarkerColorLocal "ColorYellow";
				_marker setMarkerTypeLocal "mil_warning";
				_vehicleType = typeOf (_x select 0);
				_marker setMarkerTextLocal format["%1 avec un(e): %2 a besoin d'aide",_x select 1,_vehicleType];
				_markers set[count _markers,_marker];

		} foreach life_adacMarker;

		
		waitUntil {!visibleMap};
		{deleteMarkerLocal _x;} foreach _markers;
	};
};