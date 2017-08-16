//#############################################################
//##  author: Shriver Basdekis                               ##
//##  file: actionpflanzen.sqf                               ##
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

if(life_inv_maisseeds < 1) exitWith {
	hintSilent "Du brauchst Maiskörner um etwas Anpflanzen zu können. Diese bekommst du am Örtlichen Samenhändler. ( Auf der Karte mit : Samenhandel markiert )";
};
 
// Entfernt Action
_player removeAction _action;
 
// Progress-Bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Du planzt Maiskörner ein, bleib in der Nähe (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
while{true} do
{
    sleep 0.35;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["Du planzt Maiskörner ein, bleib in der Nähe (%1%2)...",round(_cP * 100),"%"];
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    if(_cP >= 1) exitWith {};
};
 
5 cutText ["Du hast Maiskörner gepflanzt & kannst diese jetzt pfücken.","PLAIN"];

[false,"maisseeds",1] call life_fnc_handleinv;
 
// Fügt Action (Abbauen ein)
_action = _gather addAction["Mais pfücken","core\farming\mais\actiongather.sqf"];