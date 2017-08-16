/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays vehicles around the map
*/

private["_markers","_cars","_people","_air","_special"];
_markers = [];
_cars = [];
_air = [];
_ship = [];
_special = [];
_mechanics = [];

sleep 1;
((findDisplay 12) displayCtrl 51) mapCenterOnCamera false;
if(visibleMap) then {
	{
		_name = typeOf _x;
		if(_x getVariable ["impound",false])then
			{
			_special pushBack _x;
			}
			else
			{
			if((count crew _x) == 0)then
				{
				_cars pushBack _x;
				};
			};
	} foreach allMissionObjects "Car";
	{
		_name = typeOf _x;
		if(_x getVariable ["impound",false])then
			{
			_special pushBack _x;
			}
			else
			{
			if((count crew _x) == 0)then
				{
				_air pushBack _x;
				};
			};

	} foreach allMissionObjects "Air";
	{
		_name = typeOf _x;
		if(_name in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"])then
			{
			if(_x getVariable ["impound",false])then
				{
				_special pushBack _x;
				}
				else
				{
				if((count crew _x) == 0)then
					{
					_ship pushBack _x;
					};
				};
			};
	} foreach allMissionObjects "Ship";

	{
		if(_x getVariable ["mechanic",false])then
			{
			_mechanics pushBack _x;
			};
	}forEach playableUnits;

	{
		_marker = createMarkerLocal [format["%1_wreckedCar",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorOrange";
		_marker setMarkerTypeLocal "hd_warning";
		_marker setMarkerTextLocal "Damaged Land Vehicle";
		_markers pushBack _marker;
	} foreach _cars;
	{
		_marker = createMarkerLocal [format["%1_wreckedCar",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorOrange";
		_marker setMarkerTypeLocal "hd_warning";
		_marker setMarkerTextLocal "Damaged Air Vehicle";
		_markers pushBack _marker;
	} foreach _air;
	{
		_marker = createMarkerLocal [format["%1_wreckedCar",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorOrange";
		_marker setMarkerTypeLocal "hd_warning";
		_marker setMarkerTextLocal "Damaged Sea Vehicle";
		_markers pushBack _marker;
	} foreach _ship;
	{
		_marker = createMarkerLocal [format["%1_wreckedCar",_x],visiblePosition _x];
		_marker setMarkerColorLocal "Colorred";
		_marker setMarkerTypeLocal "hd_warning";
		_marker setMarkerTextLocal "Impound Request";
		_markers pushBack _marker;
	} foreach _special;

	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal "Mechanic";
		_markers pushBack _marker;
	} foreach _mechanics;

	waitUntil {!visibleMap};
	{deleteMarkerLocal _x;} foreach _markers;
};

