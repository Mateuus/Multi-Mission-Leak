
params [
["_safe",objNull,[objNull]],
["_player",objNull,[objNull]],
["_time",-1,[0]]
];
if(isNull _safe OR {isNull _player} OR {_time isEqualTo -1}) exitWith {};
if(BankCoolDown) exitWith {["BankCoolDown"] remoteExecCall ["life_fnc_notificationHandler",(owner _player)]; [true,"blastingcharge",1] remoteExecCall ["life_fnc_meqafubadru",(owner _player)];};
if(isNil "BankAmount") then {BankAmount = 0;};
if(isNil "BankTimer") then {BankTimer = _time * 60;};
_chargeOne = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,100];
_chargeOne allowDamage false;
_chargeOne attachTo [_safe,[0,0,0.75]];
fed_bank setVariable ["charge_placed",true,true];
["BankTimerStarted"] remoteExecCall ["life_fnc_notificationHandler",west];

if(_time isEqualTo 3) then {
["BankTimerStarted"] remoteExecCall ["life_fnc_notificationHandler",west];
["BankChargeThree"] remoteExecCall ["life_fnc_notificationHandler",(owner _player)];
} else {
["BankTimerStarted"] remoteExecCall ["life_fnc_notificationHandler",west];
["BankChargeFour"] remoteExecCall ["life_fnc_notificationHandler",(owner _player)];
};
if(BankThread isEqualTo -1) then {
BankThread = [60,AN_server_bankServerThread,[_player,_chargeOne],true] call AN_server_threadAdd;
};
