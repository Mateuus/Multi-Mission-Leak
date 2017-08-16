/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Uses Zipties
*/
private["_unit"];
_unit = cursorTarget;

if((_unit getVariable "cuffed")||(_unit getVariable "Escorted")||(_unit getVariable "ziptied")) exitWith {};
if(isNull _unit) exitWith{};//Not valid
if(player == _unit) exitWith{};
if(DS_item_ziptie <= 0)exitWith{hint "You do not have any zipties"};
if(DS_item_ziptie > 0)then 
	{
	["ziptie",false,1] call DS_fnc_handleInventory;
	[[player,_unit],"DS_fnc_ziptied",_unit,false] spawn DS_fnc_MP;
	player say3D "zip";
	[4,false] spawn DS_fnc_moralAlter;
	//["207"] spawn DS_fnc_addCharge;
	titleText ["Warning - Killing someone who is restrained will remove 20% from your bank account","PLAIN"];
	hint "Warning - Killing someone who is restrained will remove 20% from your bank account";
	systemchat "Warning - Killing someone who is restrained will remove 20% from your bank account";
	if((DS_infoArray select 17) == 6)then
		{
		[2] call DS_fnc_questCompleted;
		};
	if(((side _unit) == west)&&((DS_infoArray select 17) == 14))then
		{
		[2] call DS_fnc_questCompleted;
		};
	};