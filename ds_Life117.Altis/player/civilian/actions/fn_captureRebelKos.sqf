/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Used by rebels to capture the rebel KOS zone
*/

private["_tooFar","_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_sleep"];
_group = shawn1 getVariable ["gangOwner",grpNull];
_flag = _this select 0;
_gangName = (group player) getVariable ["gangName",""];
if(_gangName isEqualTo "")exitwith{hint "You must be in a gang to capture this hideout"};
if(_group == (group player)) exitWith {hint "Your gang already owns this area"};
_tooFar = false;
if((shawn1 getVariable ["inCapture",FALSE])) exitWith {hint "This is already being captured";};
if((DS_infoArray select 15) > 29)then
	{
	_sleep = 600;
	}
	else
	{
	_sleep = 900;
	};
if(DS_item_quickCap > 0)then
	{
	["quickCap",false,1] call DS_fnc_handleInventory;
	_sleep = 300;
	hint "Quick Cap Item Used";
	sleep 2;
	};
[[_sleep,player],"HUNT_fnc_rebelKos",false,false] spawn BIS_fnc_MP;
[[],"DS_fnc_kosAlert"] spawn DS_fnc_MP;
// Fuck off to a server file to stop wankers exploiting it