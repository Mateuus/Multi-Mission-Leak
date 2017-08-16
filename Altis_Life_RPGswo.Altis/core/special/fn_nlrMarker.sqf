#include "..\..\macros.hpp"
/*
	File: fn_nlrMarker.sqf
	Author: MarkusSR1984
	
	Description:
	Erzeugt einen Marker und einen Timer beim Spieler wenn er unter der NLR steht
	+ Warnmeldung und Log in DB wenn er die Zone betritt
*/

private ["_markers","_restore","_nlrMarker"];

_restore = param [0,false,[false]];
_position = param [1,[0,0,0],[[]]];
_deathTime = param [2,serverTime,[0]];
_nlrTime = (15 * 60);
_radius = 3000;
_warnedPlayer = false;
_loggedNLR = false;
if (isNil "DWEV_nlrWarnings") then {DWEV_nlrWarnings = 0;};

if (isNil "DWEV_nlrZones") then {DWEV_nlrZones = [];};
if (isNil "DWEV_nlrZonesController") then {DWEV_nlrZonesController = false;};

if (!_restore) then 
{
	_nlrMarker = [_position,_deathTime];
	DWEV_nlrZones pushBack _nlrMarker;
	profileNamespace setVariable ["DWEV_nlrZones",DWEV_nlrZones];
	saveProfileNamespace;
};


if (!DWEV_nlrZonesController) then 
{
	DWEV_nlrZonesController = true;
	_zoneCount = (count DWEV_nlrZones);
	_markers = [];

	while {DWEV_nlrZonesController} do
	{
		_remove = [];
		_exitTimer = false;
		{
			_pos = (_x select 0);
			_timestamp = (_x select 1);
			_time = ((_timestamp + _nlrTime) - serverTime);
			_exitTimer = false;
			 
			if (_time > 0) then 
			{
				_mapmarker = createMarkerLocal [format["%1_nlr_mapmarker",_forEachIndex],_pos];
				_mapmarker setMarkerColorLocal "ColorRed";
				_mapmarker setMarkerShapeLocal "ELLIPSE";
				_mapmarker setMarkerSizeLocal [_radius, _radius];
				
				_timemarker = createMarkerLocal [format["%1_nlr_timemarker",_forEachIndex],_pos];
				_timemarker setMarkerColorLocal "ColorBlack";
				_timemarker setMarkerTypeLocal "KIA";
				_timemarker setMarkerTextLocal "";
				
				_markers pushBack [_mapmarker, _timemarker , _timestamp];
			}
			else
			{
				_remove pushBack (_forEachIndex);
			};
			
							
		} forEach DWEV_nlrZones;
		
		{
			DWEV_nlrZones set [_x,-1];
			DWEV_nlrZones = DWEV_nlrZones - [-1];
		} count _remove;
		
		profileNamespace setVariable ["DWEV_nlrZones",DWEV_nlrZones];
		saveProfileNamespace;
		
		if ((count DWEV_nlrZones) > 0) then
		{
			while {!_exitTimer} do 
			{
				// Text auf Karte Aktualisieren bis 1 NRL Zone auf 0 läuft und aktualisiert werden muss
				//_marker setMarkerTextLocal format["%1",getPlayerDName(_x)];
				{
							_timestamp = (_x select 2);
							_time = ((_timestamp + _nlrTime) - serverTime);
							
							(_x select 1) setMarkerTextLocal format [" Restzeit: %1",([_time] call DWEV_fnc_formatTime)];
							if (_time <= 0) exitWith {_exitTimer = true;};
											
				} count _markers;
				
				{
					_pos = (_x select 0);
					_dist = (player distance _pos);
					_isKavalla = (if (((getMarkerPos "trigger_kavala_markt_weis") distance player) < 425) then {true} else {false});
					//_isKavallaBig = (if (((getMarkerPos "trigger_kavala_markt_weis") distance player) < 1000) then {true} else {false});
															
				
						
					if ((_dist < (_radius)) && !_isKavalla ) then
					{
						_warnedPlayer = true;
						if (DWEV_nlrWarnings >= 60)	then
						{
							[player,"New Life Regelbruch"] remoteExec ["CLIENT_fnc_kickMe",2];
						}
						else
						{
							DWEV_nlrWarnings = (DWEV_nlrWarnings + 1);
							hint format ["!!! WARNUNG !!!\n verlasse unverzüglich die Sperrzone\n\n%1",[(60 - DWEV_nlrWarnings)] call DWEV_fnc_formatTime];
						};
					}
					else
					{
						if (_warnedPlayer) then
						{
							hint "Du hast die Sparrzone verlassen";
							DWEV_nlrWarnings = 0;
							_warnedPlayer = false;
						};
					};
				
				} count DWEV_nlrZones;
				
				sleep 1;
				
				if (_zoneCount != (count DWEV_nlrZones)) exitWith {_exitTimer = true;}; // UPDATE !!!
			};
		} 
		else
		{
			DWEV_nlrZonesController = false;
		};
		
		{
			deleteMarkerLocal (_x select 0);
			deleteMarkerLocal (_x select 1);
			false;
		} count _markers;
		_markers = [];
	};
};