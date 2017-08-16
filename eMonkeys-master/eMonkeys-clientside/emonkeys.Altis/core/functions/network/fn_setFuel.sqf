if(!hasInterface && isServer) exitWith {};

_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;		//Fahrzeug
_fuel = [_this,1,0.3,[0]] call BIS_fnc_param;					//Treibstoff anzahl

_vehicle setFuel _fuel;