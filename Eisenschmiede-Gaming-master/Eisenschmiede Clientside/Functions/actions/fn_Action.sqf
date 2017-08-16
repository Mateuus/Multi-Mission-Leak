private["_lock"];
_target = param[0,objNull,[objNull]];

if(isNull _target) exitWith {false};

_lock = switch(true) do 
{
    case (playerSide == civilian && !ES_BankCode && _target isKindOf "Land_BarGate_F" && _target getVariable "lockGate"): {hintSilent "Du hast die KeyKarte nicht!"; true};
	
    default {false};
};

_lock;