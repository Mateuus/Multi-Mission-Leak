 
 
 
 
 
 
 
private["_unit","_chan","_dispatch","_flush"]; 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_chan = [_this,1,-1,[-1]] call BIS_fnc_param; 
_dispatch = [_this,2,false,[false]] call BIS_fnc_param; 
_flush = [_this,3,false,[false]] call BIS_fnc_param; 
 
if (_flush && _dispatch) exitWith 
{ 
if ((getPlayerUID _x) in life_dispatchUsers) then { life_radio_dispatch radioChannelRemove [_x]; }; 
life_radio_dispatch radioChannelAdd [life_dispatcher]; 
life_dispatchUsers = [getPlayerUID life_dispatcher]; 
(life_dispatcher getVariable ["ownerID", -1]) publicVariableClient "life_dispatchUsers"; 
}; 
 
if(isNull _unit) exitWith {}; 
 
if (_dispatch) then { life_radio_dispatch radioChannelRemove [_unit]; life_dispatchUsers = life_dispatchUsers - [getPlayerUID _unit]; } 
else 
{ 
{ 
_x radioChannelRemove [_unit]; 
} forEach life_radio_RF; 
}; 
 
if(_chan > -1) then 
{ 
if (_dispatch) then { life_radio_dispatch radioChannelAdd [_unit]; life_dispatchUsers pushBack (getPlayerUID _unit); } 
else { (life_radio_RF select _chan) radioChannelAdd [_unit]; }; 
}; 
 
if (_dispatch) then 
{ 
[[[0,2],format["You have been %1 the APD dispatch radio channel!",if (_chan > -1) then { "added to" } else { "removed from" }]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; 
if (!isNull life_dispatcher) then 
{ 
(life_dispatcher getVariable ["ownerID", -1]) publicVariableClient "life_dispatchUsers"; 
}; 
};