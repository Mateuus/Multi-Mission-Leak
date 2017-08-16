_target = cursortarget;

if(player getVariable ["restrained",false]) exitWith {hint "Du kannst das derzeit nicht tun."};
if(!(_target isKindOf "LandVehicle")) exitWith {hint "Du kannst diesen Gegenstand nicht versichern."};
if(player distance _target > 7) exitWith {hint "Das Fahrzeug ist zu weit entfernt!"};
if(_target getVariable["insurance",false]) exitWith {hint "Dieses Fahrzeug ist bereits versichert!"};
if(!([false,"vehicleInsurance",1] call life_fnc_handleInv)) exitWith {};

closeDialog 0;

life_action_inUse = true;

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 4.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};

life_action_inUse = false;
if(player distance _target > 7) exitWith {titleText["Du bist nicht in Reichweite!","PLAIN"];};

_target setVariable["insurance",true,true];
titleText["Du hast dein Auto mit einer Versicherung ausgestattet, sodass es nun nicht mehr am Schrotthändler verkauft werden kann.","PLAIN"];
