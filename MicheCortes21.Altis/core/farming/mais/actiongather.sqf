//#############################################################
//##  author: Shriver Basdekis                               ##
//##  file: actiongather.sqf                                 ##
//##  For: NSGaming Community                                ##
//##  description: SUPER TOLLES NEUES FARMING DINGENS BUMS   ##
//##                                                         ##
//##  Klauen ist uncool & ihr sterbt an AIDS ^^              ##
//##  Keine Verwendung ohne Erlaubniss !                     ##
//#############################################################
 
private["_ui","_progress","_pgText","_cp","_this"];
_player = _this select 0;
_action = _this select 2;
_gather = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;


[true,"mais_Unrefined",3] call life_fnc_handleInv;
 
// Entfernt Action
_player removeAction _action;
   
// Progress-Bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Du baust Mais ab, bleib in der Nähe (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.10;
 
while{true} do
{
    sleep 0.35;
    _cP = _cP + 0.10;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["Du baust Mais ab, bleib in der Nähe (%1%2)...",round(_cP * 100),"%"];
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    if(_cP >= 1) exitWith {};
};

5 cutText [" ","PLAIN"];

titleText["Du hast 3 Mais gesammelt !","PLAIN"];;
 
// Fügt Action wieder ein
_action = _gather addAction["Mais abbauen","core\farming\mais\actiongather.sqf"];