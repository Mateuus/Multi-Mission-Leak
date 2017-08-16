 
 
 
 
 
 
 
_callingPlayer = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param; 
_receivingPlayer = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param; 
_ignoreVariables = [_this, 2, false, [false]] call BIS_fnc_param; 
 
if (isNull _callingPlayer || isNull _receivingPlayer) exitWith {}; 
if (_ignoreVariables) then { 
if (!_callingPlayer getVariable ["isCalling", false]) exitWith {}; 
if (!_receivingPlayer getVariable ["isCalling", false]) exitWith {}; 
}; 
 
_phoneLineIndex = -1; 
{ 
if ((_x select 1) in [(getPlayerUID _callingPlayer), (getPlayerUID _receivingPlayer)] || (_x select 2) in [(getPlayerUID _callingPlayer), (getPlayerUID _receivingPlayer)]) exitWith { _phoneLineIndex = _forEachIndex; }; 
} forEach Amyf_currentPhoneLines; 
if (_phoneLineIndex == -1) exitWith {}; 
 
_phoneLine = Amyf_currentPhoneLines select _phoneLineIndex; 
_radioIndex = _phoneLine select 0; 
 
[19, [false, _radioIndex], false, false] remoteExec ["GUI_fnc_telefonswitch", [_callingPlayer, _receivingPlayer]]; 
[11, [_callingPlayer]] remoteExec ["GUI_fnc_telefonswitch", [_callingPlayer, _receivingPlayer]]; 
 
sleep 1.4; 
_radioIndex radioChannelRemove [_callingPlayer, _receivingPlayer]; 
Amyf_currentPhoneLines set [_phoneLineIndex, [_radioIndex, "", "", -1]]; 
 
_callingPlayer setVariable ["isCalling", false, true]; 
_callingPlayer setVariable ["incomingCall", false, true]; 
_receivingPlayer setVariable ["isCalling", false, true]; 
_receivingPlayer setVariable ["incomingCall", false, true];