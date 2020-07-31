/*
	File: fn_revived.sqf
	
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];


_medic = param [0,"Unknown Medic",[""]];
_status = param [1,"Normal",[""]];

if(_status == "CPR" && shooting_death) then { hint "Ktos Cie ustabilizowal!."; maxTime = maxTime + 60; } else {


	player setVariable["dead",nil,TRUE];
	player setVariable["mapVisible",nil,true];
	player setVariable["Revive",TRUE,TRUE];

	deadPlayer = false;

	[format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText], false] spawn domsg;

	while{true} do {
		if(dialog) then {closeDialog 0;};
		if(!dialog) exitwith {};
	};

	player setVariable ["tf_unable_to_use_radio", false];
	im_dead = false;
	["Set",0.2] call fnc_doHealth;

	//Take fee for services.
	if(cash_in_bank > (call life_revive_fee)) then {
		["bank","take",call life_revive_fee] call life_fnc_handleCash; 
	} else {
		["bank","set",0] call life_fnc_handleCash;
	};
	player setVariable["Revive",nil,TRUE];
	player setVariable["name",nil,TRUE];
	player setVariable ["tf_voiceVolume", 1, true];
	disableUserInput false;
	player allowDamage true;
	life_action_inUse = false;
	life_death = 2;

	player setVariable["Reviving",nil,TRUE];
	player setVariable["CPR",nil,TRUE];
	player setVariable["EMSON", nil, true];

	[3] call SOCK_fnc_updatePartial;
	[6] call SOCK_fnc_updatePartial;





	//add freeze script on revive

	disableUserInput true;
	life_action_inUse = true;
	[player,"AinjPpneMstpSnonWnonDnon"] remoteExecCall ["life_fnc_animSync"];
	_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
	_obj setPosATL (getPosATL player);
	player attachTo [_obj,[0,0,0]];
	uiSleep 15;
	player allowdamage true;
	detach player;
	deleteVehicle _obj;
	disableUserInput false;

	[player,"AmovPercMstpSnonWnonDnon"] remoteExecCall ["life_fnc_animSync"];
	life_action_inuse = false; 
	shooting_death = false;
	life_deathCamera cameraEffect ["TERMINATE","BACK"];
	camDestroy life_deathCamera;

};