/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
For police to evict tenents from hideouts
*/

disableSerialization;
private["_gangInfo","_members","_dialog","_gangList","_textBox","_playerlist","_sleep","_owners","_ownersStr"];
closeDialog 0;

if((player getVariable ["policeAction",""]) != "Raiding")exitwith{hint "You can not do this while your task is not set to raiding"};

_action = false;
if(player distance gangflag2 < 100)then
	{
	_gangInfo = ["Gang Area Two",2,gangFlag2];
	};
if(player distance gangflag1 < 100)then
	{
	_gangInfo = ["Gang Area One",1,gangFlag1];
	};
if(player distance gangflag3 < 100)then
	{
	_gangInfo = ["Gang Area Three",3,gangFlag3];
	};

_hideout = getPos player nearestObject "Land_i_Barracks_V2_F";
_owners = _hideout getVariable ["gangOwner",grpNull];
if(isNull _owners)exitwith{hint "There is no one to evict here"};
if(!isNull _owners)then
	{
	_ownersStr = _owners getVariable ["gangName",""];
	_action = [
		format ["This gang area is currently held by %1, are you sure you want to remove their ownership over it?",_ownersStr],
		"Gang Area Owned",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	};
if(!_action)exitwith{};

DS_doingStuff = true;

disableSerialization;
_title = "Evict Tenents";
5 cutRsc ["DS_progress","PLAIN"];
_ui = uiNamespace getVariable "DS_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cpRate = 0.01;
_cP = 0.01;

while {true} do
	{
	if((DS_infoArray select 21) > 21)then
		{
		sleep 0.2;
		}
		else
		{
		sleep 0.3;
		};
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(player distance (_gangInfo select 2) > 10) exitwith {};
	if((vehicle player) != player) exitwith {};
	if(_cP >= 1 OR !alive player) exitWith {};
	};
DS_doingStuff = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player)exitwith{};
if(player distance (_gangInfo select 2) > 10) exitwith {hint "You moved too far from the flag"};
if((vehicle player) != player) exitwith {hint "You can not enter a vehicle while doing this"};

_hideout = getPos player nearestObject "Land_i_Barracks_V2_F";

_owners = _hideout getVariable ["gangOwner",grpNull];
if(isNull _owners)exitwith{hint "There is no one to evict here"};

titleText["You have evicted the tenants from this gang hideout.","PLAIN"];
_hideout setVariable["gangOwner",grpNull,true];
[[0,"The police department have just evicted a gang from a hideout"],"DS_fnc_globalMessage",civilian,false] spawn BIS_fnc_MP;
[[1,"The police department have just evicted a gang from a hideout"],"DS_fnc_globalMessage",civilian,false] spawn BIS_fnc_MP;
[[15000,true],"HUNT_fnc_policeBank",false,false] spawn DS_fnc_MP;
[[10000,"Evicted a gang from a hideout",name player],"DS_fnc_copRewards",west,false] spawn DS_fnc_MP;
if((DS_infoArray select 21) == 21)then{[3] call DS_fnc_questCompleted;};
