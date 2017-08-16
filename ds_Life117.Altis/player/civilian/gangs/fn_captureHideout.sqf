/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Updates the gang members list
*/

disableSerialization;
private["_gangName","_gangInfo","_members","_dialog","_gangList","_textBox","_playerlist","_sleep","_owners","_ownersStr"];
closeDialog 0;

_gangName = (group player) getVariable ["gangName",""];
if(_gangName isEqualTo "")exitwith{hint "You must be in a gang to capture this hideout"};
_action = true;

if(DS_moral < 200)then
	{
	_sleep = 0.5;
	}
	else
	{
	_sleep = 1;
	};

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
_owners = _hideout getVariable ["gangOwner",objNull];

if((!isNull _owners)&&(_owners isEqualTo (group player)))exitwith{hint "Your gang already holds this area"};
	
if(!isNull _owners)then
	{
	_sleep = (_sleep*2);
	_ownersStr = _owners getVariable ["gangName",""];
	_action = [
		format ["This gang area is currently held by %1, are you sure you want to remove their ownership over it?",_ownersStr],
		"Gang Area Owned",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	};
if(!_action)exitwith{};
if((DS_infoArray select 15) > 25)then
	{
	_sleep = (_sleep*0.8);
	};
if((DS_infoArray select 15) > 30)then
	{
	_sleep = (_sleep*0.5);
	};
DS_doingStuff = true;

disableSerialization;
_title = "Capturing Hideout";
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
	
	sleep _sleep;
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
	if(!alive player)exitwith{};
	};
DS_doingStuff = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player)exitwith{};
if(player distance (_gangInfo select 2) > 10) exitwith {hint "You moved too far from the flag"};
if((vehicle player) != player) exitwith {hint "You can not enter a vehicle while doing this"};

_hideout = getPos player nearestObject "Land_i_Barracks_V2_F";
_owners = _hideout getVariable ["gangOwner",grpNull];
if((!isNull _owners)&&(_owners isEqualTo (group player)))exitwith{hint "Your gang already holds this area"};	

titleText["The Gang Hideout has been captured.","PLAIN"];
_hideout setVariable["gangOwner",(group player),true];
[[0,format["%2 member %1 has just captured a gang hideout",name player,(group player) getVariable "gangName"]],"DS_fnc_globalMessage",civilian,false] spawn BIS_fnc_MP;
[[1,format["%2 member %1 has just captured a gang hideout",name player,(group player) getVariable "gangName"]],"DS_fnc_globalMessage",civilian,false] spawn BIS_fnc_MP;
if((DS_infoArray select 15) == 7)then
	{
	[1] call DS_fnc_questCompleted;
	};