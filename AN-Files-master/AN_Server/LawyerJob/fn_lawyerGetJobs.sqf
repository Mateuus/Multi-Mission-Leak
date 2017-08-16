params [
["_lawyer",objNull,[objNull]]
];
if(isNull _lawyer OR {isNil "_lawyer"}) exitWith {};
if(isNil "LawyerRequests") then {LawyerRequests = [];};
[LawyerRequests] remoteExecCall ["life_fnc_douzoemlusiadiu",owner _lawyer];
