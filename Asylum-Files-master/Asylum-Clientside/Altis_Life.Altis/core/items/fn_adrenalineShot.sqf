/*
		File: fn_adrenalineShot.sqf
		Author: Mike "Revir" Berlin
		
		Description: Brings a player back from being downed.
	
*/

if (!([false,"adrenalineShot",1] call life_fnc_handleInv)) exitWith {};
_units = player nearEntities["Man",5];
_unit = objNull;
{if(_x getVariable["downed",false]) exitWith {_unit = _x}} forEach _units;
if(isNull _unit) then {_unit = player};
life_action_in_use = true;

_upp = "Injecting with adrenaline";
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
	sleep 0.1;
	_cP = _cP + 0.1;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true;};
	if(!alive player) exitWith {};
	if (!life_action_in_use) exitWith {};
};
5 cutText ["","PLAIN"];
life_action_in_use = false;
if (_success) then
{
	if(_unit == player) then {
		player playActionNow "Medic";
		life_revive_fatigue = 0;
		player setFatigue 0;
		player forceWalk false;
		player setVariable["can_revive",time,true];
	} else {
		player playActionNow "MedicOther";
		_unit setVariable["adrenaline",true,true];
	};
	life_experience = life_experience + 60;
};