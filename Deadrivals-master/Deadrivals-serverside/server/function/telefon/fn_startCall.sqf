 
 
 
 
 
 
 
_callingPlayer = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param; 
_receivingPlayer = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param; 
 
if (isNull _callingPlayer || isNull _receivingPlayer) exitWith {}; 
if (_callingPlayer == _receivingPlayer) exitWith {}; 
if ((_callingPlayer getVariable ["isCalling", false])) exitWith {}; 
if ((_callingPlayer getVariable ["phoneMute", false]) && (_receivingPlayer getVariable ["phoneMute", false])) exitWith {}; 
 
_getFreeLine = { 
private ["_index"]; 
_index = -1; 
 
{ 
if ((_x select 3) == -1) exitWith { 
_index = _forEachIndex; 
}; 
} forEach Amyf_currentPhoneLines; 
 
_index; 
}; 
 
_freeLine = (call _getFreeLine); 
if (_freeLine == -1) exitWith { [2] remoteExec ["GUI_fnc_telefonswitch", _callingPlayer]; }; 
 
_radioIndex = ((Amyf_currentPhoneLines select _freeLine) select 0); 
Amyf_currentPhoneLines set [_freeLine, [_radioIndex, (getPlayerUID _callingPlayer), (getPlayerUID _receivingPlayer), time]]; 
 
_radioIndex radioChannelAdd [_callingPlayer, _receivingPlayer]; 
 
[19, [true, _radioIndex], false, false] remoteExec ["GUI_fnc_telefonswitch", [_callingPlayer, _receivingPlayer]]; 
 
_callingPlayer setVariable ["isCalling", true, true]; 
_receivingPlayer setVariable ["isCalling", true, true]; 
_callingPlayer setVariable ["incomingCall", false, true]; 
_receivingPlayer setVariable ["incomingCall", false, true]; 
 
[9, [_receivingPlayer]] remoteExec ["GUI_fnc_telefonswitch", [_callingPlayer]]; 
[9, [_callingPlayer], false, false] remoteExec ["GUI_fnc_telefonswitch", [_receivingPlayer]]; 
