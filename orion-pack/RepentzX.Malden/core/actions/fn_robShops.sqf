#include "..\..\script_macros.hpp"
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_Pos","_rndmrk","_mrkstring"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_action = [_this,2] call BIS_fnc_param;//Action name
_cops = (west countSide playableUnits);

if(_cops < 5) exitWith {["You cannot rob this shop, 6 or more police need to be on",false,"slow"] call life_fnc_notificationSystem;};
if(side _robber isEqualTo west) exitWith { ["What do you think you are doing?",false,"slow"] call life_fnc_notificationSystem; };
if(side _robber isEqualTo independent) exitWith { ["What do you think you are doing?",false,"slow"] call life_fnc_notificationSystem; };
if(_robber distance _shop > 20) exitWith { ["You need to be within 5 meters to rob this shop!",false,"slow"] call life_fnc_notificationSystem; };
if (vehicle player != _robber) exitWith { ["Get out of your car!",false,"slow"] call life_fnc_notificationSystem; };

if (currentWeapon _robber isEqualTo "") exitWith { ["You cannot rob anyone without the proper equiptment, get a gun first!",false,"slow"] call life_fnc_notificationSystem; };

if !(alive _robber) exitWith {};

_kassa = 10000 + round(random 20000);
_shop removeAction _action;
//_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 85) then {[1,format["ALARM! - %1 Robbery in progress", _shop]] remoteExec ["life_fnc_broadcast",west]; };
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbing the store, stay within 5 meters (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

   _rndmrk = random(1000);
   _mrkstring = format ["wrgMarker_%1", _rndmrk];
   _Pos = position player;
   _marker = createMarker [_mrkstring, _Pos];
   _marker setMarkerColor "ColorRed";
   _marker setMarkerText "!Warning! >>>>>> Robbery in progress <<<<<< !Warning!";
   _marker setMarkerType "mil_warning";
[1,"A store is being robbed!"] remoteExec ["life_fnc_broadcast",0]; // General broadcast alert to everyone, uncomment for testing, or if you want it anyway.

while{true} do
{
	uiSleep 2.00;
	_cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_robbingMultiplier", 1]));
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Robbing the store, stay within 5 meters (%1%2)...",round(_cP * 100),"%"];

	if(_cP >= 1 OR !alive _robber) exitWith {};
	if(_robber distance _shop > 5.1) exitWith {deleteMarker _marker;};
	if((_robber getVariable["restrained",false])) exitWith {};
	if(life_istazed) exitWith {deleteMarker _marker;} ;
	if(life_interrupted) exitWith {deleteMarker _marker;};
};


	if!(alive _robber) exitWith { deleteMarker _marker; life_rip = false;call life_fnc_hudUpdate; };
	if(_robber distance _shop > 5.1) exitWith { deleteMarker _marker; ["You are too far away, robbery failed!",false,"slow"] call life_fnc_notificationSystem; 5 cutText ["","PLAIN"]; life_rip = false; call life_fnc_hudUpdate;};
	if(_robber getVariable "restrained") exitWith { deleteMarker _marker; life_rip = false; ["You have been arrested!",false,"slow"] call life_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call life_fnc_hudUpdate;};
	if(life_istazed) exitWith { deleteMarker _marker; life_rip = false; ["You have been downed!",false,"slow"] call life_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call life_fnc_hudUpdate;};

   5 cutText ["","PLAIN"];
   titleText[format["You have recieved $%1 from the robbery, Run!!",[_kassa] call life_fnc_numberText],"PLAIN"];
   deleteMarker _marker;
   civRDM = civRDM + _kassa;
   ["robshop"] spawn mav_ttm_fnc_addExp;
   [] call life_fnc_hudSetup;
   [0] call SOCK_fnc_updatePartial;

   _rip = false;
	//sleep (30 + random(180)); //Clerk in the store takes between 30-210 seconds before he manage to warn the police about the robbery.
	life_use_atm = true; // Robber can not use the ATM at this point.
	//playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
	if!(alive _robber) exitWith {};
[0,format["Police News: A store has just been robbed: the stolen ammount of money was $%3!",name _robber, _shop, [_kassa] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",west];
[0,format["Police News: A store has just been robbed: the stolen ammount of money was $%3!, if you have seen the robbers, contact police!",name _robber, _shop, [_kassa] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",civilian];
[getPlayerUID _robber,name _robber,"15"] remoteExec ["life_fnc_wantedAdd",2];


uiSleep 1200;
_action = _shop addAction["Rob Shop",life_fnc_robShops];
//_shop switchMove "";
