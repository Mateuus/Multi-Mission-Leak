#include "..\..\script_macros.hpp"
#include "..\lb_script_macros.hpp"
/*
	File: fn_visVehInfo.sqf
	Author: Leon "DerL30N" Beeser
	
	Description:
	Measures, stores and calculates with the help of mathematics: Fuel consumption, range, tank volume, speedometer and maybe more...
*/
private["_queryResult","_vehSaveable","_danzahln","_rawdata","_reichweite","_gesZrglDistanzKm","_zrglDistanzKmFuel","_vehLastUpdateNo","_fuel","_dis","_dataRow","_vehChecked","_runTime","_displayedDistance"];
private["_1f","_2f","_3f","_4f","_5f","_6f","_7f","_8f","_9f","_10f","_11f","_12f","_13f","_14f","_15f","_16f","_17f","_18f","_19f","_20f","_21f","_22f","_23f","_24f","_25f"];
private["_1d","_2d","_3d","_4d","_5d","_6d","_7d","_8d","_9d","_10d","_11d","_12d","_13d","_14d","_15d","_16d","_17d","_18d","_19d","_20d","_21d","_22d","_23d","_24d","_25d"];

_queryResult = [_this,0,[],[[]]] call BIS_fnc_param;
_vehSaveable = [_this,1,false,[true]] call BIS_fnc_param;
_runTime = diag_tickTime;
diag_log format["--- VIS -> Started [%3s] : Perm Veh: %2; DB ROW: %1 ---",_queryResult,_vehSaveable,_runTime];

if (_vehSaveable) then {
	if (!(count _queryResult == 5)) exitWith {diag_log format["--- VIS -> Error -> Perm Veh: %2; DB ROW: %1 ---",_queryResult,_vehSaveable];};
	_danzahln = _queryResult select 0;
	_rawdata = _queryResult select 1;
	_reichweite = _queryResult select 2;
	_gesZrglDistanzKm = _queryResult select 3;
	_zrglDistanzKmFuel = _queryResult select 4;
	_queryResult = Nil;
	_vehLastUpdateNo = _rawdata select 0;
	_fuel = _rawdata select 1;
	_dis = _rawdata select 2;
	_rawdata = Nil;
	_1f = _fuel select 0; _2f = _fuel select 1; _3f = _fuel select 2; _4f = _fuel select 3; _5f = _fuel select 4; _6f = _fuel select 5; _7f = _fuel select 6; _8f = _fuel select 7; _9f = _fuel select 8; _10f = _fuel select 9; _11f = _fuel select 10; _12f = _fuel select 11; _13f = _fuel select 12; _14f = _fuel select 13; _15f = _fuel select 14; _16f = _fuel select 15; _17f = _fuel select 16; _18f = _fuel select 17; _19f = _fuel select 18; _20f = _fuel select 19; _21f = _fuel select 20; _22f = _fuel select 21; _23f = _fuel select 22; _24f = _fuel select 23; _25f = _fuel select 24;
	_1d = _dis select 0; _2d = _dis select 1; _3d = _dis select 2; _4d = _dis select 3; _5d = _dis select 4; _6d = _dis select 5; _7d = _dis select 6; _8d = _dis select 7; _9d = _dis select 8; _10d = _dis select 9; _11d = _dis select 10;	_12d = _dis select 11; _13d = _dis select 12; _14d = _dis select 13; _15d = _dis select 14; 	_16d = _dis select 15; _17d = _dis select 16; _18d = _dis select 17; _19d = _dis select 18; _20d = _dis select 19; _21d = _dis select 20; _22d = _dis select 21; _23d = _dis select 22; _24d = _dis select 23; _25d = _dis select 24;
	_fuel = Nil;
	_dis = Nil;
	diag_log "--- VIS -> Config finished -> Perm Vehicle -> Updated Vars ---";
	_vehChecked = true;
} else {
	_dataRow = (vehicle player) getVariable ["vis_dataRow",[]];
	if ((isNil "_dataRow") OR (count _dataRow isEqualTo 0)) then {
		_danzahln = 0;
		_vehLastUpdateNo = 0;
		_1f = 0; _2f = 0; _3f = 0; _4f = 0; _5f = 0; _6f = 0; _7f = 0; _8f = 0; _9f = 0; _10f = 0; _11f = 0; _12f = 0; _13f = 0; _14f = 0; _15f = 0; _16f = 0; _17f = 0; _18f = 0; _19f = 0; _20f = 0; _21f = 0; _22f = 0; _23f = 0; _24f = 0; _25f = 0;
		_1d = 0; _2d = 0; _3d = 0; _4d = 0; _5d = 0; _6d = 0; _7d = 0; _8d = 0; _9d = 0; _10d = 0; _11d = 0; _12d = 0; _13d = 0; _14d = 0; _15d = 0; _16d = 0; _17d = 0; _18d = 0; _19d = 0; _20d = 0; _21d = 0; _22d = 0; _23d = 0; _24d = 0; _25d = 0;
		_reichweite = 0;
		_gesZrglDistanzKm = 0;
		_zrglDistanzKmFuel = 0;
		diag_log "--- VIS -> Config finished -> Rental Vehicle -> Created Vars to 0 ---";
		_vehChecked = true;
	} else {
		_danzahln = _dataRow select 0;
		_rawdata = _dataRow select 1;
		_reichweite = _dataRow select 2;
		_gesZrglDistanzKm = _dataRow select 3;
		_zrglDistanzKmFuel = _dataRow select 4;
		_dataRow = Nil;
		_vehLastUpdateNo = _rawdata select 0;
		_fuel = _rawdata select 1;
		_dis = _rawdata select 2;
		_rawdata = Nil;
		_1f = _fuel select 0; _2f = _fuel select 1; _3f = _fuel select 2; _4f = _fuel select 3; _5f = _fuel select 4; _6f = _fuel select 5; _7f = _fuel select 6; _8f = _fuel select 7; _9f = _fuel select 8; _10f = _fuel select 9; _11f = _fuel select 10; _12f = _fuel select 11; _13f = _fuel select 12; _14f = _fuel select 13; _15f = _fuel select 14; _16f = _fuel select 15; _17f = _fuel select 16; _18f = _fuel select 17; _19f = _fuel select 18; _20f = _fuel select 19; _21f = _fuel select 20; _22f = _fuel select 21; _23f = _fuel select 22; _24f = _fuel select 23; _25f = _fuel select 24;
		_1d = _dis select 0; _2d = _dis select 1; _3d = _dis select 2; _4d = _dis select 3; _5d = _dis select 4; _6d = _dis select 5; _7d = _dis select 6; _8d = _dis select 7; _9d = _dis select 8; _10d = _dis select 9; _11d = _dis select 10;	_12d = _dis select 11; _13d = _dis select 12; _14d = _dis select 13; _15d = _dis select 14; 	_16d = _dis select 15; _17d = _dis select 16; _18d = _dis select 17; _19d = _dis select 18; _20d = _dis select 19; _21d = _dis select 20; _22d = _dis select 21; _23d = _dis select 22; _24d = _dis select 23; _25d = _dis select 24;
		_fuel = Nil;
		_dis = Nil;
		diag_log "--- VIS -> Config finished -> Rental Vehicle -> Updated Vars ---";
		_vehChecked = true;
	};
};
if (isNil "_vehChecked") exitWith { diag_log "--- VIS -> Error -> Could not Setup Vars ---"; };
_vehChecked = Nil;
_displayedDistance = _gesZrglDistanzKm;
vis_saveNow = false;
vis_isRunning = true;

private["_veh","_updateTimes","_class","_vehname","_fuelCap","_modActive","_p"];
	
_veh = vehicle player;
_updateTimes = 5;
_p = "%";
_class = typeOf (_veh);
_vehname = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");
_fuelCap = getNumber(configFile >> "CfgVehicles" >> _class >> "fuelCapacity");
_modActive = LB_SETTINGS(getNumber,"consumpMod");

disableSerialization;
18 cutRsc["vehInfo","PLAIN"];

private["_idiff","_average"];

while {((!vis_saveNow) && (vis_isActive))} do 
{
	if ((_veh != player) && (driver _veh == player) && ((_veh isKindOf "Car") OR (_veh isKindOf "Air") OR (_veh isKindOf "Ship"))) then 
	{ 
		if ((_veh != player) && (driver _veh == player) && ((isEngineOn _veh) OR (vis_ignitionOn))) then 
		{
			private["_treibstoff1","_position1"];
			
			_treibstoff1 = (fuel _veh);
			_position1 = getPosATL _veh;
			
			sleep 1;

			if ((_veh != player) && (driver _veh == player) && ((isEngineOn _veh) OR (vis_ignitionOn))) then 
			{
				private["_treibstoff2","_position2","_zrglDistanz","_fuelInLiterNOW1","_fuelInLiterNOW2"];
				
				_treibstoff2 = (fuel _veh);
				_position2 = getPosATL _veh;
				
				_zrglDistanz = (_position1 vectorDistance _position2);//Distanznahme (m)
				
				_fuelInLiterNOW1 = _fuelCap * _treibstoff1;
				_fuelInLiterNOW2 = _fuelCap * _treibstoff2;
				_fuelUseNOW = _fuelInLiterNOW1 - _fuelInLiterNOW2;//aktueller Treibstoff fluss (l)
				
				if (_fuelUseNOW > 0) then 
				{
					private["_kmh","_zrglDistanzKm","_i"];
					
					_kmh = _zrglDistanz * 3.6;
					_zrglDistanzKm = _zrglDistanz / 1000;//m zu km
					_i = _fuelCap - _fuelInLiterNOW2;//Differenz zwischen aktuellem Tank- und maximalem Tankstand
					
					if (isNil "_idiff") then { _idiff = _fuelCap - _fuelInLiterNOW2; };
					if (_i < _idiff) then { _zrglDistanzKmFuel = _zrglDistanzKm; };
					
					_gesZrglDistanzKm = _gesZrglDistanzKm + _zrglDistanzKm;//Summe gefahrene km
					_zrglDistanzKmFuel = _zrglDistanzKmFuel + _zrglDistanzKm;//Summe gefahrene km seit letztem Tanken
					
					_fuelInLiterNOW2 = round (100 * (_fuelInLiterNOW2 / _fuelCap));//Daten f�r Tankanzeige in %
					_displayedDistance = round (_gesZrglDistanzKm * (10 ^ 1)) / (10 ^ 1);
					
					if ((_kmh > 3.6) && (_gesZrglDistanzKm > 0.001)) then 
					{
						if (_vehLastUpdateNo == 25) then { _vehLastUpdateNo = 0; };
						_vehLastUpdateNo = _vehLastUpdateNo + 1;
						
						switch (_vehLastUpdateNo) do 
						{
							case 1 : {_1d = _zrglDistanzKm; _1f = _fuelUseNOW;};
							case 2 : {_2d = _zrglDistanzKm; _2f = _fuelUseNOW;};
							case 3 : {_3d = _zrglDistanzKm; _3f = _fuelUseNOW;};
							case 4 : {_4d = _zrglDistanzKm; _4f = _fuelUseNOW;};
							case 5 : {_5d = _zrglDistanzKm; _5f = _fuelUseNOW;};
							case 6 : {_6d = _zrglDistanzKm; _6f = _fuelUseNOW;};
							case 7 : {_7d = _zrglDistanzKm; _7f = _fuelUseNOW;};
							case 8 : {_8d = _zrglDistanzKm; _8f = _fuelUseNOW;};
							case 9 : {_9d = _zrglDistanzKm; _9f = _fuelUseNOW;};
							case 10 : {_10d = _zrglDistanzKm; _10f = _fuelUseNOW;};
							case 11 : {_11d = _zrglDistanzKm; _11f = _fuelUseNOW;};
							case 12 : {_12d = _zrglDistanzKm; _12f = _fuelUseNOW;};
							case 13 : {_13d = _zrglDistanzKm; _13f = _fuelUseNOW;};
							case 14 : {_14d = _zrglDistanzKm; _14f = _fuelUseNOW;};
							case 15 : {_15d = _zrglDistanzKm; _15f = _fuelUseNOW;};
							case 16 : {_16d = _zrglDistanzKm; _16f = _fuelUseNOW;};
							case 17 : {_17d = _zrglDistanzKm; _17f = _fuelUseNOW;};
							case 18 : {_18d = _zrglDistanzKm; _18f = _fuelUseNOW;};
							case 19 : {_19d = _zrglDistanzKm; _19f = _fuelUseNOW;};
							case 20 : {_20d = _zrglDistanzKm; _20f = _fuelUseNOW;};
							case 21 : {_21d = _zrglDistanzKm; _21f = _fuelUseNOW;};
							case 22 : {_22d = _zrglDistanzKm; _22f = _fuelUseNOW;};
							case 23 : {_23d = _zrglDistanzKm; _23f = _fuelUseNOW;};
							case 24 : {_24d = _zrglDistanzKm; _24f = _fuelUseNOW;};
							case 25 : {_25d = _zrglDistanzKm; _25f = _fuelUseNOW;};
						};
						
						if (_danzahln < 50) then { _danzahln = _danzahln + 1; };
						if (_danzahln == 50) then 
						{
							if (_updateTimes == 5) then 
							{
								_average = (_1f + _2f + _3f + _4f + _5f + _6f + _7f + _8f + _9f + _10f + _11f + _12f + _13f + _14f + _15f + _16f + _17f + _18f + _19f + _20f + _21f + _22f + _23f + _24f + _25f) / (_1d + _2d + _3d + _4d + _5d + _6d + _7d + _8d + _9d + _10d + _11d + _12d + _13d + _14d + _15d + _16d + _17d + _18d + _19d + _20d + _21d + _22d + _23d + _24d + _25d) * 100;
								_reichweite = round ((_fuelCap / _average) * 100);// Kapazit�t (l) / durch das ergebiss von durchschnittsverbrauch auf 100 km * 100 => km
								if (_modActive == 1) then {
									_average = round ((_average / 10) * (10 ^ 1)) / (10 ^ 1);
									diag_log "--- VIS -> Calc -> ConsupMod is Active";
								} else {
									_average = round (_average * (10 ^ 1)) / (10 ^ 1);
								};
								_updateTimes = -1;
							};
						
							_updateTimes = _updateTimes + 1;
						
							//diag_log format["Fuel:\n%1\n%2\n%3\n%4\n%5\n%6\n%7\n%8\n%9\n%10\n%11\n%12\n%13\n%14\n%15\n%16\n%17\n%18\n%19\n%20\n%21\n%22\n%23\n%24\n%25\nDistance\n%26\n%27\n%28\n%29\n%30\n%31\n%32\n%33\n%34\n%35\n%36\n%37\n%38\n%39\n%40\n%41\n%42\n%43\n%44\n%45\n%46\n%47\n%48\n%49\n%50",_1f,_2f,_3f,_4f,_5f,_6f,_7f,_8f,_9f,_10f,_11f,_12f,_13f,_14f,_15f,_16f,_17f,_18f,_19f,_20f,_21f,_22f,_23f,_24f,_25f,_1d,_2d,_3d,_4d,_5d,_6d,_7d,_8d,_9d,_10d,_11d,_12d,_13d,_14d,_15d,_16d,_17d,_18d,_19d,_20d,_21d,_22d,_23d,_24d,_25d];
						
							((uiNamespace getVariable "vehInfo")displayCtrl 1100)ctrlSetText format["%1",_vehname];
							((uiNamespace getVariable "vehInfo")displayCtrl 1000)ctrlSetText format["%1 km",_reichweite];
							((uiNamespace getVariable "vehInfo")displayCtrl 1001)ctrlSetText format["%1 l/100km",_average];
							((uiNamespace getVariable "vehInfo")displayCtrl 1101)ctrlSetText format["%1 %2",_fuelInLiterNOW2,_p];
							((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["%1 km",_displayedDistance];
						} else {
							((uiNamespace getVariable "vehInfo")displayCtrl 1100)ctrlSetText format["%1",_vehname];
							((uiNamespace getVariable "vehInfo")displayCtrl 1000)ctrlSetText format["--- km"];
							((uiNamespace getVariable "vehInfo")displayCtrl 1001)ctrlSetText format["--- l/100km"];
							((uiNamespace getVariable "vehInfo")displayCtrl 1101)ctrlSetText format["%1 %2",_fuelInLiterNOW2,_p];
							((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["%1 km",_displayedDistance];
						};
					} else {
						if (_danzahln == 50) then 
						{
							_average = (_1f + _2f + _3f + _4f + _5f + _6f + _7f + _8f + _9f + _10f + _11f + _12f + _13f + _14f + _15f + _16f + _17f + _18f + _19f + _20f + _21f + _22f + _23f + _24f + _25f) / (_1d + _2d + _3d + _4d + _5d + _6d + _7d + _8d + _9d + _10d + _11d + _12d + _13d + _14d + _15d + _16d + _17d + _18d + _19d + _20d + _21d + _22d + _23d + _24d + _25d) * 100;
							if (_modActive == 1) then {
								_average = round ((_average / 10) * (10 ^ 1)) / (10 ^ 1);
								diag_log "--- VIS -> Calc -> ConsupMod is Active";
							} else {
								_average = round (_average * (10 ^ 1)) / (10 ^ 1);
							};
							((uiNamespace getVariable "vehInfo")displayCtrl 1100)ctrlSetText format["%1",_vehname];
							((uiNamespace getVariable "vehInfo")displayCtrl 1000)ctrlSetText format["%1 km",_reichweite];
							((uiNamespace getVariable "vehInfo")displayCtrl 1001)ctrlSetText format["%1 l/100km",_average];
							((uiNamespace getVariable "vehInfo")displayCtrl 1101)ctrlSetText format["%1 %2",_fuelInLiterNOW2,_p];
							((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["%1 km",_displayedDistance];
						} else {
							((uiNamespace getVariable "vehInfo")displayCtrl 1100)ctrlSetText format["%1",_vehname];
							((uiNamespace getVariable "vehInfo")displayCtrl 1000)ctrlSetText format["--- km"];
							((uiNamespace getVariable "vehInfo")displayCtrl 1001)ctrlSetText format["--- l/100km"];
							((uiNamespace getVariable "vehInfo")displayCtrl 1101)ctrlSetText format["%1 %2",_fuelInLiterNOW2,_p];
							((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["%1 km",_displayedDistance];
						};
					};
				} else {
					if (vis_ignitionOn) then
					{
						_fuelInLiterNOW2 = round (100 * (_fuelInLiterNOW2 / _fuelCap));//Daten f�r Tankanzeige in %
						if (_danzahln == 50) then
						{
							_average = (_1f + _2f + _3f + _4f + _5f + _6f + _7f + _8f + _9f + _10f + _11f + _12f + _13f + _14f + _15f + _16f + _17f + _18f + _19f + _20f + _21f + _22f + _23f + _24f + _25f) / (_1d + _2d + _3d + _4d + _5d + _6d + _7d + _8d + _9d + _10d + _11d + _12d + _13d + _14d + _15d + _16d + _17d + _18d + _19d + _20d + _21d + _22d + _23d + _24d + _25d) * 100;
							_displayedDistance = round (_displayedDistance * (10 ^ 1)) / (10 ^ 1);
							if (_modActive == 1) then {
								_average = round ((_average / 10) * (10 ^ 1)) / (10 ^ 1);
								diag_log "--- VIS -> Calc -> ConsupMod is Active";
							} else {
								_average = round (_average * (10 ^ 1)) / (10 ^ 1);
							};
							((uiNamespace getVariable "vehInfo")displayCtrl 1100)ctrlSetText format["%1",_vehname];
							((uiNamespace getVariable "vehInfo")displayCtrl 1000)ctrlSetText format["%1 km",_reichweite];
							((uiNamespace getVariable "vehInfo")displayCtrl 1001)ctrlSetText format["%1 l/100km",_average];
							((uiNamespace getVariable "vehInfo")displayCtrl 1101)ctrlSetText format["%1 %2",_fuelInLiterNOW2,_p];
							((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["%1 km",_displayedDistance];
						} else {
							if (isNil "_displayedDistance") then
							{
								((uiNamespace getVariable "vehInfo")displayCtrl 1100)ctrlSetText format["%1",_vehname];
								((uiNamespace getVariable "vehInfo")displayCtrl 1000)ctrlSetText format["0 km"];
								((uiNamespace getVariable "vehInfo")displayCtrl 1001)ctrlSetText format["0 l/100km"];
								((uiNamespace getVariable "vehInfo")displayCtrl 1101)ctrlSetText format["%1 %2",_fuelInLiterNOW2,_p];
								((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["0 km"];
							} else {
								_displayedDistance = round (_displayedDistance * (10 ^ 1)) / (10 ^ 1);
								((uiNamespace getVariable "vehInfo")displayCtrl 1100)ctrlSetText format["%1",_vehname];
								((uiNamespace getVariable "vehInfo")displayCtrl 1000)ctrlSetText format["--- km"];
								((uiNamespace getVariable "vehInfo")displayCtrl 1001)ctrlSetText format["--- l/100km"];
								((uiNamespace getVariable "vehInfo")displayCtrl 1101)ctrlSetText format["%1 %2",_fuelInLiterNOW2,_p];
								((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["%1 km",_displayedDistance];
							};
						};
					};
				};
			};
		} else {
			((uiNamespace getVariable "vehInfo")displayCtrl 1100)ctrlSetText format["%1",_vehname];
			((uiNamespace getVariable "vehInfo")displayCtrl 1000)ctrlSetText format["0 km"];
			((uiNamespace getVariable "vehInfo")displayCtrl 1001)ctrlSetText format["0 l/100km"];
			((uiNamespace getVariable "vehInfo")displayCtrl 1101)ctrlSetText format["0 %1",_p];
			((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["0 km"];
		};
	};
};

if ((vis_saveNow) OR (!vis_isActive)) exitWith 
{
	private["_dataToSet"];
	vis_saveNow = false;
	vis_isRunning = false;
	18 cutText ["","PLAIN"];
	
	_dataToSet = [_vehLastUpdateNo,[_1f,_2f,_3f,_4f,_5f,_6f,_7f,_8f,_9f,_10f,_11f,_12f,_13f,_14f,_15f,_16f,_17f,_18f,_19f,_20f,_21f,_22f,_23f,_24f,_25f],[_1d,_2d,_3d,_4d,_5d,_6d,_7d,_8d,_9d,_10d,_11d,_12d,_13d,_14d,_15d,_16d,_17d,_18d,_19d,_20d,_21d,_22d,_23d,_24d,_25d]];
	if (_vehSaveable) then 
	{
		diag_log "--- VIS -> Saving -> Perm Vehicle -> Calling DB ---";
		[player,_veh,false,[_danzahln,_dataToSet,_reichweite,_gesZrglDistanzKm,_zrglDistanzKmFuel]] remoteExec ["life_fnc_vehicleInfoUpdate",RSERV];
	} else {
		_veh setVariable ["vis_dataRow",[_danzahln,_dataToSet,_reichweite,_gesZrglDistanzKm,_zrglDistanzKmFuel],true];
		diag_log "--- VIS -> Saved -> Rental Vehicle ---";
	};
	diag_log format["--- VIS -> Terminated -> Running Time -> %1s ---",(diag_tickTime - _runTime)];
};