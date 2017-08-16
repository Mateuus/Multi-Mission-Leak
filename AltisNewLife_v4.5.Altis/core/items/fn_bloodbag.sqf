_unit = cursorTarget;
_target = [_this,3,objNull,[objNull]] call BIS_fnc_param;
if (_target == player) then { _unit = player; };
if (isNull _unit || !(_unit isKindOf "Man") || !(isPlayer _unit) || !(alive _unit)) exitWith {hint "Trop tard il ne peut pas recevoir de transfusion";};
if(player distance _target > 6) exitWith {}; //Not close enough.
if (vehicle player != player) exitWith { hint "Vous ne pouvez pas l'aider depuis votre vehicule." };
life_action_inUse = true; //Lockout the controls.
//Setup our progress bar
_success = false;
_title = format["Transfusion sanguine %1",name _unit];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.2;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (!alive player || !alive _unit) exitWith {};
	if(player distance _target > 7) exitWith {};
	if(_cP >= 1) exitWith{ _success = true; }
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if (!_success) exitWith { hint "La transfusion a echoué."; };

if(!([false,"bloodbag",1] call life_fnc_handleInv)) exitWith {};

_damage = 0.25;

if (_unit == player) then
{
	_unit setDamage _damage;
	titleText["Vous vous êtes fait une transfusion sanguine.","PLAIN"];
}
else
{
	_unit setDamage _damage;
	titleText[format["Vous avez fait une transfusion à %1.", name _unit],"PLAIN"];
	[[2,format["%1 vous avez fait une transfusion.",name player]],"life_fnc_broadcast",_unit,false] spawn BIS_fnc_MP;
};
life_action_inUse = false;