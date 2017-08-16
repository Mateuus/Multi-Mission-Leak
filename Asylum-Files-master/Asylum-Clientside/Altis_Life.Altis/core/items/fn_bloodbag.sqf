/*
		File: fn_bloodbag.sqf
		Author: John "Paratus" VanderZwet
		
		Description: Puts blood in people.
*/

_unit = cursorTarget;
_target = [_this,3,objNull,[objNull]] call BIS_fnc_param; // index 3 due to addAction
if (_target == player) then { _unit = player; };

if (isNull _unit || !(_unit isKindOf "Man") || !(isPlayer _unit) || !(alive _unit)) exitWith {hint "Not a valid target for blood bag.  Dead?";};
if(player distance _unit > 6) exitWith {}; //Not close enough.
if (vehicle player != player) exitWith { hint "You can't help someone from within a vehicle." };

life_action_in_use = true; //Lockout the controls.

//Setup our progress bar
_success = false;
_title = format["Giving transfusion to %1",name _unit];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_delay = switch (true) do
{
	case (playerSide == west && life_coprole in ["medic","all"] && (29 in life_coptalents)): { 0.05 };
	case (playerSide == west && life_coprole in ["medic","all"] && (28 in life_coptalents)): { 0.1 };
	case (playerSide == west && ((life_coprole in ["medic","all"] && (27 in life_coptalents)) || (life_coprole in ["detective","all"] && (46 in life_coptalents)))): { 0.15 };
	default { 0.2 };
};
player forceWalk true;
[true,true,true,true] spawn life_fnc_holsterWeapon;
animRepeat = true;
[] spawn {
	while{animRepeat} do {
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1"};
		sleep 1;
	};
};
while {true} do
{
	sleep _delay;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (!alive player || !alive _unit) exitWith {};
//Begin Edit: Check if Player gets into vehicle. Copied from repair check ~Gnash
	if(player != vehicle player) exitWith {player action ["Eject", vehicle player]};
//End Edit
	if(player getVariable ["downed",false]) exitWith {};
//Begin Edit: Check if Player is running while Bloodbagging in addition to existing distance check. ~Gnash
	if(player distance _unit > 7) exitWith {};
// End Edit
	if(_cP >= 1) exitWith{ _success = true; };
	if (!life_action_in_use) exitWith {};
};
[false,false,false,false] spawn life_fnc_holsterWeapon;
life_action_in_use = false;
player forceWalk false;
//[[player,""],"life_fnc_animSync",true,false] spawn life_fnc_MP;
animRepeat = false;
//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if (!_success) exitWith { hint "Transfusion failed."; };

_itemUsed = true;
if (!(playerSide == west && life_coprole in ["medic","all"] && (29 in life_coptalents))) then
{
	_itemUsed = ([false,"bloodbag",1] call life_fnc_handleInv);
};
if(!_itemUsed) exitWith {};

_damage = switch (true) do
{
	case ((playerSide == independent) || (12 in life_talents) || (92 in life_talents)): { 0 };
	case ((11 in life_talents) || (91 in life_talents)): { 0.1 };
	case ((10 in life_talents) || (90 in life_talents)): { 0.2 };
	default { 0.25 };
};

if (_unit == player) then
{
	_unit setDamage _damage;
	titleText["You give yourself a blood transfusion.","PLAIN"];
}
else
{
	_unit setDamage _damage;
	titleText[format["You gave %1 a blood transfusion.", name _unit],"PLAIN"];
	[[2,format["%1 has given you a blood transfusion.",name player]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
	if (playerSide == independent) then { life_experience = life_experience + 5; };
	if (playerSide == west && life_coprole in ["all","medic","detective"] && player != _unit) then { [100] spawn life_fnc_earnPrestige; };
};