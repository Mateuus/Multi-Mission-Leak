/*
    Changes state of stations. serverside
*/
private["_shop","_robber","_action","_state"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;
_state = [_this,3,-1,[0]] call BIS_fnc_param;
if(isNull _shop) exitWith {};

switch (_state) do
{
    case -1: //here we set the cooldown variable for the shop, then we fire up a script for all clients that takes care of animations and removal of actions.
    {
        _shop setVariable["locked",true,true];
        [[_shop,_robber,_action,-1],"ES_fnc_shopState",true,true] spawn ES_fnc_MP;
    };
    case 0: //the cooldown timer is set, and we clear the lock, then calls for a serverwide animation change and reinstatement of the action we removed to prevent spam.
    {
    _shop setVariable["rip",false,true];
    sleep 300;
    [[_shop,_robber,_action,0],"ES_fnc_shopState",true,true] spawn ES_fnc_MP;
    _shop setVariable["locked",false,true];

    };
};