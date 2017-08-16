/*-----------------------------------------------------------------------------

       Author: G00golplexian
       Name: fn_getout.sqf
       Description: raus ausm auto

------------------------------------------------------------------------------*/
private["_unit","_pos","_veh"];

_unit = _this select 0;
_pos = _this select 1;
_veh = _this select 2;

if(isNull objectParent _unit && side _unit != west) then 
{
	"off" call life_fnc_rageRadio;
};