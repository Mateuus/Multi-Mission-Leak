 
 
 
 
 
 
 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
 
if (isNull _unit) exitWith {}; 
if (side _unit != west) exitWith {}; 
if (_unit getVariable ["copLevel",0] < 2) exitWith {}; 
 
if (isNull life_dispatcher) then { life_dispatcher = _unit }; 
 
publicVariable "life_dispatcher"; 
sleep 1; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_dispatchTasks"; 
if (_unit == life_dispatcher) then 
{ 
[_unit, 1, true] call ASY_fnc_manageRadio; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_dispatchUsers"; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_dispatchWaypoints"; 
};