/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Adds an officer to his squad
	*/
private["_squadNum","_squadStr"];

_squadNum = (DS_realEstateArray select 8);
if(_squadNum == 0)exitwith{};

switch (_squadNum) do
	{
	case 1:
		{
		_squadStr = "Highway Patrol";
		};
	case 2:
		{
		_squadStr = "Rapid Response";
		};
	case 3:
		{
		_squadStr = "Sharp Shooter";
		};
	case 4:
		{
		_squadStr = "Coast Guard";
		};
	};
player setVariable ["policeSquad",_squadStr,true];

/*
Highway Patrol...

10s off boost
repairing a vehicle cost no repair kit
Markers on map for vehicles left on the roads
Markers on the map for human remains on road 
Ability to fire fuel dart from hunter and allowed to use the hunter for patrolling (Check rules)
Ability to use building box from vehicles
Double layered spike strips
Ability to hotkey a vehicle to tell them to pull over/land
Special Hunter texture
Double payment amount from manning checkpoints
Ability to see vehicles I inventory reguardless of rank
Police kit has more fueldarts in it

Rapid Response...

Faster house raiding
5s Police transport timer
2x Faster CP recapture
2x faster jail/bank/power station repair
10s off boost + faster boost
Very fast vehicle repairing
Will not hit animals on the road
Ability to use building box from vehicles
Shops at police vehicles
Ability to transport to cp's when not captured/capturing

Sharp Shooter

Switch to sniper mode
GoKart
Injure mode

Coast Guard

Air vehicles use less fuel
Markers of all air vehicles within 1000m of you while flying an air vehicle
All air vehicles cost 50% less
Hellcat comes with ammo (Normal armed vehicle rules apply)
Can use shops/build items from air vehicles
can fire a fuel dart from boats
boats cooldown between boost is only 5s


*/