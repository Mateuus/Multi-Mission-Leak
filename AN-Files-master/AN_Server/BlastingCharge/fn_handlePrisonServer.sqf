params [
["_prisonMainGate",objNull,[objNull]],
["_player",objNull,[objNull]],
["_time",-1,[0]]
];
if(isNull _prisonMainGate OR {isNull _player} OR {_time isEqualTo -1}) exitWith {};
if(PrisonMainGate) exitWith {["PrisonMainGateDown"] remoteExecCall ["life_fnc_notificationHandler",(owner _player)];[true,"blastingcharge",1] remoteExecCall ["life_fnc_meqafubadru",(owner _player)];};
if(PrisonBreakCoolDown) exitWith {["PrisonCoolDown"] remoteExecCall ["life_fnc_notificationHandler",(owner _player)];[true,"blastingcharge",1] remoteExecCall ["life_fnc_meqafubadru",(owner _player)];};
PrisonMainGate = true;
_chargeOne = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,100];
_chargeTwo = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,100];
_chargeOne allowDamage false;
_chargeTwo allowDamage false;
_chargeOne attachTo [_prisonMainGate, [0,0,0]];
_chargeTwo attachTo [_prisonMainGate, [0,0,0]];
_chargeOne setVectorDirAndUp [[0,0,-1],[0,-1,0]];
_chargeTwo setVectorDirAndUp [[0,0,-1],[0,-1,0]];
_chargeOne attachTo [_prisonMainGate, [0,0,1]];
_chargeTwo attachTo [_prisonMainGate, [0,-5,1]];
if(_time isEqualTo 15) then{
["MainGateStartFive"] remoteExecCall ["life_fnc_notificationHandler",(owner _player)];
} else {
["MainGateStartFourty"] remoteExecCall ["life_fnc_notificationHandler",(owner _player)];
};
[_time,AN_server_prisonChargeThread,[_chargeOne,_chargeTwo,_prisonMainGate],false] call AN_server_threadAdd;
