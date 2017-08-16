/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Controls all add actions to give players batterys that are needed to use thermal scopes
*/

private["_type","_amount"];

if(player distance knox_safe2 < 20)then{_type = 0}else{_type = 1};
_amount = 0;

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

switch(_type)do
	{
	case 0:
		{
		if(knox_safe2 getVariable ["closed",false])exitwith{hint "This safe is not cracked open, you must crack it before taking batteries"};
		if([player,10,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not take this when another player is so nearby","PLAIN"];DS_doingStuff = false;};
		_amount = (server_batteryArray select 0);
		if(_amount < 1)exitwith{hint "There is no batteries here to take"};
		DS_item_battery = DS_item_battery + 1;
		_rand = random 10;
		if(_rand > 8)then
			{
			DS_item_jailBreak = DS_item_jailBreak + 1;
			DS_item_steroids = DS_item_steroids + 1;
			DS_item_safeCrackerAdv = DS_item_safeCrackerAdv + 1;
			DS_item_convoy = DS_item_convoy + 1;
			}
			else
			{
			if(_rand > 4)then
				{
				DS_item_steroids = DS_item_steroids + 2;
				DS_item_quickCap = DS_item_quickCap + 2;
				}
				else
				{
				DS_item_steroids = DS_item_steroids + 1;
				};
			};
		hint "You have taken a battery and some items";
		_amount = _amount - 1;
		server_batteryArray set [0,_amount];
		publicVariable "server_batteryArray";
		if((DS_infoArray select 17) == 27)then { [2] call DS_fnc_questCompleted };
		};
	case 1:
		{
		if([player,10,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not take this when another player is so nearby","PLAIN"];DS_doingStuff = false;};
		_amount = (server_batteryArray select 1);
		if(_amount < 1)exitwith{hint "There is no batteries here to take"};
		DS_item_battery = DS_item_battery + 1;
		_rand = random 10;
		if(_rand > 8)then
			{
			DS_item_jailBreak = DS_item_jailBreak + 1;
			DS_item_steroids = DS_item_steroids + 1;
			}
			else
			{
			if(_rand > 4)then
				{
				DS_item_steroids = DS_item_steroids + 2;
				}
				else
				{
				DS_item_steroids = DS_item_steroids + 1;
				};
			};
		hint "You have taken a battery and some items";
		_amount = _amount - 1;
		server_batteryArray set [1,_amount];
		publicVariable "server_batteryArray";
		if((DS_infoArray select 17) == 27)then { [2] call DS_fnc_questCompleted };
		};
	};
sleep 3;
DS_doingStuff = false;
