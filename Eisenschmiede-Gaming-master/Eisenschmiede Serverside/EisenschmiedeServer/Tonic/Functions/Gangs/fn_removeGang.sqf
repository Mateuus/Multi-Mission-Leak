#include "\EisenschmiedeServer\Tonic\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
private["_group","_groupID"];
_group = param [0,grpNull,[grpNull]];
if(isNull _group) exitWith {};

_groupID = _group getVariable ["gang_id",-1];
if(EQUAL(_groupID,-1)) exitWith {};

[format["UPDATE gangs SET active='0' WHERE id='%1'",_groupID],1] call ES_fnc_asyncCall;

_result = [format["SELECT id FROM gangs WHERE active='1' AND id='%1'",_groupID],2] call ES_fnc_asyncCall;
if(EQUAL(count _result,0)) then {
	[_group] remoteExecCall ["ES_fnc_gangDisbanded",(units _group)];
	sleep 5;
	deleteGroup _group;
};

["CALL deleteOldGangs",1] call ES_fnc_asyncCall;