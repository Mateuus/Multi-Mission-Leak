/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Shows other cops on the map, will control all the GCU map features also
	*/
private["_wlCivs","_special","_airVehs","_spikes","_mcuTruck","_civs","_mcu","_cops","_marker","_unit","_counter","_markers","_copCars","_players","_roadCars","_bones"];

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
_mcuTruck = false;
if(visibleMap)then
	{
		{
			if(side _x == west)then
				{
				_cops pushBack _x;
				};
			if(((side _x) != west)&&((_x distance (getMarkerPos "police_hq_1") < 120)||(_x distance (getMarkerPos "cop_spawn_3") < 120)||(_x distance (getMarkerPos "cop_spawn_4") < 120)||(_x distance (getMarkerPos "police_hq_2") < 120)||(_x distance (getMarkerPos "cop_spawn_5") < 120)||(_x distance (getMarkerPos "jailDoor") < 120)))then
				{
				_civs pushBack _x;
				};
		}forEach playableUnits;
		{
			if(_x getVariable ["isMCU",false])then
				{
				_mcu pushBack _x;
				_mcuTruck = true;
				};
			if((_x getVariable ["policeVehicle",false])&&((count crew _x) == 0))then
				{
				_copCars pushBack _x;
				};
			if(_x getVariable ["impound",false])then
				{
				_special pushBack _x;
				};
			/*
			if((!(_x getVariable ["policeVehicle",false]))&&((count crew _x) == 0)&&(isOnRoad _x)&&((player getVariable ["policeSquad",""]) == "Highway Patrol")&&(_x isKindOf "LandVehicle"))then
				{
				_roadCars pushBack _x;
				};
			*/
			if(((player getVariable ["policeSquad",""]) == "Coast Guard")&&((vehicle player) isKindOf "Air")&&((_x) != (vehicle player))&&((_x) isKindOf "Air")&&(player distance _x < 1000))then
				{
				_airVehs pushBack [_x,round((getPos _x) select 2)];
				};
		}forEach vehicles;
		if(_mcuTruck)then
			{
			if(((_mcu select 0) distance player < 50)&&(!((_mcu select 0) getVariable ["packed",false])))then
				{
				if((DS_infoArray select 21) > 12)then
					{
						{
						if((_x distance player < 400)&&(side _x == civilian))then {_civs pushBack _x;};
						if((_x distance player < 400)&&(side _x == independent))then {_wlCivs pushBack _x;};
						} foreach playableUnits;
					}
					else
					{
						{
						if((_x distance player < 300)&&(side _x == civilian))then {_civs pushBack _x;};
						if((_x distance player < 300)&&(side _x == independent))then {_wlCivs pushBack _x;};
						} foreach playableUnits;
					};
				if(DS_airBan)then
					{
						{
							if(((getPos (_x) select 2) > 50)&&(_x distance player < 10000)&&(side (driver _x) != west))then
								{
								_airVehs pushBack [_x,round((getPos _x) select 2)];
								};
						} foreach (allMissionObjects "Air");
					};
				};
			};
		/*
		{
			if((isOnRoad _x)&&((player getVariable ["policeSquad",""]) == "Highway Patrol"))then
				{
				_bones pushBack _x;
				};
		} foreach allMissionObjects "Land_HumanSkeleton_F";
		*/
	};
{
	_marker = createMarkerLocal [format["%1_marker",(_x select 0)],visiblePosition (_x select 0)];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format ["Unknown Air Vehicle (%1m)",(_x select 1)];
	_markers set[count _markers,[_marker,(_x select 0)]];
} foreach _airVehs;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Spike Strips";
	_markers set[count _markers,[_marker,_x]];
} foreach _spikes;
	
{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format["(%2) %1  (%3)", _x getVariable["name",name _x], _x getVariable["rankStr","Unknown Rank"],_x getVariable["policeSquad",""]];
	_markers set[count _markers,[_marker,_x]];
} foreach _cops;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "--!- MCU -!--";
	_markers set[count _markers,[_marker,_x]];
} foreach _mcu;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Police Vehicle";
	_markers set[count _markers,[_marker,_x]];
} foreach _copCars;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "Colorred";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Impound requested";
	_markers set[count _markers,[_marker,_x]];
} foreach _special;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Civilian";
	_markers set[count _markers,[_marker,_x]];
} foreach _civs;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "WL Civilian";
	_markers set[count _markers,[_marker,_x]];
} foreach _wlCivs;

{
	_marker = createMarkerLocal [format["%1_deaderer_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerTypeLocal "hd_warning";
	_marker setMarkerTextLocal "Human Remains";
	_markers set[count _markers,[_marker,_x]];
} foreach _bones;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "Colorred";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Abandoned Vehicle";
	_markers set[count _markers,[_marker,_x]];
} foreach _roadCars;

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

















