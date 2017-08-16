/*
	File: fn_cop_classification_organize.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de

	Info:
	1 - Kavala
	2 - BP_West
	3 - BP_West2
	4 - BP_Mitte
	5 - BP_Ueberall
	6 - BP_East
	7 - AP1
	8 - AP2
	9 - HWP
	10 - Sonstige
*/

private ["_display","_lBOX","_map","_objects"];

if(isnull(findDisplay 5488)) exitWith {};
disableSerialization;
if(Radar_activ) exitWith {hint "Das Radar arbeitet bereits"};
Radar_activ = true;

_display = findDisplay 5488;
_lBOX = _display displayCtrl 1500;
_map = _display displayctrl 38502;

lbclear _lBOX;

[_map,1,0.1,getpos player] call lhm_fnc_setMapPosition;

_id = _lBOX lbadd "Scanning...";

_lBOX lbSetColor[_id,[0.004,0.875,0.004,1]];

sleep 5;
_objects = [];
_allObjects = [];
_objectsAir = allMissionObjects "Air";
_objectsCAR = allMissionObjects "Landvehicle";
_objectsShip = allMissionObjects "Ship";

{
	_allObjects append _x;
} foreach [_objectsAir,_objectsCAR,_objectsShip];

{
	if((player distance _x) < 2000) then {
		_objects pushback _x;

	};


} foreach _allObjects;
if(isnull(findDisplay 5488)) exitWith {};

_objects = _objects - [vehicle player];

lbclear _lBOX;

if(_objects isEqualTo []) then {
	_id = _lBOX lbadd "No Vehicles found";
	_lBOX lbsetdata[_id,""];
	_lBOX lbSetColor[_id,[1,0,0,1]];



} else {


	{
		switch (true) do
		{
			case (_x iskindof "helicopter"):
			{
				_id = _lBOX lbadd format["Helicopter - %1m",round(_x distance (vehicle player))];
				_lBOX lbsetdata[_id,netid _x];
				_lBOX lbSetColor[_id,[0.996,0.18,0.18,1]];
			};

			case (_x iskindof "plane"):
			{
				_id = _lBOX lbadd format["Plane - %1m",round(_x distance (vehicle player))];
				_lBOX lbsetdata[_id,netid _x];
				_lBOX lbSetColor[_id,[1,0.502,0,1]];
			};

			case (_x iskindof "LandVehicle"):
			{
				_id = _lBOX lbadd format["Landvehicle - %1m",round(_x distance (vehicle player))];
				_lBOX lbsetdata[_id,netid _x];
				_lBOX lbSetColor[_id,[0.345,0.98,0.345,1]];
			};

			case (_x iskindof "Ship"):
			{
				_id = _lBOX lbadd format["Ship - %1m",round(_x distance (vehicle player))];
				_lBOX lbsetdata[_id,netid _x];
				_lBOX lbSetColor[_id,[0.18,0.392,0.996,1]];
			};


		};



	} foreach _objects;

	if(lbSize _lBOX == 0) then {
		_id = _lBOX lbadd "No Vehicles found";
		_lBOX lbsetdata[_id,""];
		_lBOX lbSetColor[_id,[1,0,0,1]];

	};


};

Radar_activ = false;


