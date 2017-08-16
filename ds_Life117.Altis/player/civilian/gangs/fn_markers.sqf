/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Map markers for gang members
	*/
private["_members","_marker","_unit","_counter","_markers","_invaders"];

sleep 0.5;
((findDisplay 12) displayCtrl 51) mapCenterOnCamera false;
_members = [];
_markers = [];
_counter = 0;
_invaders = [];
if(visibleMap)then
	{
		{
			if((group _x) == (group player))then
				{
				_members pushBack _x;
				};
		}forEach playableUnits;
	};

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format["%1", _x getVariable["name",name _x]];
	_markers set[count _markers,[_marker,_x]];
} foreach _members;

if((getPlayerUID player in DS_clanBase1)&&(baseClan1 getVariable ["baseMarkers",false]))then
	{
		{
		if((!(getPlayerUID _x in DS_clanBase1))&&(_x distance baseClan1 < 600))then
			{
			_invaders pushBack _x;
			};
		}forEach playableUnits;
	};
if((getPlayerUID player in DS_clanBase2)&&(baseClan2 getVariable ["baseMarkers",false]))then
	{
		{
		if((!(getPlayerUID _x in DS_clanBase2))&&(_x distance baseClan2 < 600))then
			{
			_invaders pushBack _x;
			};
		}forEach playableUnits;
	};
if((getPlayerUID player in DS_clanBase3)&&(baseClan3 getVariable ["baseMarkers",false]))then
	{
		{
		if((!(getPlayerUID _x in DS_clanBase3))&&(_x distance baseClan3 < 600))then
			{
			_invaders pushBack _x;
			};
		}forEach playableUnits;
	};
if((getPlayerUID player in DS_clanBase4)&&(baseClan4 getVariable ["baseMarkers",false]))then
	{
		{
		if((!(getPlayerUID _x in DS_clanBase4))&&(_x distance baseClan4 < 600))then
			{
			_invaders pushBack _x;
			};
		}forEach playableUnits;
	};
if((getPlayerUID player in DS_clanBase5)&&(baseClan5 getVariable ["baseMarkers",false]))then
	{
		{
		if((!(getPlayerUID _x in DS_clanBase5))&&(_x distance baseClan5 < 600))then
			{
			_invaders pushBack _x;
			};
		}forEach playableUnits;
	};
if((getPlayerUID player in DS_clanBase6)&&(baseClan6 getVariable ["baseMarkers",false]))then
	{
		{
		if((!(getPlayerUID _x in DS_clanBase6))&&(_x distance baseClan6 < 600))then
			{
			_invaders pushBack _x;
			};
		}forEach playableUnits;
	};
if((getPlayerUID player in DS_clanBase7)&&(baseClan6 getVariable ["baseMarkers",false]))then
	{
		{
		if((!(getPlayerUID _x in DS_clanBase7))&&(_x distance baseClan7 < 600))then
			{
			_invaders pushBack _x;
			};
		}forEach playableUnits;
	};
if((getPlayerUID player in DS_clanBase8)&&(baseClan8 getVariable ["baseMarkers",false]))then
	{
		{
		if((!(getPlayerUID _x in DS_clanBase8))&&(_x distance baseClan8 < 600))then
			{
			_invaders pushBack _x;
			};
		}forEach playableUnits;
	};
{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Unknown Person";
	_markers set[count _markers,[_marker,_x]];
} foreach _invaders;

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

















