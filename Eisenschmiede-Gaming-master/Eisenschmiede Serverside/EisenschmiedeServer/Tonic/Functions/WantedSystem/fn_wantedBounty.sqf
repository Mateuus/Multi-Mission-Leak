#include "\EisenschmiedeServer\Tonic\script_macros.hpp"
/*
	File: fn_wantedBounty.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Checks if the person is on the bounty list and awards the cop for killing them.
*/
private["_civ","_cop","_id","_half"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_cop = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_half = [_this,2,false,[false]] call BIS_fnc_param;
if(isNull _civ OR isNull _cop) exitWith {};

_id = [(getPlayerUID _civ),ES_wanted_list] call ES_fnc_index;
if(_id != -1) then {
	if(_half) then {
		[((ES_wanted_list select _id) select 3) / 2,((ES_wanted_list select _id) select 3)] remoteExecCall ["ES_fnc_bountyReceive",(owner _cop)];
	} else {
		[(ES_wanted_list select _id) select 3,(ES_wanted_list select _id) select 3] remoteExecCall ["ES_fnc_bountyReceive",(owner _cop)];
	};
};