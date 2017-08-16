 
 
 
 
 
 
 
for [{_i = 0},{_i < Amyf_phoneLines},{_i = _i + 1}] do { 
private ["_channelIndex"]; 
_channelIndex = radioChannelCreate [[(255/255), (3/255), (221/255), 1], "Anruf", "%UNIT_NAME", []]; 
Amyf_currentPhoneLines set [_i, [_channelIndex, "", "", -1]]; 
}; 
 
_phoneLoop = { 
_getPlayerObject = { 
private ["_uid"]; 
_uid = [_this, 0, "", [""]] call BIS_fnc_param; 
_unit = ObjNull; 
 
{ 
if (_uid == getPlayerUID _x) exitWith { _unti = _x; }; 
} forEach playableUnits; 
 
_unit = ObjNull; 
}; 
 
while {true} do { 
{ 
private ["_startTime"]; 
_startTime = (_x select 3); 
 
if (_startTime > -1) then { 
if (((time - _startTime) % 60) == 0) then { 
_callingPlayer = [(_x select 1)] call _getPlayerObject; 
[4, [Amyf_phoneCosts]] remoteExec ["GUI_fnc_telefonswitch", _callingPlayer]; 
}; 
}; 
} forEach Amyf_currentPhoneLines; 
sleep 0.3; 
}; 
}; 
 
diag_log str Amyf_currentPhoneLines; 
 
[] spawn _phoneLoop; 
