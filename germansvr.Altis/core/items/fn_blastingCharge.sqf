/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle","_dome","_glitch"];

_glitch = 1;
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(_vault != fed_bank) exitWith {}; //Not the Federal Bank

if(((fed_bank getVariable "Rsb") getVariable "bis_disabled_Door_1") == 1) then
{
	_glitch = 0;
	_dome = fed_bank getVariable "Dome";
	for "_i" from 1 to 7 do
	{	//1 gleich close 0 = open
		if(_dome getVariable (format["bis_disabled_Door_%1",_i]) == 0) then {_glitch = 1;};
	};
	if(_glitch == 0) then
	{
		[[0,1,2], "STR_Fed_Glitch", true, [player getVariable ["realname",name player]]] remoteExec ["life_fnc_broadcast", -2, false];
		
		//STRAFE MUSS SEIN AB INSCOP HQ UND GEFESSELT BLEIBEN !!!
		player setPos (getMarkerPos "cop_spawn_1");
		player setVariable["restrained",true,true];
		[2,-1,"Ich hab mich in die Bank GEGLITCHED und stehe gefesselt im Polizei HQ Kavalla und warte auf meine Bestrafung !!!"] call life_fnc_newMsg;
		player say3D "GlitchUse";
		[] spawn {
			while {player getVariable "restrained"} do
			{
				if(vehicle player == player) then
				{
					player playMove "AmovPercMstpSnonWnonDnon_Ease";
				};
	
				waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained")};
			
				if(!alive player) exitWith
				{
					player setVariable ["restrained",false,true];
					player setVariable ["Escorting",false,true];
					player setVariable ["transporting",false,true];
					detach player;
				};

				if(vehicle player != player) then
				{
					if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
				};
			};
				
			if(alive player) then
			{
				player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
				player setVariable ["Escorting",false,true];
				player setVariable ["transporting",false,true];
				detach player;
			};
		};
		//ENDE VOM RESTARAIN :D
	};
};

if(_glitch == 0) exitWith{};

if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if(_vault getVariable["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(_vault getVariable["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable["chargeplaced",true,true];
[0,"STR_ISTR_Blast_Placed"] remoteExec ["life_fnc_broadcast", west, false];
[player, null, 1, "[BANK]", "Hat das C4 platziert"] remoteExec ["TEX_FNC_LOGIT", 2];
hint localize "STR_ISTR_Blast_KeepOff";
_handle = [] spawn life_fnc_demoChargeTimer;
[] remoteExec ["life_fnc_demoChargeTimer", west, false];

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];

hint localize "STR_ISTR_Blast_Opened";