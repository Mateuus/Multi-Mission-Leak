class TrunkMenu
{
	idd = 3500;
	name = "TrunkMenu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground
	{
		class RscBackground : Life_RscText
		{
			idc = -1;
			x = 0.05;
			y = 0.2;
			w = 0.9;
			h = 0.78;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class RscTitleText : Life_RscTitle
		{
			idc = 3501;
			text = "";
			sizeEx = 0.03;
			x = 0.05;
			y = 0.14;
			w = 0.7125;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class VehicleWeight : RscTitleText
		{
			idc = 3504;
			style = 1;
			text = "";
			sizeEx = 0.03;
			x = 0.775;
			y = 0.14;
			w = 0.175;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class RscTrunkText : Life_RscText
		{
			idc = -1;
			text = "$STR_Trunk_TInventory";
			sizeEx = 0.035;
			x = 0.0625;
			y = 0.22;
			w = 0.425;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class RscPlayerText : Life_RscText
		{
			idc = -1;
			text = "$STR_Trunk_PInventory";
			sizeEx = 0.035;
			x = 0.5125;
			y = 0.22;
			w = 0.425;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};	
	};
	
	class Controls
	{
		class TrunkGear : Life_RscListBox
		{
			idc = 3502;
			text = "";
			sizeEx = 0.032;
			x = 0.0625;
			y = 0.28;
			w = 0.425;
			h = 0.54;
		};
		
		class PlayerGear : Life_RscListBox
		{
			idc = 3503;
			text = "";
			sizeEx = 0.032;
			x = 0.5125;
			y = 0.28;
			w = 0.425;
			h = 0.54;
		};
		
		class TrunkEdit : Life_RscEdit
		{
			idc = 3505;
			text = "1";
			sizeEx = 0.0250;
			x = 0.0625;
			y = 0.84;
			w = 0.2625;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class PlayerEdit : Life_RscEdit
		{
			idc = 3506;
			text = "1";
			sizeEx = 0.0250;
			x = 0.5125;
			y = 0.84;
			w = 0.2625;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class TakeItem : Life_RscButtonMenu
		{
			idc = 3510;
			text = "Auslagern";
			onButtonClick = "[0] call life_fnc_vehTakeItem;";
			x = 0.3375;
			y = 0.84;
			w = 0.15;
			h = 0.04;
		};
		
		class StoreItem : Life_RscButtonMenu
		{
			idc = 3509;
			text = "Einlagern";
			onButtonClick = "[0] call life_fnc_vehStoreItem;";
			x = 0.7875;
			y = 0.84;
			w = 0.15;
			h = 0.04;
		};

		class takeallbutton: Life_RscButtonMenu
		{
			idc = 3507;
			text = "Alles auslagern";
			onButtonClick = "[1] call life_fnc_vehTakeItem;";
			tooltip = "Noch nicht verfügbar!";
			x = 0.225;
			y = 0.9;
			w = 0.2625;
			h = 0.04;
		};
		
		class storeallbutton: Life_RscButtonMenu
		{
			idc = 3508;
			text = "Alles einlagern";
			onButtonClick = "[1] call life_fnc_vehStoreItem;";
			tooltip = "Noch nicht verfügbar!";
			x = 0.675;
			y = 0.9;
			w = 0.2625;
			h = 0.04;
		};
	};
};