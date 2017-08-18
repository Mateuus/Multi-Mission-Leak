/*
		File: vehammo.sqf
		Author: John "Paratus" VanderZwet
		Functionality edits & adaptation for STS by Kevin
		
		Description: Reloads vehicle ammunition
*/
private["_unit","_veh","_upp","ui","_progress","_pgText","_cP","_success"];
_unit = vehicle player;
_veh = typeOf _unit;

life_action_inUse = true;

_upp = "Reloading vehicle weapon...";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_success=false;
while{true} do
{
	sleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true;};
	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];
life_action_inUse = false;

if (_success) then
{
	if(_veh == "O_MRAP_02_hmg_F") then
	{
		_unit addMagazineTurret ["200Rnd_127x99_mag_Tracer_Green",[0]];
		hint "Your M2 .50 caliber turret has been reloaded with one extra magazine!";
	};
	if(_veh == "B_Boat_Armed_01_minigun_F") then
	{
		if(playerSide != west) exitWith { hint "You are not allowed to load this vehicle!";};
		_unit addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
		hint "Your 6.5mm minigun has been reloaded with 2000 rounds of ammunition!";
	};
	if(_veh == "I_MRAP_03_hmg_F") then
	{
		if(playerSide != west) exitWith { hint "You are not allowed to load this vehicle!";};
		_unit addMagazineTurret ["200Rnd_127x99_mag_Tracer_Yellow",[0]];
		hint "Your M2 .50 caliber turret has been reloaded with one extra magazin!e";
	};
	if(_veh == "B_MRAP_01_hmg_F") then
	{
		if(playerSide != west) exitWith { hint "You are not allowed to load this vehicle!";};
		_unit addMagazineTurret ["200Rnd_127x99_mag_Tracer_Red",[0]];
		hint "Your M2 .50 caliber turret has been reloaded with one extra magazine!";
	};
	if(_veh == "B_HMG_01_F") then
	{
		if(playerSide != west) exitWith { hint "You are not allowed to load this vehicle!";};
		_unit addMagazineTurret ["500Rnd_127x99_mag",[0]];
		hint "Your Mk30 .50 caliber HMG has been reloaded with one extra magazine";
	};
	if((_veh != "B_Boat_Armed_01_minigun_F") && (_veh != "O_MRAP_02_hmg_F") && (_veh != "I_MRAP_03_hmg_F") && (_veh != "B_MRAP_01_hmg_F") && (_veh != "B_HMG_01_F")) then
	{
		hint "You foolishly destroy your ammunition trying to reload a non-existant weapon.";
	};
};