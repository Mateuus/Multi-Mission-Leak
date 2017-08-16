/*
	File: fn_wantedlist
	Author: Shawn "Huntah" Macgillivray

	Description:
Deploys spike strips
	*/
private["_pos","_object","_object2"];

if(player distance (getMarkerPos "cop_spawn_6") < 300)exitwith{hint "You can't place spikes here because of a glitch - this will be fixed some time before 2020"};

if((player getVariable ["policeSquad",""]) == "Highway Patrol")then
	{
	_object = "Land_Razorwire_F" createVehicle [6,6,6];
	_object attachTo[player,[2,5,0]];
	_object setDir 90;
	_object setVariable["item","spikeDeployed",true];
	_object setVariable["spikes",true,true];
	_object2 = "Land_Razorwire_F" createVehicle [6,6,6];
	_object2 attachTo[player,[-2,6.5,0]];
	_object2 setDir 90;
	_object2 setVariable["item","spikeDeployed",true];
	_object2 setVariable["spikes",true,true];

	DS_spikeAction = player addAction["Place SpikeStrips",{if(!isNull DS_spikestrip) then {detach DS_spikestrip; DS_spikestrip = objNull;detach DS_spikestrip2; DS_spikestrip2 = objNull;}; player removeAction DS_spikeAction; DS_spikeAction = nil;},"",999,false,false,"",'!isNull DS_spikestrip'];
	DS_spikestrip = _object;
	DS_spikestrip2 = _object2;
	waitUntil {isNull DS_spikestrip};
	waitUntil {isNull DS_spikestrip2};
	if(!isNil "DS_spikeAction") then {player removeAction DS_spikeAction;};
	if(isNull _object) exitWith {DS_spikestrip = objNull;};
	if(isNull _object2) exitWith {DS_spikestrip2 = objNull;};
	_object setPos [(getPos _object select 0),(getPos _object select 1),0];
	_object setDamage 1;
	_object2 setPos [(getPos _object2 select 0),(getPos _object2 select 1),0];
	_object2 setDamage 1;
	[_object] remoteExec ["HUNT_fnc_policeSpikes",2];
	[_object2] remoteExec ["HUNT_fnc_policeSpikes",2];
	}
	else
	{
	if(DS_spikeStrips > 20)exitwith{hint "Max number of spike strips to be placed on the server has been reached"};
	_object = "Land_Razorwire_F" createVehicle [6,6,6];
	_object attachTo[player,[0,5.5,0]];
	_object setDir 90;
	_object setVariable["item","spikeDeployed",true];
	_object setVariable["spikes",true,true];

	DS_spikeAction = player addAction["Place SpikeStrip",{if(!isNull DS_spikestrip) then {detach DS_spikestrip; DS_spikestrip = objNull;}; player removeAction DS_spikeAction; DS_spikeAction = nil;},"",999,false,false,"",'!isNull DS_spikestrip'];
	DS_spikestrip = _object;
	waitUntil {isNull DS_spikestrip};
	if(!isNil "DS_spikeAction") then {player removeAction DS_spikeAction;};
	if(isNull _object) exitWith {DS_spikestrip = objNull;};
	_object setPos [(getPos _object select 0),(getPos _object select 1),0];
	_object setDamage 1;
	[_object] remoteExec ["HUNT_fnc_policeSpikes",2];
	};