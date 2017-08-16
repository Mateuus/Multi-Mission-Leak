/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Simple Script Kiddie detector, will be worked on
*/
private ["_cheat","_miscChecker","_moneyChecker","_value1","_value2","_increase","_report"];
if((getPlayerUID player) in DS_adminList4)exitwith{};

_cheat = "";
sleep 60;
_value1 = DS_coin;
_value2 = DS_atmCoin;
while{true}do
		{
		DS_soldVehicle = 0;
		if(DS_coin > (_value1 + 500000))then
			{
			_cheat = format ["Money increased by $%1 in the past 60 seconds",[(DS_coin - _value1)] call DS_fnc_numberText];
				{
					if(_x getVariable ["DSAdmin",false])then
						{
						[[(name player),_cheat],"DS_fnc_DarkSide_ShowAll",_x,false] spawn DS_fnc_MP;
						};
				}forEach playableUnits;
			};
		if(DS_atmCoin > (_value2 + 500000))then
			{
			_cheat = format ["Bank Money increased by $%1 in the past 60 seconds",[(DS_atmCoin - _value2)] call DS_fnc_numberText];
				
			};
		if(!isNull (uiNamespace getVariable "RscDisplayDebugPublic"))then
			{
			_cheat = "Has debug menu open";
			DSL_Haxor = true;
			[] spawn DS_fnc_compileData;
			};
		if((life_cash > 0)||(life_atmCash > 0))then
			{
			_cheat = "Has attempted to spawn in money";
			DSL_Haxor = true;
			[] spawn DS_fnc_compileData;
			};
		if((isEngineOn (vehicle player))&&(vehicle player isKindOf "Tank")&&((typeOf (vehicle player) != "I_APC_Wheeled_03_cannon_F")))then
			{
			_cheat = "Driving in a tank";
			DSL_Haxor = true;
			[] spawn DS_fnc_compileData;
			_vehicle = (vehicle player);
			sleep 10;
			[player,"Driving a hacked in vehicle"] spawn DS_fnc_tempBanPlayer
			};
		if(DS_soldVehicle > 10)then
			{
			_cheat = "Sold more than 10 vehicles in the past 60 seconds (Possibly spam selling)";
			DSL_Haxor = true;
			};
		if(DSL_Haxor)then
			{
			if(_cheat == "")then{_cheat = "Unknown cheat - Still perm ban"};
			[[(getPlayerUID player),"1",_cheat,"19"],"HUNT_fnc_adminNotes",false,false] spawn BIS_fnc_MP;
			};
		if(_cheat != "")then
			{
				{
					if(_x getVariable ["DSAdmin",false])then
							{
							[[(name player),_cheat],"DS_fnc_DarkSide_ShowAllAdmins",_x,false] spawn DS_fnc_MP;
							};
				}forEach playableUnits;
			_cheat = "";
			};
		_value1 = DS_coin;
		_value2 = DS_atmCoin;
		sleep 60;
		};




