if(playerside != civilian) exitWith {hint "Du bist gerade im Einsatz!"};
if(missionNamespace getVariable [format["life_donatorsupply%1",getplayerUID player],false]) exitWith {hint "Du hast schon ein Fahrzeug von Don Ator angefordert!"};

playsound "CallDial";
sleep 7;

_action = [
	format["Hallo %1, Don hier! Du brauchst eines meiner Fahrzeuge?",name player],
	"Fahrzeug anfordern",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};

missionNamespace setVariable [format["life_donatorsupply%1",getplayerUID player],true,true];
hint "Ein Helikopter von Don ist unterwegs.";

_random = ["C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Hatchback_01_sport_F"] call BIS_fnc_SelectRandom;

_colorindex = switch(_random) do {
	case "C_Offroad_01_F": {10};
	case "C_SUV_01_F": {12};
	case "C_Van_01_box_F": {3};
	case "C_Hatchback_01_sport_F": {10};
};

_heli = createVehicle ["I_Heli_Transport_02_F", [(getpos player select 0)+200,(getpos player select 1)+1000,300], [], 0, "FLY"]; 
_heli allowdamage false;
createVehicleCrew _heli;

_heli doMove getpos player;
sleep 45;
_vehicle = createvehicle [_random,[(getpos _heli select 0),(getpos _heli select 1),(getpos _heli select 2)-2.5], [], 0, "CAN_COLLIDE"];
_vehicle lock 2;
_vehicle setVariable ["trunk_in_use",false,true];
_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
_vehicle setVariable ["versichert",true];
life_vehicles pushBack _vehicle;
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["SOA_fnc_keyManagement",2];
[_vehicle,_colorIndex] remoteExec ["life_fnc_colorVehicle",0];
_vehicle addItemCargoGlobal ["ToolKit",2];
_vehicle allowdamage false;
sleep 10;
_vehicle setposATL getposATL _vehicle;
_heli domove [0,0,0];
_vehicle allowdamage true;
sleep 40;
{_heli deleteVehicleCrew _x} foreach crew _heli;
deletevehicle _heli;