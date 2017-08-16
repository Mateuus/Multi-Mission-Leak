private [];
_copGate = _this select 0;
_trigger = _this select 1;
_activators = _this select 2;

if(!X_Server) exitWith {};

// if we're still waiting on the last assignment, or if there's already a script in place, don't do anything
if(_trigger getVariable ["assignmentStarted", false]) exitWith {};

// find the first person in the trigger area that's a player
_i = 1;
_owner = _activators select 0;
while {isNull _owner && _i < count _activators} do {
	_owner = _activators select _i;
	_i = _i+1;
};
if(isNull _owner) exitWith {};

// mark that we're attempting to start the script on someone
_trigger setVariable ["assignmentStarted", true];

// start the script on the happy new owner!
[[_trigger, _copGate], "life_fnc_monitorGate", _owner] call life_fnc_MP;

// wait, see if it works...
sleep 2;

// mark that we're no longer attempting. If it hasn't worked yet, it won't work
_trigger setVariable ["assignmentStarted", false];