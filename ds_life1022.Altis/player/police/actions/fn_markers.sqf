/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Shows other cops on the map, will control all the GCU map features also
*/

if(player getVariable["restrained",false])exitwith{};

private["_mcuDistanceChecker","_mcuDistanceMax","_myDogs","_wlCivs","_special","_airVehs","_spikes","_mcuTruck","_civs","_mcu","_cops","_marker","_unit","_counter","_markers","_copCars","_players","_roadCars","_bones"];

sleep 0.5;
((findDisplay 12) displayCtrl 51) mapCenterOnCamera false;
_cops = [];
_markers = [];
_mcu = [];
_civs = [];
_wlCivs = [];
_copCars = [];
_counter = 0;
_spikes = [];
_airVehs = [];
_special = [];
_bones = [];
_roadCars = [];
_myDogs = [];
_mcuTruck = false;

if((player getVariable ["policeSquad",""]) == "Highway Patrol")then{[] spawn DS_cop_markersHWP;};
if((player getVariable ["policeSquad",""]) == "Coast Guard")then{[] spawn DS_cop_markersCG;};

if(visibleMap)then
	{
	if(!isNil "DS_myDog")then
		{
		_myDogs pushBack DS_myDog;
		};
		{
			if(((side _x) isEqualTo west)&&(!(_x getVariable["restrained",false])))then
				{
				_cops pushBack _x;
				};
			if(((side _x) isEqualTo civilian)&&((_x distance (getMarkerPos "cop_spawn_7") < 120)||(_x distance (getMarkerPos "cop_spawn_6") < 120)||(_x distance (getMarkerPos "police_hq_1") < 120)||(_x distance (getMarkerPos "cop_spawn_3") < 120)||(_x distance (getMarkerPos "cop_spawn_4") < 120)||(_x distance (getMarkerPos "police_hq_2") < 120)||(_x distance (getMarkerPos "cop_spawn_5") < 120)||(_x distance (getMarkerPos "jailbomb") < 120)))then
				{
				_civs pushBack _x;
				};
			if(((side _x) isEqualTo independent)&&((_x distance (getMarkerPos "cop_spawn_7") < 120)||(_x distance (getMarkerPos "cop_spawn_6") < 120)||(_x distance (getMarkerPos "police_hq_1") < 120)||(_x distance (getMarkerPos "cop_spawn_3") < 120)||(_x distance (getMarkerPos "cop_spawn_4") < 120)||(_x distance (getMarkerPos "police_hq_2") < 120)||(_x distance (getMarkerPos "cop_spawn_5") < 120)||(_x distance (getMarkerPos "jailbomb") < 120)))then
				{
				_wlCivs pushBack _x;
				};
		}forEach playableUnits;
		{
			if(_x getVariable ["isMCU",false])then
				{
				if(!(_x getVariable ["stolen",false]))then
					{
					_mcu pushBack _x;
					_mcuTruck = true;
					};
				};
			if(_x getVariable ["isMCUWater",false])then
				{
				if(!(_x getVariable ["stolen",false]))then
					{
					_mcu pushBack _x;
					_mcuTruck = true;
					};
				};
			if((_x getVariable ["policeVehicle",false])&&((count crew _x) == 0))then
				{
				_copCars pushBack _x;
				};
			if(_x getVariable ["impound",false])then
				{
				_special pushBack _x;
				};
		}forEach vehicles;
		if(_mcuTruck)then {
			_mcuDistanceChecker = 50;
			_mcuDistanceMax = 250;
			if((DS_infoArray select 21) > 12)then {
				_mcuDistanceMax = 400;
			};
			if(miscInfoArray select 8)then {
				_mcuDistanceChecker = 100;
				_mcuDistanceMax = 1000;
			};
			if(((_mcu select 0) distance player < _mcuDistanceChecker)&&(!((_mcu select 0) getVariable ["packed",false])))then {
				{
				if(!(_x getVariable ["realModeMan",false]))then {
					if((_x distance player < _mcuDistanceMax)&&((side _x) isEqualTo civilian))then {_civs pushBack _x;};
					if((_x distance player < _mcuDistanceMax)&&((side _x) isEqualTo independent))then {_wlCivs pushBack _x;};
				} else {
					if((_x distance player < 50)&&((side _x) isEqualTo civilian))then {_civs pushBack _x;};
				};
				} foreach playableUnits;
				if(DS_airBan)then {
					{
						if(((getPos (_x) select 2) > 50)&&(_x distance player < 10000)&&(!((side (driver _x)) isEqualTo west)))then
							{
							_airVehs pushBack [_x,round((getPos _x) select 2)];
							};
					} foreach (allMissionObjects "Air");
				};
			};
		};
	};
{
	_marker = createMarkerLocal [format["%1_marker",(_x select 0)],visiblePosition (_x select 0)];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format ["Unknown Air Vehicle (%1m)",(_x select 1)];
	_markers pushBack [_marker,(_x select 0)];
} foreach _airVehs;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Spike Strips";
	_markers pushBack [_marker,_x];
} foreach _spikes;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format["(%2) %1  (%3)", _x getVariable["name",name _x], _x getVariable["rankStr","Unknown Rank"],_x getVariable["policeSquad",""]];
	_markers pushBack [_marker,_x];
} foreach _cops;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "My Dog";
	_markers pushBack [_marker,_x];
} foreach _myDogs;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "--!- MCU -!--";
	_markers pushBack [_marker,_x];
} foreach _mcu;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Police Vehicle";
	_markers pushBack [_marker,_x];
} foreach _copCars;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "Colorred";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Impound requested";
	_markers pushBack [_marker,_x];
} foreach _special;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Civilian";
	_markers pushBack [_marker,_x];
} foreach _civs;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "WL Civilian";
	_markers pushBack [_marker,_x];
} foreach _wlCivs;

while{visibleMap}do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 1;
		_counter = _counter + 1;
		if(_counter > 30)exitwith{};
	};
{
	deleteMarkerLocal (_x select 0);
} foreach _markers;