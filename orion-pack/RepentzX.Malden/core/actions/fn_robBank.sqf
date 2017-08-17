#include "..\..\script_macros.hpp"


private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_Pos","_rndmrk","_mrkstring","_bankReward","_reward","_vault"];

_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_action = [_this,2] call BIS_fnc_param;//Action name
_cops = (west countSide playableUnits);
_vault = param [0,ObjNull,[ObjNull]];
if(typeOf _vault == "Land_CargoBox_V1_F" && time - (bank_bank getVariable ["reset",time]) < 3200) exitWith {hint "The bank was recently robbed!";};
if(_cops < 7) exitWith {["You cannot rob this shop, 7 or more police need to be on",false,"slow"] call life_fnc_notificationSystem;};
if(side _robber isEqualTo west) exitWith { ["What do you think you are doing?",false,"slow"] call life_fnc_notificationSystem; };
if(side _robber isEqualTo independent) exitWith { ["What do you think you are doing?",false,"slow"] call life_fnc_notificationSystem; };
if(_robber distance _shop > 25) exitWith { ["You need to be within 25 meters to rob this shop!",false,"slow"] call life_fnc_notificationSystem; };
if (vehicle player != _robber) exitWith { ["Get out of your car!",false,"slow"] call life_fnc_notificationSystem; };
if !(alive _robber) exitWith {};

if(!([false,"codeCracker",1] call life_fnc_handleInv)) exitWith { ["You dont have a code Cracker",false,"slow"] call life_fnc_notificationSystem; };

_bankReward = [

	"goldenbarz3"
];
_reward = _bankReward select floor random count _bankReward;

life_inv_codeCracker = life_inv_codeCracker - 1;

_kassa = 80000 + round(random 30000);
[1,format["ALARM! - %1 Robbery in progress", _shop]] remoteExec ["life_fnc_broadcast",west]; 
remoteExec ['life_fnc_AAN_Bank2',-2];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbing, empty your inventory for gold bars, stay within 25 meters (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
bank_bank setVariable["reset",time,true];
[1,"The bank is being robbed!"] remoteExec ["life_fnc_broadcast",0]; // General broadcast alert to everyone, uncomment for testing, or if you want it anyway.

while{true} do
{
	uiSleep 7;
	_cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_robbingMultiplier", 1]));
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Robbing, empty your inventory for gold bars, stay within 25 meters (%1%2)...",round(_cP * 100),"%"];

	if(_cP >= 1 OR !alive _robber) exitWith {};
	if(_robber distance _shop > 25) exitWith {};
	if((_robber getVariable["restrained",false])) exitWith {};
	if(life_istazed) exitWith {} ;
	if(life_interrupted) exitWith {};
};


	if!(alive _robber) exitWith {  life_rip = false; call life_fnc_hudUpdate; };
	if(_robber distance _shop > 25) exitWith {  ["You are too far away, robbery failed!",false,"slow"] call life_fnc_notificationSystem; 5 cutText ["","PLAIN"]; life_rip = false; call life_fnc_hudUpdate;};
	if(_robber getVariable "restrained") exitWith { life_rip = false; ["You have been arrested!",false,"slow"] call life_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call life_fnc_hudUpdate;};
	if(life_istazed) exitWith {  life_rip = false; ["You have been downed!",false,"slow"] call life_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call life_fnc_hudUpdate;};

5 cutText ["","PLAIN"];
titleText[format["You have recieved $%1 and some gold bars from the robbery, Run!!",[_kassa] call life_fnc_numberText],"PLAIN"];
[true,_reward,5] call life_fnc_handleInv;
civRDM = civRDM + _kassa;
["robbank"] spawn mav_ttm_fnc_addExp;
[] call life_fnc_hudSetup;
[0] call SOCK_fnc_updatePartial;

_rip = false;
life_use_atm = true; // Robber can not use the ATM at this point.
//playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
if!(alive _robber) exitWith {};
[0,format["Police News: The bank has just been robbed: the stolen ammount of money was $%3 and some gold bars!",name _robber, _shop, [_kassa] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",west];
[0,format["Police News: The bank has just been robbed: the stolen ammount of money was $%3 and some gold bars, if you have seen the robbers, contact police!",name _robber, _shop, [_kassa] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",civilian];
[getPlayerUID _robber,name _robber,"15"] remoteExec ["life_fnc_wantedAdd",2];

[] call life_fnc_hudUpdate;
uiSleep (2 * 60);

