/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_CfgVirtualItems
{

	class ItemBase
	{
		displayName = "";
		icon = "";
		buyPrice = 0;
		sellPrice = 0;
		weight = 1;
		isLegal = 1;

		class Events
		{
			onUseItem = "";
		};
	};

	class Apple: ItemBase
	{
		displayName = "Apple";
		buyPrice = 50;
		sellPrice = 25;
		weight = 1;
	};

};
