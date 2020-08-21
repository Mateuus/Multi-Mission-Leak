/*
	File: fn_tracker.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Attaches a tracking device to a vehicle.
*/
private["_unit","_markers","_vehicleName"];
_unit = cursorObject;

if((!(_unit isKindOf "LandVehicle"))&&(!(_unit getVariable ["restrained",false]))) exitWith {hint "You cannot add a tracking unit to this."};
if(player distance _unit > 7) exitWith {hint "Musisz stać minimum 7m od pojazdu!"};
if(_unit in life_tracked) exitWith {hint "Twój następny pojazd posiada!"};
if(!([false,"tracker",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 4.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};

life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Nie jesteś w pobliżu!","PLAIN"];};

life_tracked set [count life_tracked, _unit];
titleText["Podłożyłeś.","PLAIN"];	

for "_i" from 0 to 1 step 0 do {
	waitUntil {visibleMap};
	_markers = [];

	{
		if(!isNil "_x") then
		{
			if(!isNull _x) then
			{
				_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
				_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
				_marker setMarkerColorLocal "ColorGreen";
				_marker setMarkerTypeLocal "Mil_destroy";
				_marker setMarkerTextLocal format["%1", _vehicleName];
				_markers set[count _markers,[_marker,_x]];
			};
		};
	} forEach life_tracked;
			
	while {visibleMap} do
	{
		{
			private["_marker","_veh"];
			_marker = _x select 0;
			_veh = _x select 1;
			if(!isNil "_veh") then
			{
				if(!isNull _veh) then
				{
					_marker setMarkerPosLocal (getPos _veh);
				};
			};
		} forEach _markers;
		if(!visibleMap) exitWith {};
		uiSleep 1;
	};
	
	{deleteMarkerLocal (_x select 0);} forEach _markers;
};