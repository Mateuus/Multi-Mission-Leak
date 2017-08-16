/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Treats any sicknesses that your player may have
*/

private["_sickness","_action","_price"];

if(DS_doingStuff)exitwith{};
_sickness = [];
_price = 1000;
if(isNil "DS_uselessMedic")then{DS_uselessMedic = false;};
if(player getVariable ["DS_sick_infection",false])then
	{
	_sickness = [20000,"Infection","being operated on with dirty equipment"];
	};
if(player getVariable ["medic",false])then
	{
	if(DS_uselessMedic)then
		{
		_sickness = [30000,"A Wound","a bullet wound"];
		};
	};
if(!(_sickness isEqualTo []))then
	{
	_price = (_sickness select 0);
	};
if(playerSide isEqualTo west)then{_price = (round(_price/4));};
DS_doingStuff = true;
hint "The doctor is taking a look over you, please wait...";
systemchat "The doctor is taking a look over you, please wait...";
if(((DS_infoArray select 13) == 28)&&(playerside == civilian))then { [0] call DS_fnc_questCompleted };
if(((DS_infoArray select 13) == 28)&&(playerside == civilian))then {
	_price = (_price*0.5);
};
if(_sickness isEqualTo [])exitwith{hint "You do not appear to have any illness";DS_doingStuff = false;};

_action = [
		format ["Oh! Yes, you seem to be suffering from %1, this is caused by %2. To get you fully healed it's going to cost you $%3, would you like treatment?",(_sickness select 1),(_sickness select 2),[_price] call DS_fnc_numberText],
		"Get treated",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

if(!_action)exitwith{hint "Your choice.. I wouldn't advise it though...";DS_doingStuff = false;};
if([_price,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank for this treatment"};
hint "Alright, hold still... Lets get this over and done with sir";
systemchat "Alright, hold still... Lets get this over and done with sir";

sleep 10;
hint "There you go sir, all healed up... Please stop by anytime...";
systemchat "There you go sir, all healed up... Please stop by anytime...";

player setVariable ["DS_sick_infection",false,true];
player enableFatigue false;
[_price,true,false] call DS_fnc_handleMoney;
if(!DS_uselessMedic)then
	{
	[12] call DS_fnc_alterStats;
	}
	else
	{
	DS_uselessMedic = false;
	};

player setDamage 0;
DS_doingStuff = false;
[] call DS_fnc_compileData;