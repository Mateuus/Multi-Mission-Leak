/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Runs the spike effect on an affected vehicle
*/
private["_vehicle","_rand"];

if((vehicle player) == player)exitwith{};
_vehicle = (vehicle player);

if((player getVariable ["policeSquad",""]) == "Rapid Response")exitwith{};
if(player distance shawn1 < 3000)exitwith{};
if(player distance gangflag1 < 1000)exitwith{};
if(player distance gangflag2 < 1000)exitwith{};
if(player distance gangflag3 < 1000)exitwith{};

if(typeOf _vehicle in ["C_Kart_01_Blu_F"])exitwith{};//Has no headlights
_rand = random 5;
switch(true)do
	{
	case (_rand > 3):
		{
		_vehicle setHitPointDamage["HitLFWheel",0.8];
		[[(vehicle player),"chicken"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
		hint "You've hit a chicken and damaged your vehicle.. you would have seen this with your lights on!";
		};
	case (_rand > 1):
		{
		_vehicle setHitPointDamage["HitLFWheel",1];
		_vehicle setHitPointDamage["HitRFWheel",0.5];
		[[(vehicle player),"sheep"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
		hint "You've hit a sheep and damaged your vehicle.. you would have seen this with your lights on!";
		};
	default	
		{
		_vehicle setHitPointDamage["HitLFWheel",1];
		_vehicle setHitPointDamage["HitLF2Wheel",1];
		_vehicle setHitPointDamage["HitRFWheel",1];
		_vehicle setHitPointDamage ["hitEngine", 1.0];
		[[(vehicle player),"cow"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
		hint "You've hit a cow and damaged your vehicle.. you would have seen this with your lights on!";
		};
	};
