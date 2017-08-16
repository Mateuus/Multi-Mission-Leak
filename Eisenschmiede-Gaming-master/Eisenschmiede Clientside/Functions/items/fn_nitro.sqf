private["_unit"];
_unit = cursorTarget;if((!(_unit isKindOf "LandVehicle"))&&(!(_unit getVariable ["restrained",false]))) exitWith {hint "Da kannst du keinen Nitro dran machen."};
if(player distance _unit > 7) exitWith {hint "Du must mindestens 7m ran!"};
if(!([false,"nitro",1] call ES_fnc_handleInv)) exitWith {};closeDialog 0;

ES_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";sleep 1.5;waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};

ES_action_inUse = false;if(player distance _unit > 7) exitWith {titleText["Du bist nicht in reichweite!","PLAIN"];};titleText["Du hast dein Fahrzeug  mit Nitro Gepimpt","PLAIN"];

[_unit] spawn{	_tempveh=(typeOf ES_tuning_vehicle)createVehicleLocal[0,0,0];_mass=getMass _tempveh;deleteVehicle _tempveh;	[[_tempveh, "akkuschrauber",10],"ES_fnc_playSound",true,false] spawn BIS_fnc_MP;