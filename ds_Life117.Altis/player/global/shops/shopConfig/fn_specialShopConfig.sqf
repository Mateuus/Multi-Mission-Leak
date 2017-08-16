/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Fills the array and sets up variables for shop items
*/
private ["_shop","_returnList","_return"];

_shop = _this select 0;
_return = [];

switch(_shop)do
	{
	case 23://Cop bulk items
		{
		if(DS_copLevel < 3)then
			{
			_return = [9000,"policekit",["coffee",4],["donut",4],["mediKit",2],["repairKit",11],["defuse",1],["spikeStrip",2],["UAV",1],["buildingBox",1],["armour",2]];
			}
			else
			{
			_return = [13000,"policekit",["coffee",3],["donut",3],["mediKit",2],["repairKit",10],["defuse",1],["spikeStrip",2],["UAV",1],["fuelDart",4],["buildingBox",1],["ammoFlash",2],["ammoTear",2],["armour",2]];
			if((player getVariable ["policeSquad",""]) == "Highway Patrol")then
				{
				_return = [13000,"policekit",["coffee",3],["donut",3],["mediKit",1],["defuse",1],["spikeStrip",3],["UAV",1],["fuelDart",7],["buildingBox",1],["ammoFlash",1],["ammoTear",2],["armour",2]];
				};
			if((player getVariable ["policeSquad",""]) == "Sharp Shooter")then
				{
				_return = [13000,"policekit",["coffee",2],["donut",2],["mediKit",1],["repairKit",7],["defuse",1],["spikeStrip",3],["fuelDart",2],["UAV",1],["goKart",1],["buildingBox",1],["ammoFlash",1],["ammoTear",2],["armour",2]];
				};	
			};
		};//64
	case 37://Cop armour
		{
		_return = [5000,"bodyArmour",["armour",1]];
		};
	case 97://Sniper Kit
		{
		_return = [25000,"sniperKit",["tbacon",4],["water",3],["goKart",1],["mediKit",5],["repairKit",5],["refuelKit",1],["lockpick",10],["lighter",4],["chute",1],["fire",1],["ziptie",2],["c4",1],["armour",2]];//62
		};
	case 98://General Kit
		{
		_return = [25000,"generalRebel",["doritos",4],["pepsi",3],["mediKit",7],["repairKit",7],["siphonKit",2],["refuelKit",2],["lockpick",10],["lighter",5],["chute",2],["fire",1],["ziptie",4],["c4",1],["armour",2]];//61
		};
	case 125://Security
		{
		_return = [11000,"securityKit",["doritos",5],["pepsi",5],["mediKit",5],["repairKit",15],["refuelKit",1],["chute",2],["spikeStrip",2],["ammoTear",4],["buildingBox",1],["spikeStrip",2],["ammoTear",4],["armour",2]];//50
		};
	case 132://Police lives
		{
		switch(DS_copLevel)do
			{
			case 0:
				{
				_return = [25000,"copLives",["medic",1]];
				};
			case 1:
				{
				_return = [35000,"copLives",["medic",1]];
				};
			case 2:
				{
				_return = [45000,"copLives",["medic",1]];
				};
			case 3:
				{
				_return = [90000,"copLives",["medic",1]];
				};
			case 4:
				{
				_return = [125000,"copLives",["medic",1]];
				};
			case 5:
				{
				_return = [150000,"copLives",["medic",1]];
				};
			case 6:
				{
				_return = [200000,"copLives",["medic",1]];
				};
			case 7:
				{
				_return = [250000,"copLives",["medic",1]];
				};
			};
		};
	};

_return;