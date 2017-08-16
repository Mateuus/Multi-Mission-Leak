#include <macro.h>
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull cursorTarget) exitWith {}; //Bad object
if(player getVariable["playercharge",false]) exitWith {hint localize "STR_ISTR_Demo_AlreadyPlaced"};
if(_vault getVariable["dchargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(!([false,"demolitioncharge",1] call life_fnc_handleInv)) exitWith { hint "Vous n'avez pas de charge explosive"; }; //Error?
player SVAR["playercharge",true,true];
_vault SVAR["dchargeplaced",true,true];_handle = [] spawn life_fnc_manChargeTimer;
waitUntil {scriptDone _handle};
uiSleep 0.9;
if(!(_vault getVariable["dchargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed";};
_bomb = "HelicopterExploSmall" createVehicle [getPosATL _vault select 0, getPosATL _vault select 1, (getPosATL _vault select 2)+0.5];
player SVAR["playercharge",false,true];