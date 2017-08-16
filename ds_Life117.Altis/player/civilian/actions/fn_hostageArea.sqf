/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Hostage Taking Script
*/
private ["_hostage","_pass","_counter","_area","_areaMarker"];

_hostage = _this select 0;
if(_hostage getVariable ["hostage",false])exitWith
	{
	hint "This person is already a hostage";
	};
_area = "";
if(player distance (getMarkerPos "hostageArea1") < 200)then{_area = "Sofia Hostage Area";_areaMarker = "hostageArea1"};
if(player distance (getMarkerPos "hostageArea2") < 200)then{_area = "Pyrgos Hostage Area";_areaMarker = "hostageArea2"};
if(player distance (getMarkerPos "hostageArea3") < 200)then{_area = "Kavala Hostage Area";_areaMarker = "hostageArea3"};
_hostage setVariable ["hostage",true,true];
_payout = _this select 1;
if(_payout)exitWith
	{
	hint format ["The hostage situation was a success and $%1 has been paid into your bank account",[(_this select 2)] call DS_fnc_numberText];
	player say3d "success";
	[[0,format["$%1 was just paid out to %2 as ransom for a hostage",[(_this select 2)] call DS_fnc_numberText,(name player)]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	[[1,format["$%1 was just paid out to %2 as ransom for a hostage",[(_this select 2)] call DS_fnc_numberText,(name player)]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	[[2,format["$%1 was just paid out to %2 as ransom for a hostage",[(_this select 2)] call DS_fnc_numberText,(name player)]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	[(_this select 2),true,true] call DS_fnc_handleMoney;
	[[(round((_this select 2)/10)),"You failed to protect a hostage"],"DS_fnc_punishments",west,false] spawn BIS_fnc_MP;
	sleep 5;
	if((DS_infoArray select 15) == 32)then
		{
		[1] call DS_fnc_questCompleted;
		};
	};
	
if(((primaryWeapon _hostage) isEqualTo "")&&((handgunWeapon _hostage) isEqualTo ""))exitwith
	{
	hint "You can not use this on an unarmed player - release him";
	};
	
_pass = false;

if((!(_hostage getVariable "cuffed"))&&(!(_hostage getVariable "ziptied"))) exitWith {hint "Your hostage must be handcuffed to do this"};
if(isNull _hostage) exitWith{};//Not valid
if(player == _hostage) exitWith{};

_action = [
	format ["Read the following carefully, You are stating that you want to hold %1 hostage and ask for a ransom",(name _hostage)],
	"Hostage Information",
	"Continue",
	"Exit"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

_action = [
	"The police will be notified and a timer will begin, if they do not secure the hostage before the timer expires you will be paid a portion of the hostages bank balance as a ransom",
	"Hostage Information",
	"Continue",
	"Exit"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

_action = [
	"This area becomes a KOS zone during this time, the hostage is never to be harmed. If you are paid the ransom, the hostage will be taken away automatically and allowed to respawn elsewhere",
	"Hostage Information",
	"Continue",
	"Exit"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(!([5] call DS_fnc_countPlayers))exitWith	
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You can not do this while there is less than 5 whitelisted police officers online, you must release your hostage<br/></t>";
	hint _str;	
	};
if((DS_infoArray select 15) > 32)then
{
	[[0,format["A hostage situation is underway. Someone has taken %2 hostage and is holding him at the %3. You must get there and remove the hostage from the area within 15 minutes to prevent a ransom being paid",(name player),(name _hostage),_area]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	[[1,format["A hostage situation is underway. Someone has taken %2 hostage and is holding him at the %3. You must get there and remove the hostage from the area within 15 minutes to prevent a ransom being paid",(name player),(name _hostage),_area]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;	
}
else
{
	[[0,format["A hostage situation is underway. %1 has taken %2 hostage and is holding him at the %3. You must get there and remove the hostage from the area within 15 minutes to prevent a ransom being paid",(name player),(name _hostage),_area]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	[[1,format["A hostage situation is underway. %1 has taken %2 hostage and is holding him at the %3. You must get there and remove the hostage from the area within 15 minutes to prevent a ransom being paid",(name player),(name _hostage),_area]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;	
};

[[0,format["%1 is requesting a ransom for your life, If you are not removed from this area within 15 minutes some of your bank account will be used to pay the ransom (The police have been informed)",(name player)]],"DS_fnc_globalMessage",_hostage,false] spawn BIS_fnc_MP;
[[1,format["%1 is requesting a ransom for your life, If you are not removed from this area within 15 minutes some of your bank account will be used to pay the ransom (The police have been informed)",(name player)]],"DS_fnc_globalMessage",_hostage,false] spawn BIS_fnc_MP;	

hint "You are requesting a ransom be paid for your hostage, you must keep them secure for 15 minutes (The police have been informed)";

_counter = 15;

["207"] spawn DS_fnc_addCharge;

while{true}do
	{
	sleep 60;
	_counter = _counter - 1;
	if(_hostage distance (getMarkerPos _areaMarker) > 200)exitwith{_pass = false;hint "Hostage Situation failed because the hostage was moved out of the zone"};
	if(!alive _hostage)exitwith{_pass = false;hint "Hostage Situation failed because the hostage is dead"};
	if(_counter == 0)exitwith{_pass = true};
	if((_counter == 10)||(_counter == 5)||(_counter == 1))then
		{
		if((DS_infoArray select 15) > 32)then
			{
				[[0,format["A hostage situation is underway. Someone has taken %2 hostage and is holding him at the %3. You must get there and remove the hostage from the area within %4 minutes to prevent a ransom being paid",(name player),(name _hostage),_area,_counter]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
				[[1,format["A hostage situation is underway. Someone has taken %2 hostage and is holding him at the %3. You must get there and remove the hostage from the area within %4 minutes to prevent a ransom being paid",(name player),(name _hostage),_area,_counter]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;	
			}
			else
			{
				[[0,format["A hostage situation is underway. %1 has taken %2 hostage and is holding him at the %3. You must get there and remove the hostage from the area within %4 minutes to prevent a ransom being paid",(name player),(name _hostage),_area,_counter]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
				[[1,format["A hostage situation is underway. %1 has taken %2 hostage and is holding him at the %3. You must get there and remove the hostage from the area within %4 minutes to prevent a ransom being paid",(name player),(name _hostage),_area,_counter]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;	
			};
		};
	hint format ["There is %1 minute(s) remaining until your mission is complete",_counter];
	systemchat format ["There is %1 minute(s) remaining until your mission is complete",_counter];
	};
	
if(!_pass)exitwith
	{
	if(_hostage distance (getMarkerPos _areaMarker) > 250)then
		{
		[[150000,"rescued a hostage","The police"],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
		};
	};	
[[player],"DS_fnc_hostageAreaVictim",_hostage,false] spawn BIS_fnc_MP;
