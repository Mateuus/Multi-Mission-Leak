 
 
 
 
 
 
 
private["_uid","_side","_type","_classname","_color","_plate","_player"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param; 
_vehicle = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
_color = [_this,3,-1,[0]] call BIS_fnc_param; 
_player = [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param; 
_plate = _this select 5; 
_fuel = [_this,6,1,[1]] call BIS_fnc_param; 
_damage = [_this,7,0,[1]] call BIS_fnc_param; 
_alarm = [_this,8,false,[false]] call BIS_fnc_param; 
_insured = [_this,9,false,[false]] call BIS_fnc_param; 
 
 
if(_uid == "" OR _side == sideUnknown OR isNull _vehicle) exitWith {}; 
if(!alive _vehicle) exitWith {}; 
_className = typeOf _vehicle; 
_type = switch(true) do 
{ 
case (_className in ["C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F"]): {"Kart"}; 
case (_vehicle isKindOf "Car"): {"Car"}; 
case (_vehicle isKindOf "Air"): {"Air"}; 
case (_vehicle isKindOf "Ship"): {"Ship"}; 
}; 
_side = switch(_side) do 
{ 
case west:{"cop"}; 
case civilian: {"civ"}; 
case independent: {"med"}; 
default {"Error"}; 
}; 
 
if (_insured) then { [_vehicle, true] call ASY_fnc_insured; }; 
 
[_uid,_side,_type,_classname,_color,_plate,_fuel,_damage,_alarm] call DB_fnc_insertVehicle; 
_vehicle addEventHandler["Killed","_this spawn ASY_fnc_vehicleDead"];