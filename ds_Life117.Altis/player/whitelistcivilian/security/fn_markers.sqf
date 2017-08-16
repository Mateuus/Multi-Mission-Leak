/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Shows players with distance to you, depending on your level
	*/
private["_civs","_cops","_marker","_unit","_counter","_markers","_security","_players","_special"];

sleep 0.5;
((findDisplay 12) displayCtrl 51) mapCenterOnCamera false;
_cops = [];
_markers = [];
_mcu = [];
_civs = [];
_wlcivs = [];
_security = [];
_counter = 0;
_distance = 50;
_copDistance = 250;
_special = [];
if((DS_infoArray select 19) > 0)then{_distance = 100};
if((DS_infoArray select 19) > 1)then{_copDistance = 500};
if((DS_infoArray select 19) > 7)then{_copDistance = 1000};
if((DS_infoArray select 19) > 8)then{_distance = 150};
if((DS_infoArray select 19) > 11)then{_distance = 200};
if((DS_infoArray select 19) > 16)then{_distance = 250};
if((DS_infoArray select 19) > 17)then{_copDistance = 2000};
if((DS_infoArray select 19) > 25)then{_copDistance = 3000};
if((DS_infoArray select 19) > 26)then{_distance = 300};
if(visibleMap)then
	{
		{
			if((side _x == civilian)&&((_x distance hosp1_1_2_3_1_1_3_1_1 < 300)||(_x distance hosp1_1_2_3_1_1_3_1_1_1 < 300)))then
				{
				_civs pushBack _x;
				};
			if(((DS_infoArray select 19) > 9)&&(_x getVariable ["security",false]))then
				{
				_security pushBack _x;
				};
			if((side _x == west)&&(_x distance player < _copDistance))then
				{
				_cops pushBack _x;
				};
			if((side _x == civilian)&&(_x distance player < _distance)&&(_x != player))then
				{
				_civs pushBack _x;
				};
			if((side _x == independent)&&(!(_x getVariable ["security",false]))&&(_x distance player < _distance)&&(_x != player))then
				{
				_wlcivs pushBack _x;
				};
		}forEach playableUnits;
	};
{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Cop";
	_markers set[count _markers,[_marker,_x]];
} foreach _cops;

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
} foreach _wlcivs;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format ["%1",name _x];
	_markers set[count _markers,[_marker,_x]];
} foreach _security;

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
