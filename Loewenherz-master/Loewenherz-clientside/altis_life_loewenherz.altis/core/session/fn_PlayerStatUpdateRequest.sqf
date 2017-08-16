/*
	File:	fn_PlayerStatUpdateRequest.sqf
	Author: "Leo" Loewenherz-Projekt
	
	Description:
	Sends Playerstats to Server
*/
private["_packet","_client"];
_client = param [0,player,[ObjNull]];
_uid = _client getVariable["steam64ID",""];
if (_uid == "") exitWith {};

_packet = [_uid,_client];

[_packet,"lhm_fnc_updatePlayerStats",false,false] call lhm_fnc_mp; //need [_uid,_client]