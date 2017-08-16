/*
	File: fn_wantedlist
	Author: Shawn "Huntah" Macgillivray
	
	Description:
Deploys spike strips
	*/
private["_pos","_object","_object2"];

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

	DS_spikeAction = player addAction["Place SpikeStrips",{if(!isNull DS_spikestrip) then {detach DS_spikestrip; DS_spikestrip = ObjNull;detach DS_spikestrip2; DS_spikestrip2 = ObjNull;}; player removeAction DS_spikeAction; DS_spikeAction = nil;},"",999,false,false,"",'!isNull DS_spikestrip'];
	DS_spikestrip = _object;
	DS_spikestrip2 = _object2;
	waitUntil {isNull DS_spikestrip};
	waitUntil {isNull DS_spikestrip2};
	if(!isNil "DS_spikeAction") then {player removeAction DS_spikeAction;};
	if(isNull _object) exitWith {DS_spikestrip = ObjNull;};
	if(isNull _object2) exitWith {DS_spikestrip2 = ObjNull;};
	_object setPos [(getPos _object select 0),(getPos _object select 1),0];
	_object setDamage 1;
	_object2 setPos [(getPos _object2 select 0),(getPos _object2 select 1),0];
	_object2 setDamage 1;
	[[_object],"HUNT_fnc_policeSpikes",false,false] spawn BIS_fnc_MP;
	[[_object2],"HUNT_fnc_policeSpikes",false,false] spawn BIS_fnc_MP;
	}
	else
	{
	if(DS_spikeStrips > 20)exitwith{hint "Max number of spike strips to be placed on the server has been reached"};
	_object = "Land_Razorwire_F" createVehicle [6,6,6];
	_object attachTo[player,[0,5.5,0]];
	_object setDir 90;
	_object setVariable["item","spikeDeployed",true];
	_object setVariable["spikes",true,true];

	DS_spikeAction = player addAction["Place SpikeStrip",{if(!isNull DS_spikestrip) then {detach DS_spikestrip; DS_spikestrip = ObjNull;}; player removeAction DS_spikeAction; DS_spikeAction = nil;},"",999,false,false,"",'!isNull DS_spikestrip'];
	DS_spikestrip = _object;
	waitUntil {isNull DS_spikestrip};
	if(!isNil "DS_spikeAction") then {player removeAction DS_spikeAction;};
	if(isNull _object) exitWith {DS_spikestrip = ObjNull;};
	_object setPos [(getPos _object select 0),(getPos _object select 1),0];
	_object setDamage 1;
	[[_object],"HUNT_fnc_policeSpikes",false,false] spawn BIS_fnc_MP;
	};