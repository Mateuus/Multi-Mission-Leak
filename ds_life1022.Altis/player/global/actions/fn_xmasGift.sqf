/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gives a player a Christmas gift
*/

private ["_sleep","_rand","_time","_gift","_coal"];

if((DS_maxWeight - DS_currentWeight) < 1)exitwith{hint "You need at least 1kg of space to claim a gift"};
if(isNil "DS_gotGift")exitwith{hint "Sorry, Santa isn't visiting anymore today"};
if(typeName DS_gotGift != "ARRAY")exitwith{hint "Sorry, Santa isn't visiting anymore today"};
if((getPlayerUID player) in DS_gotGift)exitwith{hint "You have already received your gift today - Come back after the next server restart"};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
_time = ((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2));
hint "Retrieving gift....";
_sleep = random 3;
sleep _sleep;
DS_gotGift pushBack (getPlayerUID player);
publicVariable "DS_gotGift";
_gift = 0;
_coal = [];/*["76561198125509027","76561198121385553","76561198147233827","76561198081682586","76561198088653446","76561198136193031",
"76561198076226243","76561198050680729","76561198046034574","76561198047807813","76561198133969002","76561198277690426",
"76561198066467374","76561198070500489","76561198045676810","76561198063407354","76561198053660049","76561198106478135",
"76561198180390250","76561198150482728","76561198251139532","76561198272166816","76561198106208610"];*/

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

if((getPlayerUID player) in _coal)exitwith
	{
	player say3D "failSound";
	hint "Oh no... Santa doesn't seem to be very impressed with you. He has given you a lump of coal that fell apart once you held it";
	sleep 5;
	DS_doingStuff = false;
	};

//Cops - Low Money
if((!(playerSide isEqualTo civilian))&&(_gift < 5))exitwith
	{
	[100000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $100k, it has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Cops - Med Money
if((!(playerSide isEqualTo civilian))&&(_gift > 4)&&(_gift < 10))exitwith
	{
	[250000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $250k. It has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Cops - High Money
if((!(playerSide isEqualTo civilian))&&(_gift > 9))exitwith
	{
	[500000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $500k. It has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Money - Low
if(_gift == 0)exitwith
	{
	[10000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $10k. It has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Money - Med
if(_gift == 1)exitwith
	{
	[50000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $50k. It has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Money - High
if(_gift == 2)exitwith
	{
	[100000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $100k. It has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Money - Very High
if(_gift == 3)exitwith
	{
	[250000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $250k. It has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Money - Extreme High
if(_gift == 4)exitwith
	{
	[500000,true,true] call DS_fnc_handleMoney;
	hint "Congratulations, your gift today was $500k. It has been deposited into your bank";
	sleep 5;
	DS_doingStuff = false;
	};

//Vehicle - Low
if(_gift == 5)exitwith
	{
	DS_vehicleGarage = [];
	[(getPlayerUID player),civilian,"Car","C_Hatchback_01_sport_F",false,false,false] remoteExec ["HUNT_fnc_vehicleRewards",2];
	hint "Congratulations, your gift today was a hatchback sport. It has been added to your garage";
	sleep 5;
	DS_doingStuff = false;
	};

//Vehicle - Med
if(_gift == 6)exitwith
	{
	DS_vehicleGarage = [];
	[(getPlayerUID player),civilian,"Air","B_Heli_Light_01_F",false,false,false] remoteExec ["HUNT_fnc_vehicleRewards",2];
	hint "Congratulations, your gift today was a Hummingbird. It has been added to your garage";
	sleep 5;
	DS_doingStuff = false;
	};

//Vehicle - High
if(_gift == 7)exitwith
	{
	DS_vehicleGarage = [];
	[(getPlayerUID player),civilian,"Air","I_Heli_light_03_unarmed_F",false,false,false] remoteExec ["HUNT_fnc_vehicleRewards",2];
	hint "Congratulations, your gift today was a Hellcat. It has been added to your garage";
	sleep 5;
	DS_doingStuff = false;
	};

//Vehicle - Very High
if(_gift == 8)exitwith
	{
	DS_vehicleGarage = [];
	[(getPlayerUID player),civilian,"Air","C_Plane_Civil_01_F",false,false,false] remoteExec ["HUNT_fnc_vehicleRewards",2];
	hint "Congratulations, your gift today was a Caesar BTT. It has been added to your garage";
	sleep 5;
	DS_doingStuff = false;
	};

//Item - Low
if(_gift == 9)exitwith
	{
	["spyDocs",true,1] call DS_fnc_handleInventory;
	hint "Congratulations, your gift today was a spyDoc. It has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//Item - Med
if(_gift == 10)exitwith
	{
	["steroids",true,1] call DS_fnc_handleInventory;
	hint "Congratulations, your gift today was a Steroid. It has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//Item - High
if(_gift == 11)exitwith
	{
	["vehSecurityAdv",true,1] call DS_fnc_handleInventory;
	hint "Congratulations, your gift today was an advanced vehicle security kit. It has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//Item - Very High
if(_gift == 12)exitwith
	{
	["gunNavid",true,1] call DS_fnc_handleInventory;
	hint "Congratulations, your gift today was a Navid. It has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//Item - Extremely High
if(_gift == 13)exitwith
	{
	["pawnee",true,1] call DS_fnc_handleInventory;
	hint "Congratulations, your gift today was a DAR Pawnee. It has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//Rebel Tokens - 250
if(_gift == 14)exitwith
	{
	_tempNum = (DS_realEstateArray select 6);
	_tempNum = _tempNum + 250;
	DS_realEstateArray set [6,_tempNum];
	hint "Congratulations, your gift today was 250 rebel tokens. It has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//Rebel Tokens - 500
if(_gift == 15)exitwith
	{
	_tempNum = (DS_realEstateArray select 6);
	_tempNum = _tempNum + 500;
	DS_realEstateArray set [6,_tempNum];
	hint "Congratulations, your gift today was 500 rebel tokens. It has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};

//Rebel Tokens - 1000
if(_gift == 16)exitwith
	{
	_tempNum = (DS_realEstateArray select 6);
	_tempNum = _tempNum + 1000;
	DS_realEstateArray set [6,_tempNum];
	hint "Congratulations, your gift today was 1000 rebel tokens. It has been added to your inventory";
	sleep 5;
	DS_doingStuff = false;
	};