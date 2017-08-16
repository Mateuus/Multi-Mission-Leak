 
 
 
 
 
 
 
 
private["_unit","_x","_robber","_lastRobbed"]; 
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
if(isNull _robber OR isNull _unit) exitWith {};  
 
[_unit,_robber] spawn { 
private["_robSuccess","_x","_i","_unit","_cash","_duration","_dispatch"]; 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_robSuccess = true; 
_x = round(random 500); 
_marker = createMarker [format["robMarker%1",_x], position _unit]; 
_marker setMarkerShape "ICON"; 
_marker setMarkerType "mil_dot"; 
_marker setMarkerColor "ColorRed"; 
_marker setMarkerText format["Robbery %1",name _robber]; 
 
_i = 0; 
_unit setVariable["robProgress",true,true]; 
_unit setVariable["lastRobbed",time,true]; 
 
_dispatch = ceil (random 9000); 
[_dispatch, format["Store Robbery (%1)",name _robber], 2500, 4, 2, position _unit, ""] spawn life_fnc_createDispatch; 
 
while {true} do 
{ 
if (_i >= 300) exitWith {}; 
if (!(alive _robber)) exitWith { _robSuccess = false; }; 
if (vehicle _robber != _robber) exitWith { _robSuccess = false; }; 
if (_robber getVariable ["restrained", false]) exitWith { _robSuccess = false; }; 
if ((_robber distance _unit) > 15) exitWith {}; 
_i = _i + 1; 
sleep 1; 
}; 
 
[[_dispatch, !_robSuccess],"life_fnc_finishDispatch",west,false] spawn life_fnc_MP; 
 
_unit setVariable["robProgress",false,true]; 
deleteMarker _marker; 
};