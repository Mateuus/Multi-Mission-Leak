
params [
["_president",objNull,[objNull]],
["_newBodyGuard",objNull,[objNull]]
];
if(isNull _president OR {isNull _newBodyGuard}) exitWith {};
if(!alive _newBodyGuard) exitWith {};
if(count BodyGuardArray >= 4) exitWith {[1,"Your Protective Detail is Full!"] remoteExecCall ["life_fnc_brusathusek",(owner _president)];};
_index = BodyGuardArray find _newBodyGuard;
if(_index isEqualTo -1) then {
[_president] remoteExec ["life_fnc_thaneswudrecr",(owner _newBodyGuard)];
} else {
[1,"He's already part of the Protective Detail!"] remoteExecCall ["life_fnc_brusathusek",(owner _president)];
};