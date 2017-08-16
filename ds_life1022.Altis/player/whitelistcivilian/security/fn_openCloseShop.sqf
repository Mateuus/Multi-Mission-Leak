/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens or closes a shop after it has been robbed
*/

private ["_station","_closed","_robbed","_end","_action"];

_closed = false;
_robbed = false;
_end = false;

if(DS_doingStuff)exitwith{};

switch (true) do
	{
	case (player distance gasdesk1 < 50) : {_station = [1,"Kore",gasdesk1]};
	case (player distance gasdesk2 < 50) : {_station = [2,"Chalkeia",gasdesk2]};
	case (player distance gasdesk3 < 50) : {_station = [3,"Zaros",gasdesk3]};
	case (player distance gasdesk4 < 50) : {_station = [4,"Paros",gasdesk4]};
	case (player distance gasdesk5 < 50) : {_station = [5,"Athira",gasdesk5]};
	case (player distance gasdesk6 < 50) : {_station = [6,"Charkia",gasdesk6]};
	case (player distance gasdesk7 < 50) : {_station = [7,"Pyrgos",gasdesk7]};
	case (player distance gasdesk8 < 50) : {_station = [8,"Lakka",gasdesk8]};
	case (player distance gasdesk9 < 50) : {_station = [9,"Panochori",gasdesk9]};
	case (player distance gasdesk10 < 50) : {_station = [10,"Sofia",gasdesk10]};
	case (player distance hosp1 < 50) : {_station = [12,"Sofia",hosp1]};
	case (player distance hosp2 < 50) : {_station = [13,"Telos",hosp2]};
	};

if([player,15,independent] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when another player is so nearby","PLAIN"];};
/*
_action = [
		"Removing money from this station makes you K.O.S to possible robbers, Continue??",
		"Remove money",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

if(!_action)exitwith{};
*/
_closed = ((_station select 2) getVariable ["closed",false]);
_robbed = (DS_securityArray select (_station select 0));

if((!(_closed))&&(_robbed == 0))exitWith
	{
	hint "This shop has not been robbed recently enough to close";
	};

if(_closed)exitWith
	{
	_action = [
		"This shop is closed already",
		"Open/Close shop",
		"Re-open",
		"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_end = true;};
	hint "This shop has been re-opened";
	(_station select 2) setVariable ["closed",false,true];
	DS_securityArray set [(_station select 0),0];
	publicVariable "DS_securityArray";
	};
if(_end)exitwith{};
(_station select 2) setVariable ["closed",true,true];
[(_station select 2),player,(_station select 0)] remoteExec ["HUNT_fnc_closeStore",2];
_str = parseText "<t color='#01DF01' size='1.5'><br/>This shop is now closed to the public, it will remain closed for 15 minutes, until you leave or until you re-open it.<br/></t>";
hint _str;
systemchat "This shop is now closed to the public, it will remain closed for 15 minutes, until you leave or until you re-open it.";

sleep 10;

_str = parseText "<t color='#01DF01' size='1.5'><br/>If you remain in the area and protect this shop, you will be paid for your services<br/></t>";
hint _str;
systemchat "If you remain in the area and protect this shop, you will be paid for your services";

if(((DS_infoArray select 19) == 3)&&((_station select 0) in [1,2,3,4,5,6,7,8,9,10]))then {
		_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 4)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};

if(((DS_infoArray select 19) == 11)&&((_station select 0) in [12,13]))then {
		_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 2)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};

if(((DS_infoArray select 19) == 13)&&((_station select 0) in [1,2,3,4,5,6,7,8,9,10]))then {
		_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 4)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};

if(((DS_infoArray select 19) == 19)&&((_station select 0) in [12,13]))then {
		_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 4)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};

if(((DS_infoArray select 19) == 25)&&((_station select 0) in [1,2,3,4,5,6,7,8,9,10]))then {
		_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 9)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};

if(((DS_infoArray select 19) == 28)&&((_station select 0) in [1,2,3,4,5,6,7,8,9,10]))then {
		_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 14)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};

if(((DS_infoArray select 19) == 31)&&((_station select 0) in [12,13]))then {
		_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 9)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};