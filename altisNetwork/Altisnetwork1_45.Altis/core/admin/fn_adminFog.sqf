#include "..\..\script_macros.hpp"
if(!isServer) exitWith {
  //check the admin level client side, and if it's not enough, quit/show error
  if (FETCH_CONST(life_adminLevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
  
  //titleText needs to run on the client too
  	titleText [localize "STR_ANOTF_Fog","PLAIN"]; titleFadeOut 2;
  
  //otherwise, send the command to the server
  [] remoteExec ["life_fnc_adminFog", 2];
};
//if it's the server .. set the fog
if(isServer) exitWith {
	5 setFog 0;
};