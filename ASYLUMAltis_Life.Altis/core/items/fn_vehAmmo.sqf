/*
		File: vehAmmo.sqf
		Author: John "Paratus" VanderZwet
		
		Description: Refill all weapons on vehicle.
*/

if ((vehicle player) == player || (gunner (vehicle player)) != player) exitWith { hint "You must reload the ammunition from the gunner position." };
if (playerSide != west && !(32 in life_talents)) exitWith {hint "You don't have the talent to work with such weaponry.";};
if !(typeOf (vehicle player) in ["B_G_Offroad_01_armed_F","CUP_B_UAZ_MG_CDF","CUP_B_LR_MG_CZ_W"]) exitWith {hint "The ammunition does not fit this vehicles weapons."};
if (!([false,"vammo",1] call life_fnc_handleInv)) exitWith {};

life_action_in_use = true;

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
	if(player == (vehicle player)) exitWith {};
	if(!alive player) exitWith {};
	if(!life_action_in_use) exitWith {};
};
5 cutText ["","PLAIN"];
life_action_in_use = false;

if (_success) then
{
	(vehicle player) setVehicleAmmo 1;
	life_experience = life_experience + 20;
	hint "Vehicle weapons have been reloaded.";
};