/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Script for police rescuing hostages
*/
private ["_failed","_name"];

_selection = ((_this select 3) select 0);
_failed = false;
_name = (name player);
if(vehicle player != player)exitwith{hint "Sure bud.. how do you expect to take the documents while you're in a vehicle???";};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

switch (_selection) do
	{
	case "civ":
		{
			if(spy getVariable ["captured",false])exitwith{hint "The spy has already been captured";DS_doingStuff = false;};
			if(alive VipTarget)exitwith
				{
				hint 'You must kill the spy to steal his papers';
				systemchat "You must kill the spy to steal his papers";
				DS_doingStuff = false;
				};
			systemchat "Taking papers";
			hint 'Taking papers';
			if(spy getVariable ["captured",false])exitwith{hint "The spy has already been captured";DS_doingStuff = false;};
			spy setVariable ["captured",true,true];
			waituntil {DS_rewardSpy};
			if(!(spy getVariable ["captured",false]))exitwith{hint "The spy has already been captured";DS_doingStuff = false;};
			spy setVariable ["captured",false,true];
			systemchat "You now have the documents, you can sell them at any Rebel outpost";
			hint "You now have the documents, you can sell them at any Rebel outpost";
			if((DS_infoArray select 17) == 13)then
				{
				[2] call DS_fnc_questCompleted;
				};
			["spyDocs",true,1] call DS_fnc_handleInventory;
			[25,false] spawn DS_fnc_moralAlter;
			["511"] spawn DS_fnc_addCharge;
		};
	case "cop":
		{
			if(!alive VipTarget)exitwith
				{
				hint 'You were too late, whatever the spy knew died with him';
				systemchat "You were too late, whatever the spy knew died with him";
				deleteMarker _markername;
				deleteVehicle VipTarget;
				DS_doingStuff = false;
				};
			systemchat "Detaining spy";
			hint 'Detaining spy';
			doStop VipTarget;
			sleep 0.2;
			if(spy getVariable ["detained",false])exitwith{hint "This spy has already been detained";DS_doingStuff = false;};
			spy setVariable ["detained",true,true];
			waituntil {DS_rewardSpy};
			[[7500,"has collected the spy documents",(name player)],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
			[75,true] spawn DS_fnc_moralAlter;
			[[25000,true],"HUNT_fnc_policeBank"] spawn DS_fnc_MP;
			if((DS_infoArray select 21) == 19)then
				{
				[3] call DS_fnc_questCompleted;
				};
		};
	};
sleep 20; //Incase server lags
DS_doingStuff = false;

