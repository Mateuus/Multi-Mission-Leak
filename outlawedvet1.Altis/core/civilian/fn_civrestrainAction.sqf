/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit","_pos","_marker"];
if(playerSide in [west,independent]) exitWith {hint"Can't ziptie police or medics!";};
if (vehicle player != player) exitWith { hint "Get out of your vehicle!" };
if(!alive player) exitWith {hint"You dead homie.. dafuq";};

if(license_civ_rebel) then {
if(life_inv_ziptie < 1) exitWith {hint"You don't have zip-ties, how are you gone tie someone without zip-ties are you mental?";};
_unit = cursorObject;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit isEqualTo west) exitWith {};
if(player isEqualTo _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!
player say3D "Ziptie";
[false,"ziptie",1] call life_fnc_handleInv;
deleteMarker "Markerrestrained"; 
_Pos = position player; 
				                _marker = createMarker ["Markerrestrained", _Pos]; 
				                "Markerrestrained" setMarkerColor "ColorOrange";
				                "Markerrestrained" setMarkerText "! Kidnapping !";
				                "Markerrestrained" setMarkerType "mil_warning";		
								
								
_unit setVariable["restrained",true,true];
//diag_log format["civ restrain unit: %1",_unit];
[player] remoteExec ["life_fnc_civrestrain",_unit];
[0,"STR_NOTF_Restrained",true,[_unit getVariable ["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",civilian];
[getPlayerUID player,profileName,"207"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
} else {
hint "You do not have a rebel training license, so you have no idea how these things work!"
};