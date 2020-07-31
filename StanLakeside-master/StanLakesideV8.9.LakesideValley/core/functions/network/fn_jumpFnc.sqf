/*
	File: fn_jumpFnc.sqf
	
	
	Description:
	Makes the target jump.
*/

params [["_unit", objNull, [objNull]], ["_run", true, [false]], "_vel", "_dir", "_v1", "_v2", "_anim"];
if(isNull _unit) exitWith {}; //Bad data
if(local _unit && !_run) exitWith {}; //Ahh
if(animationState _unit isEqualTo "AovrPercMrunSrasWrflDf_amovpercmsprsnonwnondf_amovppnemstpsnonwnondnon") exitWith {};
if(animationState _unit isEqualTo "amovpercmsprsnonwnondf_amovppnemstpsnonwnondnon") exitWith {};
if(animationState _unit isEqualTo "AovrPercMrunSrasWrflDf") exitWith {};
_velocity = velocity _unit;

if(local _unit) then {
	_v1 = 3.82;
	_v2 = .4;
	_dir = direction player;
	_vel = velocity _unit;
	_unit setVelocity[(_vel select 0)+(sin _dir*_v2),(_vel select 1)+(cos _dir*_v2),(_vel select 2)+_v1];
};

_anim = animationState _unit;
_unit switchMove "AovrPercMrunSrasWrflDf";
if(local _unit) then {
	waitUntil{animationState _unit != "AovrPercMrunSrasWrflDf"};
	_unit switchMove _anim;
};