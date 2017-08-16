/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Handles vehicle indicators and hazards
*/

if(!((getPlayerUID player) in ["76561197992718808","76561198073680229","76561198038366032","76561198008515484","76561198176900577"]))exitwith{};
//if(!(playerSide isEqualTo west))exitwith{};
//if(!(player getVariable ["policeSquad",""]) == "Highway Patrol"))exitwith{};

private ["_vehicle","_type","_side","_lightPositions","_lights","_targets"];

_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_type = [_this,1,0,[0]] call BIS_fnc_param;
_side = [_this,2,0,[0]] call BIS_fnc_param;

if(isNull _vehicle)exitwith{};
if(!(_vehicle isKindOf "LandVehicle"))exitwith{};
if(!(typeOf _vehicle in ["B_MRAP_01_F"]))exitwith{};

_lightPositions = [
	//Vehicle Class || Front Left Pos || Front Right Pos || Rear Left Pos || Rear Right Pos
	["B_MRAP_01_F",[-1.11,-4.2,-0.8],[1.125,-4.2,-0.8],[-1.074,1.42,-0.62],[1.082,1.42,-0.615]] //Hunter
];

//Handle the indicators/hazards
switch (_type) do
	{
	case 0: //Indicators
		{
		//Turn off the hazards if they are on
		if (_vehicle getVariable ["hazards",false]) then
			{
			_vehicle setVariable ["hazards",false,true];
			};

		//Toggle the indicator lights
		if (_vehicle getVariable ["indicators",false]) then
			{
			_vehicle setVariable ["indicators",false,true];
			}
			else
			{
			_vehicle setVariable ["indicators",true,true];

			_lights = _lightPositions select {(_x select 0) isEqualTo (typeOf _vehicle)} select 0;
			_targets = allPlayers select {(_x distance player) < 1000};
			[_vehicle,_lights,0,_side] remoteExec ["DS_fnc_handleVehLights",_targets];
			};
		};
	case 1: //Hazards
		{
		//Turn off the indicators if they are on
		if(_vehicle getVariable ["indicators",false])then
			{
			_vehicle setVariable ["indicators",false,true];
			};

		//Toggle the hazard lights
		if(_vehicle getVariable ["hazards",false])then
			{
			_vehicle setVariable ["hazards",false,true];
			}
			else
			{
			_vehicle setVariable ["hazards",true,true];

			_lights = _lightPositions select {(_x select 0) isEqualTo (typeOf _vehicle)} select 0;
			_targets = allPlayers select {(_x distance player) < 1000};
			[_vehicle,_lights,1] remoteExec ["DS_fnc_handleVehLights",_targets];
			};
		};
	};

DS_usedVehLights = true;

[] spawn
	{
	sleep 0.5;
	DS_usedVehLights = false;
	};