#include "..\..\..\macros.hpp"
/*
	Author: Karel Moricky

	Description:
	Send function for remote execution (and executes locally if conditions are met)

	Parameter(s):
		0: ANY - function params
		1: STRING - function name
		2 (Optional):
			BOOL - true to execute on every client, false to execute it on server only
			OBJECT - the function will be executed only where unit is local [default: everyone]
			GROUP - the function will be executed only on client who is member of the group
			SIDE - the function will be executed on all players of the given side
			NUMBER - the function will be executed only on client with the given ID
			ARRAY - array of previous data types
		3 (Optional): BOOL - true for persistent call (will be called now and for every JIP client) [default: false]
	
	Returns:
	ARRAY - sent packet
*/

with missionnamespace do 
{
	private ["_params","_functionName","_target","_isPersistent","_isCall","_ownerID"];

	_params = 	param [0,[]];
	_functionName =	param [1,"",[""]];
	_target =	param [2,true,[objnull,true,0,[],sideUnknown,grpnull,""]];
	_isPersistent =	false; //Persistent capabilities removed due to I fucking hate that option.
	_isCall =	param [4,false,[false]];

	//--- Send to server
	if(isServer && isDedicated) then {
		DWEV_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,"__SERVER__","__SERVER__"];
	} else {
//		DWEV_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,getMyName,getPlayerUID player];
		DWEV_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,getMyName,getPlayerUID player];
	};
	publicvariableserver "DWEV_fnc_MP_packet";

	//--- Local execution
	if !(ismultiplayer) then {
		["DWEV_fnc_MP_packet",DWEV_fnc_MP_packet] spawn DWEV_fnc_MPexec;
	};

	DWEV_fnc_MP_packet
};