/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Marks dead bodies, players waiting for revives and human remains for medics to clean up
*/

private["_markers","_units","_dead","_bones","_down","_name","_civs"];
_markers = [];
_units = [];
_dead = [];
_bones = [];
_civs = [];
_medics = [];
[] call DS_fnc_localBodyCleanup;
if(DS_uselessMedic)exitwith{};
sleep 0.5;

if((DS_infoArray select 10) > 21)then
	{
	hint "WARNING! The civilian markers are for your own benefit only, you are not to share this information with anyone other than medics";
	};

if(visibleMap)then
	{
		if((DS_infoArray select 10) > 21)then
			{
				{
				if(((side _x) isEqualTo civilian)&&(_x distance (getMarkerPos "hospital_3") < 300))then
					{
					_civs pushBack _x;
					};
				}forEach playableUnits;

			};
		if((DS_infoArray select 10) > 25)then
			{
				{
				if(((side _x) isEqualTo civilian)&&(_x distance (getMarkerPos "hospital_2") < 300))then
					{
					_civs pushBack _x;
					};
				}forEach playableUnits;

			};
		{
			if(_x getVariable ["medic",false])then
				{
				_medics pushBack _x;
				};
			}forEach playableUnits;

		{
		_revive = _x getVariable ["requestedMedic",false];
		_name = _x getVariable ["name","Unknown"];
		if((!isNil "_name")&&(_revive)) then
			{
			_units pushBack _x;
			};
		} foreach allDeadMen;

		{
			_bones pushBack _x;
		} foreach allMissionObjects "Land_HumanSkeleton_F";

		{
			_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "loc_Hospital";
			_marker setMarkerTextLocal format["%1",(_x getVariable["name","Unknown Player"])];
			_markers pushBack _marker;
		} foreach _units;

		{
			_marker = createMarkerLocal [format["%1_deaderer_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorOrange";
			_marker setMarkerTypeLocal "hd_warning";
			_marker setMarkerTextLocal "Human Remains";
			_markers pushBack _marker;
		} foreach _bones;

		{
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal "Unknown Civilian";
			_markers pushBack _marker;
		} foreach _civs;

		{
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal "Medic";
			_markers pushBack _marker;
		} foreach _medics;
	};
	
sleep 30;

{
	deleteMarkerLocal _x;
} foreach _markers;