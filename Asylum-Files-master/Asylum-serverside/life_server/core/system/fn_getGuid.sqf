 
 
 
 
 
 
 
 
private ["_uid","_guid","_i"]; 
 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_guid = ""; 
 
for [{_i=0}, {_i<5}, {_i=_i+1}] do 
{ 
if (_i > 0) then { sleep 0.5; }; 
_guid = "Arma2Net.Unmanaged" callExtension format ["GetBattleyeGuid %1", _uid]; 
if (_guid != "") exitWith {}; 
}; 
 
_guid;