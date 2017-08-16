closeDialog 0;
_unit = cursorTarget;

if (count (_unit getVariable ["vehicle_info_owners", []]) < 1 || !(_unit isKindOf "Car")) exitWith {hint "Du kannst hier kein NoS einbauen.";};
if (vehicle player != player) exitWith {};
if (!([false,"nitro",1] call DWEV_fnc_handlelnv)) exitWith {};

DWEV_action_inUse = true;

_upp = "NoS wird eingebaut...";
disableSerialization;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNameSpace getVariable "DWEV_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_success=false;
while{true} do
{	
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				player action ["SwitchWeapon", player, player, 100]; //EDIT
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			sleep 0.195;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true; };
	if(DWEV_istazed) exitWith {}; //Tazed
	if(DWEV_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _unit > 6) exitWith {};
	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];

DWEV_action_inUse = false;

if (_success) then
{
	_unit setVariable["nitro",3,true];
	hint "Es wurde dir 3x NoS eingebaut.";
};