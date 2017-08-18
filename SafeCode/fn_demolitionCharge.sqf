/*
	Original Author: Bryan "Tonic" Boardwine
	Demo-Charge Editor: ColinM9991
	
	Description:
*/
bombVehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull bombVehicle) exitWith {}; //Bad object
if(player getVariable["restrained",false]) exitWith {hint localize "STR_ISTR_Restrained"};
if(player getVariable["playercharge",false]) exitWith {hint localize "STR_ISTR_Demo_AlreadyPlaced"};
if(bombVehicle getVariable["dchargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(!([false,"demolitioncharge",1] call life_fnc_handleInv)) exitWith { hint "You have no Demolition Charges"; }; //Error?
closeDialog 0;

player setVariable["playercharge",true,true];
bombVehicle setVariable["dchargeplaced",true,true];

bTouchOff = {
	if(!(bombVehicle getVariable["dchargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"; player removeAction touchoffAction; player setVariable["playercharge",false,true];};
	_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL bombVehicle select 0, getPosATL bombVehicle select 1, (getPosATL bombVehicle select 2)+0.5];
	player setVariable["playercharge",false,true];
	bombVehicle setVariable["dchargeplaced",false,true];
	hintSilent "The bomb has been detonated";
	player removeAction touchoffAction;
};

[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 6;
touchoffAction = player addAction ["<t color=""#FFE496"">" +"Touch-Off Explosives", bTouchOff,"",0,false,false,"",' player distance bombVehicle < 110 '];
hintSilent localize "STR_ISTR_Demo_Planted";