#include "..\..\script_macros.hpp"

params ["_player","_position","_vehicle"];

if((_position isEqualTo "driver")&&{playerSide isEqualTo civilian}&&{!(_vehicle in life_vehicles)}&&{(player inArea "safezone_port")||(player inArea "safezone_Trinite")||
(player inArea "safezone_Pessagne")||(player inArea "safezone_ter1")||(player inArea "safezone_reb1")||(player inArea "safezone_air1")||(player inArea "safezone_gun1")||
(player inArea "safezone_gun2")})exitWith {
	player action ["GetOut",_vehicle];
	["You cannot get in a vehicle within a safezone if you don't own the keys for it!",false,"slow"] call life_fnc_notificationSystem;
};