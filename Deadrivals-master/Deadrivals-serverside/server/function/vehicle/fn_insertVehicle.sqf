private["_uid","_side","_type","_className","_color","_plate","_createvehicle"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param; 
_vehicle = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
_color = [_this,3,-1,[0]] call BIS_fnc_param; 
_price = [_this,4,0,[0]] call BIS_fnc_param; 
_lagerraum = [_this,5,0,[0]] call BIS_fnc_param; 
_dienst = [_this,6,"",[""]] call BIS_fnc_param; 
if(!alive _vehicle) exitWith {}; 
 
_inventory = [[],0]; 
_geheimfach = [[],0]; 
_plate = round(random(1000000)); 
_vehicle setVariable["dbInfo",[_uid,_plate]]; 
_className = typeOf _vehicle; 
_tuningcolor = [-1,-1,-1]; 
_tuning = _vehicle getVariable["tuning",[-1,-1,-1,-1,-1,-1,-1,-1,-1]]; 
 
switch(_side) do 
{ 
case west:{_side =  "cop"}; 
case civilian: {_side =  "civ"}; 
case independent: { if (_dienst == "MED") then {_side = "MED"} else {_side = "ABAC"};}; 
case east: {_side = "east"}; 
default {_side = "Error"}; 
}; 
 
_type = switch(true) do 
{ 
case (_vehicle isKindOf "Car"): {"Car"}; 
case (_vehicle isKindOf "Air"): {"Air"}; 
case (_vehicle isKindOf "Ship"): {"Ship"}; 
case (_vehicle isKindOf "landVehicle"): {"Air"}; 
}; 
 
if(_uid == "" OR _side == "" OR _type == "" OR _className == "" OR _color == -1 OR _plate == -1) exitWith {}; 
 
_createvehicle = format["INSERT INTO vehicles SET side = '%1', classname = '%2', type = '%3', pid = '%4', inventory = '%5', color = '%6', plate = '%7', price = '%8', lagerraum = '%9', tuning = '%10', tuningcolor = '%11', geheimfach = '%12'",_side,_className,_type,_uid,_inventory,_color,_plate,_price,_lagerraum,_tuning,_tuningcolor,_geheimfach]; 
[_createvehicle,1] call SERVERDATABASE_fnc_asyncCall;