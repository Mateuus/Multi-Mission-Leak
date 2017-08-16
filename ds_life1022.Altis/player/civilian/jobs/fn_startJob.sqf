/*
	Darkside Life
	
	Author: Shawn "Huntah" Macgillivray

	Description:
	Starts a civilian job
*/

switch(DS_className)do
	{
	case "fuel":
		{
		[]spawn DS_civ_fuelDelivery;
		};
	case "truck":
		{
		[]spawn DS_civ_truckDriver;
		};
	case "pilot":
		{
		[]spawn DS_civ_chopperPilot;
		};
	};