/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: CooliMC
	
	Description:
	NEW FUNCTION SETSKINS
*/
private["_unit","_item","_skinitems"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;
_skinitems = ["U_Rangemaster","U_B_SpecopsUniform_sgg","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam_worn","U_B_CombatUniform_mcam","U_B_CTRG_1","U_B_CTRG_3","U_I_HeliPilotCoveralls","U_Rangemaster","B_Kitbag_cbr","B_Kitbag_sgg"];

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

if(_item in _skinitems) then
{
	[] call tanoarpg_fnc_setSkinns;
};

[3] call XAS_fnc_updatePartial;