private _target = [_this,0,objNull,[objNull]] call BIS_fnc_param;
private _side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
if(damage _target isEqualTo 0) exitWith {hint "Die Person ist nicht verletzt.";};
_healed = ["heal"]call ESG_fnc_skilltime;
_healed = (_healed / 100);
if((1 - (damage _target)) >= _healed) exitWith {hint "Du kannst die Person nicht mehr höher heilen!"};
if(!([false,"bandage",1] call life_fnc_handleInv)) exitWith {hint "Du hast keine Bandagen.";};
life_action_inUse = true;
_dmg = getDammage _target;
if(_target isEqualTo player) then {
	player playmove "ainvpknlmstpslaywrfldnon_medic";
	sleep 9;
	_target setdamage (_dmg - _healed);
	hint "Du hast Dich erfolgreich selbst geheilt.";
} else {
	player playmove "ainvpknlmstpslaywrfldnon_medicother";
	sleep 9;
	_target setdamage (_dmg - _healed);
	hint format ["Du hast erfolgreich %1 geheilt.",_target getVariable ["realname",name _target]];
};
["heal",1] call ESG_fnc_skilladd;
life_action_inUse = false;