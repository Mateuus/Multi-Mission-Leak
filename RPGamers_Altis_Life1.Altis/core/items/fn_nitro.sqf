_unit = cursorTarget;

if (count (_unit getVariable ["vehicle_info_owners", []]) < 1 || !(_unit isKindOf "Car")) exitWith {["Your target is not a valid vehicle for nitrous oxide.",5,"gray"] call RPG_Fnc_Msg;};
if (vehicle player != player) exitWith {};
if (!([false,"nitro",1] call life_fnc_handleInv)) exitWith {};

life_action_in_use = true;

_upp = "Attaching nitrous injector...";
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
	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
       	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
	sleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true;};
	if(player distance _unit > 6) exitWith {};
	if(!alive player) exitWith {};
	if(speed player > 2) exitWith {};
	if (!life_action_in_use) exitWith {};
};
5 cutText ["","PLAIN"];
life_action_in_use = false;

if (_success) then
{
	_unit setVariable["nitro",3,true];
	life_experience = life_experience + 20;
	["Nitrous oxide injector added to vehicle (3 injections).",5,"blue"] call RPG_Fnc_Msg;
	["Press 6 when driving to activate.",5,"blue"] call RPG_Fnc_Msg;
};