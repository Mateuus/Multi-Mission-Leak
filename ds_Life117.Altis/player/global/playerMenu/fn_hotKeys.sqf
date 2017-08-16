/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Items that can be used with hotkeys
*/

private["_type","_exit","_chance","_complete","_typeOfItem","_curTarget"];

_type = _this select 0;
_typeOfItem = "";
_exit = true;
_complete = false;

switch(_type)do
	{
	case 0://Eat
		{
		if((_exit)&&(DS_item_donut > 0))then{_typeOfItem = "donut";_exit = false};
		if((_exit)&&(DS_item_apple > 0))then{_typeOfItem = "apple";_exit = false};
		if((_exit)&&(DS_item_rabbit > 0))then{_typeOfItem = "rabbit";_exit = false};
		if((_exit)&&(DS_item_ornate > 0))then{_typeOfItem = "ornate";_exit = false};
		if((_exit)&&(DS_item_mackerel > 0))then{_typeOfItem = "mackerel";_exit = false};
		if((_exit)&&(DS_item_tuna > 0))then{_typeOfItem = "tuna";_exit = false};
		if((_exit)&&(DS_item_mullet > 0))then{_typeOfItem = "mullet";_exit = false};
		if((_exit)&&(DS_item_catshark > 0))then{_typeOfItem = "catshark";_exit = false};
		if((_exit)&&(DS_item_turtle > 0))then{_typeOfItem = "turtle";_exit = false};
		if((_exit)&&(DS_item_salema > 0))then{_typeOfItem = "salema";_exit = false};
		if((_exit)&&(DS_item_tbacon > 0))then{_typeOfItem = "tbacon";_exit = false};
		if((_exit)&&(DS_item_peach > 0))then{_typeOfItem = "peach";_exit = false};
		if((_exit)&&(DS_item_burger > 0))then{_typeOfItem = "burger";_exit = false};
		if((_exit)&&(DS_item_pie > 0))then{_typeOfItem = "pie";_exit = false};
		if((_exit)&&(DS_item_chips > 0))then{_typeOfItem = "chips";_exit = false};
		if((_exit)&&(DS_item_doritos > 0))then{_typeOfItem = "doritos";_exit = false};
		if((_exit)&&(DS_item_tbacon > 0))then{_typeOfItem = "tbacon";_exit = false};
		if(_exit) exitwith {hint "You have no food in your inventory"};
		[_typeOfItem] spawn DS_fnc_eat;
		[_typeOfItem,false,1] call DS_fnc_handleInventory;
		};
	case 1://Drink
		{
		if((_exit)&&(DS_item_water > 0))then{_typeOfItem = "water";_exit = false};
		if((_exit)&&(DS_item_coffee > 0))then{_typeOfItem = "coffee";_exit = false};
		if((_exit)&&(DS_item_pepsi > 0))then{_typeOfItem = "pepsi";_exit = false};
		if(_exit) exitwith {hint "You have no drink in your inventory"};
		[_typeOfItem] spawn DS_fnc_drink;
		[_typeOfItem,false,1] call DS_fnc_handleInventory;
		};
	case 2://Heal
		{
		if(DS_item_mediKit > 0)then
			{
			[] spawn DS_fnc_medikit;
			["medikit",false,1] call DS_fnc_handleInventory;
			}
			else
			{
			hint "You do not have a medikit in your inventory";
			};
		};
	case 3://Spikes
		{
		if((playerside != west)&&(!(player getVariable ["security",false])))exitwith{hint "You can not use spikestrips"};
		if(DS_item_spikeStrip > 0)then
			{
			["spikeStrip",false,1] call DS_fnc_handleInventory;
			[] spawn DS_cop_deploySpikes;
			}
			else
			{
			hint "You have no spikestrips in your inventory";
			};
		};
	case 4://GoKart
		{
		if(DS_item_goKart > 0)then
			{
			if(DS_jailed)exitwith{hint "You can not use this item in jail"};
			[_item,false,1] call DS_fnc_handleInventory;
			["C_Kart_01_Blu_F","Portable Kart",_item] spawn DS_fnc_setUpItem;
			}
			else
			{
			hint "You do not have a goKart in your inventory";
			};
		};
	case 5://Fuel Dart
		{
		if((playerside == west)&&(currentWeapon player == "launch_B_Titan_short_F")) then
			{
			[] spawn DS_fnc_fuelDart;
			};
		};
	case 6://Bargates
		{
		if((playerside != west)&&(!(player getVariable ["security",false])))exitwith{hint "You can not use this hotkey"};
		[DS_openGate] spawn DS_cop_barGates;
		};
	case 7://Lock Gang
		{
		if(playerside != civilian)exitwith{hint "You can not use this hotkey"};
		_gangName = (group player) getVariable ["gangName",""];
		if((_gangName != "")&&((DS_infoArray select 15) > 27))then
			{
			[] spawn DS_civ_gangLock;
			};
		};
	case 8://Increase View Distance
		{
		DS_viewDistance = DS_viewDistance + 500;
		if(DS_viewDistance > 10000)then{DS_viewDistance = 10000};
		hint format ["View Distance Increased to %1m",round(DS_viewDistance)];
		setViewDistance DS_viewDistance;
		};
	case 9://Decrease View Distance
		{
		DS_viewDistance = DS_viewDistance - 500;
		if(DS_viewDistance < 500)then{DS_viewDistance = 500};
		hint format ["View Distance Decreased to %1m",round(DS_viewDistance)];
		setViewDistance DS_viewDistance;
		};
	case 10://Police Inform target to pullover
		{
		if((player getVariable ["policeSquad",""]) != "Highway Patrol")exitwith{};
		[] call DS_cop_highwayPullover;
		};
	};
	
	
