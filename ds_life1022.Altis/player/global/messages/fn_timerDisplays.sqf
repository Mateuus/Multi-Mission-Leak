/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays on screen timers for many things
*/

switch (true) do
	{
	case ((_this select 1) == 0):
		{
		systemchat format ["The bank doors will blow open in %1 minutes",(_this select 0)];
		hint format ["The bank doors will blow open in %1 minutes",(_this select 0)];
		};
	case ((_this select 1) == 1):
		{
		systemchat format ["The Fort Knox safe will open in %1 minutes",(_this select 0)];
		hint format ["The Fort Knox safe will open in %1 minutes",(_this select 0)];
		};
	case ((_this select 1) == 2):
		{
		systemchat format ["The jail gates will blow open in %1 minutes",(_this select 0)];
		hint format ["The jail gates will blow open in %1 minutes",(_this select 0)];
		};
	case ((_this select 1) == 3):
		{
		systemchat format ["The Power Station will blow in %1 minutes",(_this select 0)];
		hint format ["The Power Station will blow in %1 minutes",(_this select 0)];
		};
	case ((_this select 1) == 4):
		{
		systemchat format ["The Altis Research Facility safe will crack open in %1 minutes",(_this select 0)];
		hint format ["The Altis Research Facility safe will crack open in %1 minutes",(_this select 0)];
		};
	};