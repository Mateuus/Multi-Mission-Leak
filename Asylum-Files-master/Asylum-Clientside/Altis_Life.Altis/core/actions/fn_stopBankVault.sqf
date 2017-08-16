/*
	File: fn_stopBankVault.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Stop bank vault drilling.
*/

if (life_action_in_use) exitWith {};
if (!life_bank_drilling) exitWith {hint "The bank vault is not being drilled!"};

_doorPos = getMarkerPos "life_bank_door";
if ((player distance _doorPos) > 3) exitWith {};

//Setup our progress bar
_success = false;
_title = format["Disabling Drill"];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

life_action_in_use = true;

[[player,"Acts_carFixingWheel"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
while {true} do
{
	if(animationState player != "acts_carfixingwheel") then {
		player playMoveNow "Acts_carFixingWheel";
		[[player,"Acts_carFixingWheel"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	};
	sleep 0.3;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (!alive player) exitWith {};
	if (player distance _doorPos > 3) exitWith {};
	if (_cP >= 1) exitWith{ _success = true; };
	if (!life_action_in_use) exitWith {};
};

//Kill the UI display and check for various states
life_action_in_use = false;
5 cutText ["","PLAIN"];

if (_success) then
{
	life_bank_drilling = false;
	publicVariable "life_bank_drilling";
	{
		if (_x distance life_bank_building < 200 && side _x != west) then
		{
			[[[0,1,2],format["Officer %1 has stopped the vault drill! The robbery has failed.", profileName]],"life_fnc_broadcast",_x,false] spawn life_fnc_MP;
		};
	} forEach allPlayers;
};