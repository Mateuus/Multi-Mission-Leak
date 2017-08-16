/*	File: fn_turbol.sqf	
Author: Eisenschiede		
Description:	Attaches a turbola
*/

ES_Veh_Tu = cursorTarget;

if((ES_Veh_Tu getVariable ["Turbo",0]) >0 ) exitWith {titleText["Du hast schon einen Turbolader an das Fahrzeug plaziert","PLAIN"]; closeDialog 0;};

if((!(ES_Veh_Tu isKindOf "LandVehicle"))&&(!(ES_Veh_Tu getVariable ["restrained",false]))) exitWith {hint "Da kannst du keinen Turbolader dran machen."};

if(player distance ES_Veh_Tu > 5) exitWith {hint "Du must mindestens 5m ran!"};

if(!([false,"turbol",1] call ES_fnc_handleInv)) exitWith {};

closeDialog 0;

ES_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 1.5;

waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};

ES_action_inUse = false;

if(player distance ES_Veh_Tu > 5) exitWith {titleText["Du bist nicht in reichweite!","PLAIN"];};

titleText["Du hast einen Turbolader an dem Fahrzeug plaziert","PLAIN"];

ES_Veh_Tu setVariable["Turbo",1,true];

(ES_Veh_Tu)setMass(((getMass(ES_Veh_Tu)))-(((getMass(ES_Veh_Tu)))*0.5));