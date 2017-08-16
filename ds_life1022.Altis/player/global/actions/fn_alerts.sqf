/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Treats any sicknesses that your player may have
*/

if(DS_inZone)exitwith{};
DS_inZone = true;

switch(_this select 0)do
	{
	case 0:
		{
		if((player getVariable["restrained",FALSE])||(player getVariable["escorted",FALSE])) exitwith
			{
			sleep 30;
			DS_inZone = false;
			};
			if(!DS_inZone)exitwith{};
		titleText ["You are in a no fly/drive zone, you have 10 seconds to leave before your vehicle will be destroyed", "PLAIN"];
		hint "You are in a no fly/drive zone, you have 10 seconds to leave before your vehicle will be destroyed";
		systemchat "You are in a no fly/drive zone, you have 10 seconds to leave before your vehicle will be destroyed";
		sleep 5;
		if(player distance jailArea > 50)exitwith{DS_inZone = false};
		hint "5 Seconds until missile launch";
		sleep 1;
		if(player distance jailArea > 50)exitwith{DS_inZone = false};
		hint "4 Seconds until missile launch";
		sleep 1;
		if(player distance jailArea > 50)exitwith{DS_inZone = false};
		hint "3 Seconds until missile launch";
		sleep 1;
		if(player distance jailArea > 50)exitwith{DS_inZone = false};
		hint "2 Seconds until missile launch";
		sleep 1;
		if(player distance jailArea > 50)exitwith{DS_inZone = false};
		hint "1 Seconds until missile launch";
		sleep 1;
		if(!DS_inZone)exitwith{};
		(vehicle player) setDamage 0.99;
		};
	};