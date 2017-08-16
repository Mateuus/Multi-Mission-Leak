/*
    Server-side part of the robbing process. Runs checks and makes sure two people 
    are not trying to rob the same shop at the same time.
*/
private["_shop","_robber","_action","_robber2"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;

if(isNull _shop OR isNull _robber) exitWith {}; //checks that the info sent is actually being sent, if not script ends. 
if(!alive _robber) exitWith {};
_robber2 = owner _robber; //we are setting the owner of the request so we know who to return things to.

if((_shop getVariable["rip",false])) exitWith
{
    [[1,"Hier wird derzeit ausgeraubt"],"ES_fnc_broadcast",_robber2,false] spawn ES_fnc_MP;
}; // if the variable is already set for this shop, it means someone else is robbing it right now and we give the person trying a message about that and end the script. 
if((_shop getVariable["locked",false])) exitWith
{
    [[1,"This station was robbed recently, no money here!"],"ES_fnc_broadcast",_robber2,false] spawn ES_fnc_MP;
}; // We are checking if the cooldown-timer is still in effect. If it is, we tell the caller about it and ends the script. 
if(_robber2 < 1) exitWith {}; //If there is no owner of the call, we end it here.
_shop setVariable["rip",true,true];
[[_shop,_robber,_action],"ES_fnc_robShops2",_robber2,false] spawn ES_fnc_MP; //we have now done all the checks and it is time to start the robbery script locally for the robber.