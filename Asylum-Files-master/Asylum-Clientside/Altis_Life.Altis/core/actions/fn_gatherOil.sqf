/*
	File: fn_gatherOil.sqf
	Author: Alan
	
	Description:
	Player gathering oil at a rig.
*/
private ["_delay"];
_gen = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Checks

//if(!(105 in life_talents)) exitWith { hint "You must have the talent Oil Runner to gather oil."; };
if (!isNull life_pumped_barrel) exitWith { hint "You already have a barrel of oil. Process that one first." };
if(!isNil "pumping") exitWith {};
pumping = true;
titleText["Pumping oil and filling barrel...","PLAIN"];
_delay = 5;
if (105 in life_talents) then { _delay = 3 };
sleep _delay;

_barrel = "Land_MetalBarrel_F" createVehicle [0,0,0];
_barrel allowDamage false;
_barrel setPosASL [((getPosASL _gen) select 0) + 3, (getPosASL _gen) select 1, (getPosASL _gen) select 2];
_barrel setVariable ["owner", player, true];
_barrel enableRopeAttach false;
player reveal _barrel;
life_pumped_barrel = _barrel;
_barrel addAction["Pickup Barrel",life_fnc_pickupOil,cursorTarget,-1,false,true,"",'isNull life_holding_barrel && _target distance player < 4'];
titleText["Barrel filled. It may take a minute before you can pick it up.","PLAIN"];
pumping = nil;