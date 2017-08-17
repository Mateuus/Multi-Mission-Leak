#include "..\..\script_macros.hpp"

//if((west countSide playableUnits) < 3) exitWith {hint "There needs to be at least three member of police on to break into the Prison";};
private["_prisonvault","_handle","_bomb","_marker"];

_prisonvaultPos = [7202.766,3956.178,4.591];
_prisonvaultVariablesPos = [10044.836,6061.898,-1.612];
_prisonvault = nearestObject [_prisonvaultPos,"Land_Canal_WallSmall_10m_F"];
_prisonvaultVariables = nearestObject [_prisonvaultVariablesPos,"Land_Canal_WallSmall_10m_F"];
//if(cursorTarget != prison_safe) exitWith {hint "You aren't looking at the Prison Wall!"};
if(isNull _prisonvault) exitWith {}; //Bad object
//if(typeOf _prisonvault != "Land_Fortress_01_10m_F") exitWith {hint "This isn't the breakable Prison Wall!"};
if(_prisonvaultVariables getVariable["pchargeplaced",false]) exitWith {hint "A charge has already been placed. Back off!"};
if(_prisonvaultVariables getVariable["prison_open",false]) exitWith {hint "The wall has already been destroyed!"};
if(!([false,"demolitioncharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_prisonvaultVariables setVariable["pchargeplaced",true,true];

[_prisonvault,"chargeSound"] remoteexeccall ["say3D",0];

_speaker1Pos = [7209.027,3945.781,2.021];
_speaker1 = nearestObject [_speaker1Pos,"Land_Loudspeakers_F"];
_speaker2Pos = [7181.817,4010.734,-0.021];
_speaker2 = nearestObject [_speaker2Pos,"Land_Loudspeakers_F"];
_speaker3Pos = [7254.952,4041.422,0.342];
_speaker3 = nearestObject [_speaker3Pos,"Land_Loudspeakers_F"];
_speaker4Pos = [7282.084,3976.091,2.766];
_speaker4 = nearestObject [_speaker4Pos,"Land_Loudspeakers_F"];

_speaker1 say3D "jail";
_speaker2 say3D "jail";
_speaker3 say3D "jail";
_speaker4 say3D "jail";

_toSend = [];
_toSend pushBack player;
{
	if (side _x isEqualTo west) then {
		_toSend pushBack _x;
	};
	
	if (side _x isEqualTo civilian) then {
		private _arrested = _x getVariable ["arrested", false]; 
		if (_arrested) then {
			_toSend pushBack _x;
		};
	};
}forEach playableUnits;

[_prisonvault, _prisonvaultVariables] remoteExec ["life_fnc_JailBreakHandle",2];
[_prisonvaultVariables] remoteExec ["life_fnc_prisonWallTimer",_toSend];


