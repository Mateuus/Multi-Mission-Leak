/*	File: fn_speedBomb.sqf	
Author: Fuzz		
Description:	Attaches a speed bomb to a vehicle.
*/

private["_unit"];

_unit = cursorTarget;
if((!(_unit isKindOf "LandVehicle"))&&(!(_unit getVariable ["restrained",false]))) exitWith {hint "Da kannst du keine Speedbombe dran machen."};

if(player distance _unit > 5) exitWith {hint "Du must mindestens 5m ran!"};
if(!([false,"speedbomb",1] call ES_fnc_handleInv)) exitWith {};
closeDialog 0;

ES_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 1.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};

ES_action_inUse = false;if(player distance _unit > 5) exitWith {titleText["Du bist nicht in reichweite!","PLAIN"];};

titleText["Du hast eine Scharfe Bombe an dem Fahrzeug plaziert","PLAIN"];

[_unit] spawn {	

		_veh = _this select 0;	
		waitUntil {(speed _veh) > 49};	
		[[_veh, "caralarm",10],"ES_fnc_playSound",true,false] spawn BIS_fnc_MP;

		hint "A speed bomb you planted on a vehicle has just become active!";	
	{ 
		[[2,"Es wurde eine SpeedBombe am Fahrzeug plaziert und wird explodieren wenn du langsamer als 50km/h! fährt!"],"ES_fnc_broadcast",_x,false] spawn BIS_fnc_MP;
	} foreach (crew _veh);	

	waitUntil {(speed _veh) < 49};	

	if(vehicle player distance (getMarkerPos "Safe_Kav") < 300 ) exitWith { [parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.3'>SpeedBombe ist in einer SAFEZONE!!!</t></t>"],true,nil,4,0.7,0] spawn BIS_fnc_textTiles;};
	if(vehicle player distance (getMarkerPos "Safe_Reb") < 300 ) exitWith { [parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.3'>SpeedBombe ist in einer SAFEZONE!!!</t></t>"],true,nil,4,0.7,0] spawn BIS_fnc_textTiles;};
	if(vehicle player distance (getMarkerPos "Safe_Reb_1") < 300 ) exitWith { [parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.3'>SpeedBombe ist in einer SAFEZONE!!!</t></t>"],true,nil,4,0.7,0] spawn BIS_fnc_textTiles;};
	if(vehicle player distance (getMarkerPos "Safe_Schwarzmarkt") < 300 ) exitWith { [parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.3'>SpeedBombe ist in einer SAFEZONE!!!</t></t>"],true,nil,4,0.7,0] spawn BIS_fnc_textTiles;};
	if(vehicle player distance (getMarkerPos "Event_Admin") < 400 ) exitWith { [parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.3'>SpeedBombe ist in einer SAFEZONE!!!</t></t>"],true,nil,4,0.7,0] spawn BIS_fnc_textTiles;};

	_test = "Bo_Mk82" createVehicle [0,0,9999];	
	_test setPos (getPos _veh);	
	_test setVelocity [100,0,0];

	[parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.3'>Die SpeedBome wurde gezündet!</t></t>"],true,nil,4,0.7,0] spawn BIS_fnc_textTiles;

};
