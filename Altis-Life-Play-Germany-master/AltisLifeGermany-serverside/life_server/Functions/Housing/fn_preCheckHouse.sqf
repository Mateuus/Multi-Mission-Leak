/* 
 Author: Dillon "Itsyuka" Modine-Thuen 
 File: fn_preCheckHouse.sqf 
 Description: Checks to see if the house is owned (mainly for the purchase function) 
*/ 
private["_query","_queryResult","_house","_housePos"]; 
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
if(isNull _house) exitWith {false;}; 
 
_housePos = getPosATL _house; 
 
waitUntil {!DB_Async_Active}; 
_query = ([format["housingCheckHouse:%1", _housePos], 2] call DB_fnc_asyncCall) select 0; 
 
if (_query) then { 
 [[1,"Dieses Haus gehört schon jemandem!"],"life_fnc_broadcast",_this select 1,false] call life_fnc_MP; 
} else { 
 [[_house],"life_fnc_buyHouse2",_this select 1,false] call life_fnc_MP; 
};