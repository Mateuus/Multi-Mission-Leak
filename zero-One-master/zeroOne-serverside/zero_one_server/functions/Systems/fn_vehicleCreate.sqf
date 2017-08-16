/* 
 File: fn_vehicleCreate.sqf 
*/ 
private["_uid","_side","_type","_color","_plate","_vehicle","_film","_insurance"]; 
_uid = param[0,"",[""]]; 
_side = param[1,sideUnknown,[west]]; 
_vehicle = param[2,ObjNull,[ObjNull]]; 
_color = param[3,"",[""]]; 
_film = param[4,"",[""]]; 
_insurance = param[5,false,[false]]; 
 
//Error checks 
if(_uid isEqualTo "" || _side isEqualTo sideUnknown || isNull _vehicle || _color isEqualTo "") exitWith {}; 
if(!alive _vehicle) exitWith {}; 
_type = switch(true) do { 
 case (_vehicle isKindOf "Car"): {"Car"}; 
 case (_vehicle isKindOf "Air"): {"Air"}; 
 case (_vehicle isKindOf "Ship"): {"Ship"}; 
}; 
 
_side = switch(_side) do { 
 case west:{"cop"}; 
 case civilian: {"civ"}; 
 case independent: {"med"}; 
 case east: {"civ"}; 
 default {"Error"}; 
}; 
 
_plate = round(random(1000000)); 
[_uid,_side,_type,(typeOf _vehicle),_color,_plate,_film,_insurance] call zero_fnc_insertVehicle; 
 
_vehicle setVariable["dbInfo",[_uid,_plate]]; 
_vehicle setVariable["insurance",_insurance]; 
_vehicle setVariable["side",_side,true]; 
_vehicle addEventHandler["Killed","_this spawn zero_fnc_vehicleDead"]; 
