

params [
["_player",objNull,[objNull]],
["_chargeOne",objNull,[objNull]]
];
BankAmount = BankAmount + 60;
if(!isNull _player && {alive _player}) then {
["BankTimer"] remoteExecCall ["life_fnc_notificationHandler",(owner _player)];
};
if(BankAmount >= BankTimer) then {
if(!(fed_bank getVariable ["charge_placed",false])) exitWith {
BankTimer = nil;
BankAmount = nil;
BankCoolDown = true;
if!(BankThread isEqualTo -1) then {
[BankThread] call AN_server_threadRemove;
BankThread = -1;
};
[1800,AN_server_bankCoolDown,[],false] call AN_server_threadAdd;
};
detach _chargeOne;
_chargeOne setDamage 1;
fed_bank setVariable ["safe_open",true,true];
fed_bank setVariable ["charge_placed",false,true];
["BankTimerDone"] remoteExecCall ["life_fnc_notificationHandler",west];
BankTimer = nil;
BankAmount = nil;
BankCoolDown = true;
if!(BankThread isEqualTo -1) then {
[BankThread] call AN_server_threadRemove;
BankThread = -1;
};
};