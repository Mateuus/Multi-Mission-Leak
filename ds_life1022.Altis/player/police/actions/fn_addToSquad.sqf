/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Adds an officer to his squad
*/

private["_rankStr","_squadNum","_squadStr"];

_squadNum = (DS_realEstateArray select 8);
if(isServer)then
	{
	_squadNum = 3;
	};

if(playerSide isEqualTo west)then
	{
	if((str(player) in ["cop_4","cop_1","cop_3","cop_5","cop_6","cop_7"]))then
		{
		DS_pubCop = true;
		player setVariable["pubCop",true,true];
		}
		else
		{
		player setVariable["cop",true,true];
		};

	[] call DS_cop_updateCopRank;
	};

if(_squadNum == 0)exitwith{};

switch (_squadNum) do
	{
	case 1:
		{
		_squadStr = "Highway Patrol";
		player setVariable ["policeSquad",_squadStr,true];
		[] spawn DS_cop_setupHWP;
		DS_realEstateArray set [8,_squadNum];
		};
	case 2:
		{
		_squadStr = "Rapid Response";
		player setVariable ["policeSquad",_squadStr,true];
		player removeAction DS_copAction1;
		DS_copAction1 = player addAction["Building Items and Shops",DS_fnc_menuShop,[[],[115,116,666,14,21,22,23,37,24,92,69,132]],0,false,false,"",
		' !isNull cursorTarget && ((cursorTarget) isKindOf "LandVehicle") && (player distance cursorTarget) < 8 && (cursorTarget getVariable ["policeVehicle",false]) && ((player getVariable ["policeSquad",""]) == "Rapid Response")'];
		DS_realEstateArray set [8,_squadNum];
		};
	case 3:
		{
		_squadStr = "Sharp Shooter";
		player setVariable ["policeSquad",_squadStr,true];
		[] spawn DS_cop_setupSS;
		DS_realEstateArray set [8,_squadNum];
		};
	case 4:
		{
		_squadStr = "Coast Guard";
		player setVariable ["policeSquad",_squadStr,true];
		[] spawn DS_cop_setupCG;
		DS_realEstateArray set [8,_squadNum];
		};
	case 5:
		{
		_squadStr = "Dog Handler";
		player setVariable ["policeSquad",_squadStr,true];
		[] spawn DS_cop_policeDog;
		DS_realEstateArray set [8,_squadNum];
		};
	};