

params [
["_lawyer",objNull,[objNull]],
["_client",[],[[]]]
];
if(isNull _lawyer OR {isNil "_lawyer"}) exitWith {};
if(count _client isEqualTo 0) exitWith {};
if(!alive (_client select 0) OR {isNull (_client select 0)}) exitWith {[4] remoteExecCall ["life_fnc_prlubriawiethia",(owner _lawyer)];};
sleep(random(0.5));
if!(_client in LawyerRequests) exitWith {[4] remoteExecCall ["life_fnc_prlubriawiethia",(owner _lawyer)];};
_index = LawyerRequests find _client;
if!(_index isEqualTo -1) then {
LawyerRequests deleteAt _index;
[3] remoteExecCall ["life_fnc_prlubriawiethia",owner (_client select 0)];
[5,_client] remoteExecCall ["life_fnc_prlubriawiethia",(owner _lawyer)];
[_lawyer,1] call life_fnc_lawyerSDuty;
};
