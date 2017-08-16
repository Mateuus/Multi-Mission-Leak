/*-----------------------------------------------------------------------------

       Author: G00golplexian
       Name: fn_getin.sqf
       Description: rein ins auto

------------------------------------------------------------------------------*/
private["_unit","_pos","_veh"];

_unit = _this select 0;
_pos = _this select 1;
_veh = _this select 2;


if(_veh isKindOf "Air" && driver _veh == _unit && side _unit != west) then
{
	"on" call life_fnc_rageRadio;
};