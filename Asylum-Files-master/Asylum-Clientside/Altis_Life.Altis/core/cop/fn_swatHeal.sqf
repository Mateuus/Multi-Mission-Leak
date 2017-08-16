/*
	File: swatHeal.sqf
	Author: Skalicon
	
	Description:
*/
private["_unit"];
if ((_this select 3) == 1) then
{
	_unit = player;
	_displayName = "self";
}
else
{
	_unit = cursorTarget;
	if(isNull _unit) exitwith {};
	_displayName = name _unit;
};

_upp = format["Healing %1",_displayName];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;

_cP = 0.01;

while{true} do
{
	if(animationState player != "ainvpknlmstpsnonwnondnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.27;
	_cP = _cP + 0.02;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
};
		
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(player != vehicle player) exitWith {titleText["You cannot heal people while in a vehicle.","PLAIN"];};
_unit setDamage 0;
titleText[format["You have healed %1.",_displayName],"PLAIN"];