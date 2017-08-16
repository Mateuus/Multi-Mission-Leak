/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Starts suv taxi missions
*/
//if(isServer)exitwith{};

private ["_sleep","_rand","_time","_gift","_coal","_amount"];

_amount = DS_item_rabbit;
if(_amount < 10)exitwith {hint "You need to bring ten Rabbits to receive a reward, rabbits can be found all over Altis (Only bring Rabbits found further than 8km's away from Kavala"};

if((DS_maxWeight - DS_currentWeight) < 1)exitwith{hint "You need at least 1kg of space to claim a gift"};
if((getPlayerUID player) in DS_gotGift)exitwith{hint "You have already received your gift today"};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
["rabbit",false,10] call DS_fnc_handleInventory;
_time = ((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2));
hint "Retrieving gift....";
_sleep = random 3;
sleep _sleep;
DS_gotGift pushBack (getPlayerUID player);
publicVariable "DS_gotGift";
_gift = 0;
_coal = [];

_rand = round random 20;
switch(_rand)do
	{
	case 0:
		{
		if(_time < 600)then{_gift = 0};
		if((_time > 599)&&(_time < 3000))then{_gift = 2};
		if((_time > 2999)&&(_time < 6000))then{_gift = 3};
		if((_time > 5999)&&(_time < 12000))then{_gift = 3};
		if(_time > 11999)then{_gift = 4};
		};
	case 1:
		{
		if(_time < 600)then{_gift = 0};
		if((_time > 599)&&(_time < 3000))then{_gift = 2};
		if((_time > 2999)&&(_time < 6000))then{_gift = 3};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 2:
		{
		if(_time < 600)then{_gift = 0};
		if((_time > 599)&&(_time < 3000))then{_gift = 2};
		if((_time > 2999)&&(_time < 6000))then{_gift = 3};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 3:
		{
		if(_time < 600)then{_gift = 0};
		if((_time > 599)&&(_time < 3000))then{_gift = 3};
		if((_time > 2999)&&(_time < 6000))then{_gift = 4};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 4:
		{
		if(_time < 600)then{_gift = 2};
		if((_time > 599)&&(_time < 3000))then{_gift = 3};
		if((_time > 2999)&&(_time < 6000))then{_gift = 4};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 5:
		{
		if(_time < 600)then{_gift = 2};
		if((_time > 599)&&(_time < 3000))then{_gift = 3};
		if((_time > 2999)&&(_time < 6000))then{_gift = 4};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 6:
		{
		if(_time < 600)then{_gift = 5};
		if((_time > 599)&&(_time < 3000))then{_gift = 6};
		if((_time > 2999)&&(_time < 6000))then{_gift = 6};
		if((_time > 5999)&&(_time < 12000))then{_gift = 7};
		if(_time > 11999)then{_gift = 7};
		};
	case 7:
		{
		if(_time < 600)then{_gift = 6};
		if((_time > 599)&&(_time < 3000))then{_gift = 7};
		if((_time > 2999)&&(_time < 6000))then{_gift = 6};
		if((_time > 5999)&&(_time < 12000))then{_gift = 7};
		if(_time > 11999)then{_gift = 8};
		};
	case 8:
		{
		if(_time < 600)then{_gift = 6};
		if((_time > 599)&&(_time < 3000))then{_gift = 6};
		if((_time > 2999)&&(_time < 6000))then{_gift = 6};
		if((_time > 5999)&&(_time < 12000))then{_gift = 7};
		if(_time > 11999)then{_gift = 7};
		};
	case 9:
		{
		if(_time < 600)then{_gift = 9};
		if((_time > 599)&&(_time < 3000))then{_gift = 10};
		if((_time > 2999)&&(_time < 6000))then{_gift = 11};
		if((_time > 5999)&&(_time < 12000))then{_gift = 12};
		if(_time > 11999)then{_gift = 13};
		};
	case 10:
		{
		if(_time < 600)then{_gift = 9};
		if((_time > 599)&&(_time < 3000))then{_gift = 9};
		if((_time > 2999)&&(_time < 6000))then{_gift = 10};
		if((_time > 5999)&&(_time < 12000))then{_gift = 11};
		if(_time > 11999)then{_gift = 12};
		};
	case 11:
		{
		if(_time < 600)then{_gift = 14};
		if((_time > 599)&&(_time < 3000))then{_gift = 14};
		if((_time > 2999)&&(_time < 6000))then{_gift = 14};
		if((_time > 5999)&&(_time < 12000))then{_gift = 14};
		if(_time > 11999)then{_gift = 15};
		};
	case 12:
		{
		if(_time < 600)then{_gift = 14};
		if((_time > 599)&&(_time < 3000))then{_gift = 14};
		if((_time > 2999)&&(_time < 6000))then{_gift = 15};
		if((_time > 5999)&&(_time < 12000))then{_gift = 15};
		if(_time > 11999)then{_gift = 16};
		};
	case 13:
		{
		if(_time < 600)then{_gift = 0};
		if((_time > 599)&&(_time < 3000))then{_gift = 2};
		if((_time > 2999)&&(_time < 6000))then{_gift = 3};
		if((_time > 5999)&&(_time < 12000))then{_gift = 3};
		if(_time > 11999)then{_gift = 4};
		};
	case 14:
		{
		if(_time < 600)then{_gift = 0};
		if((_time > 599)&&(_time < 3000))then{_gift = 2};
		if((_time > 2999)&&(_time < 6000))then{_gift = 3};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 15:
		{
		if(_time < 600)then{_gift = 0};
		if((_time > 599)&&(_time < 3000))then{_gift = 2};
		if((_time > 2999)&&(_time < 6000))then{_gift = 3};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 16:
		{
		if(_time < 600)then{_gift = 0};
		if((_time > 599)&&(_time < 3000))then{_gift = 3};
		if((_time > 2999)&&(_time < 6000))then{_gift = 4};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 17:
		{
		if(_time < 600)then{_gift = 2};
		if((_time > 599)&&(_time < 3000))then{_gift = 3};
		if((_time > 2999)&&(_time < 6000))then{_gift = 4};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 18:
		{
		if(_time < 600)then{_gift = 2};
		if((_time > 599)&&(_time < 3000))then{_gift = 3};
		if((_time > 2999)&&(_time < 6000))then{_gift = 4};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 19:
		{
		if(_time < 600)then{_gift = 2};
		if((_time > 599)&&(_time < 3000))then{_gift = 3};
		if((_time > 2999)&&(_time < 6000))then{_gift = 4};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	case 20:
		{
		if(_time < 600)then{_gift = 2};
		if((_time > 599)&&(_time < 3000))then{_gift = 3};
		if((_time > 2999)&&(_time < 6000))then{_gift = 4};
		if((_time > 5999)&&(_time < 12000))then{_gift = 4};
		if(_time > 11999)then{_gift = 4};
		};
	};
/*
if((getPlayerUID player) in _coal)exitwith
	{
	player say3D "failSound";
	hint "Oh No... Santa doesn't seem to be very impressed with you, He has given you a lump of coal that fell apart once you held it";
	sleep 5;
	DS_doingStuff = false;
	};
*/
//cops - Low Money
if((!(playerSide isEqualTo civilian))&&(_gift < 5))exitwith
	{
	[250000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $250k, it has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//cops - med Money
if((!(playerSide isEqualTo civilian))&&(_gift > 4)&&(_gift < 10))exitwith
	{
	[500000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $500k, it has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//cops - high Money
if((!(playerSide isEqualTo civilian))&&(_gift > 9))exitwith
	{
	[1000000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $1m, it has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Money - Low
if(_gift == 0)exitwith
	{
	[50000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $50k, it has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Money - med
if(_gift == 1)exitwith
	{
	[150000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $150k, it has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Money - high
if(_gift == 2)exitwith
	{
	[300000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $300k, it has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Money - very high
if(_gift == 3)exitwith
	{
	[600000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $600k, it has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Money - extreme high
if(_gift == 4)exitwith
	{
	[1000000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $1m, it has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Vehicle - Low
if(_gift == 5)exitwith
	{
	DS_vehicleGarage = [];
	[(getPlayerUID player),civilian,"Car","C_Hatchback_01_sport_F",false,false,false] remoteExec ["HUNT_fnc_vehicleRewards",2];
	hint "Congratulations, your gift today was a hatchback sport, it has been added to your garage";
	sleep 5;
	DS_doingStuff = false;
	};

//Vehicle - med
if(_gift == 6)exitwith
	{
	DS_vehicleGarage = [];
	[(getPlayerUID player),civilian,"Air","B_Heli_Light_01_F",false,false,false] remoteExec ["HUNT_fnc_vehicleRewards",2];
	hint "Congratulations, your gift today was a Hummingbird, it has been added to your garage";
	sleep 5;
	DS_doingStuff = false;
	};

//Vehicle - high
if(_gift == 7)exitwith
	{
	DS_vehicleGarage = [];
	[(getPlayerUID player),civilian,"Air","I_Heli_light_03_unarmed_F",false,false,false] remoteExec ["HUNT_fnc_vehicleRewards",2];
	hint "Congratulations, your gift today was a Hellcat, it has been added to your garage";
	sleep 5;
	DS_doingStuff = false;
	};

//Vehicle - Very high
if(_gift == 8)exitwith
	{
	DS_vehicleGarage = [];
	[(getPlayerUID player),civilian,"Air","B_Plane_CAS_01_F",false,false,false] remoteExec ["HUNT_fnc_vehicleRewards",2];
	hint "Congratulations, your gift today was a Caesar BTT, it has been added to your garage";
	sleep 5;
	DS_doingStuff = false;
	};

//item - low
if(_gift == 9)exitwith
	{
	["spyDocs",true,1] call DS_fnc_handleInventory;
	hint "Congratulations, your gift today was a spyDoc, it has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//item - med
if(_gift == 10)exitwith
	{
	["steroids",true,1] call DS_fnc_handleInventory;
	hint "Congratulations, your gift today was a Steroid, it has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//item - high
if(_gift == 11)exitwith
	{
	["vehSecurityAdv",true,1] call DS_fnc_handleInventory;
	hint "Congratulations, your gift today was an advanced vehicle security kit, it has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//item - very high
if(_gift == 12)exitwith
	{
	["gunNavid",true,1] call DS_fnc_handleInventory;
	hint "Congratulations, your gift today was a Navid, it has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//item - extremely high
if(_gift == 13)exitwith
	{
	["pawnee",true,1] call DS_fnc_handleInventory;
	hint "Congratulations, your gift today was a Dar Pawnee, it has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//Rebel tokens - 250
if(_gift == 14)exitwith
	{
	_tempNum = (DS_realEstateArray select 6);
	_tempNum = _tempNum + 250;
	DS_realEstateArray set [6,_tempNum];
	hint "Congratulations, your gift today was 250 rebel tokens, it has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//Rebel tokens - 500
if(_gift == 15)exitwith
	{
	_tempNum = (DS_realEstateArray select 6);
	_tempNum = _tempNum + 500;
	DS_realEstateArray set [6,_tempNum];
	hint "Congratulations, your gift today was 500 rebel tokens, it has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//Rebel tokens - 1000
if(_gift == 16)exitwith
	{
	_tempNum = (DS_realEstateArray select 6);
	_tempNum = _tempNum + 1000;
	DS_realEstateArray set [6,_tempNum];
	hint "Congratulations, your gift today was 1000 rebel tokens, it has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};