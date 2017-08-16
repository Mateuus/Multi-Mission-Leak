class houseInventoryplayer
{
	idd = 3500;
	name = "houseInventoryplayer";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_houseMenu_3.paa";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class Controls
	{
		class HouseInventory : EMonkeys_RscListBox
		{
			idc = 4502;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.301563 * safezoneW + safezoneX;
			y = 0.346296 * safezoneH + safezoneY;
			w = 0.182917 * safezoneW;
			h = 0.353148 * safezoneH;
		};
		
		class PlayerGear : EMonkeys_RscListBox
		{
			idc = 4503;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.516667 * safezoneW + safezoneX;
			y = 0.346296 * safezoneH + safezoneY;
			w = 0.183438 * safezoneW;
			h = 0.351296 * safezoneH;
		};
	/*	
		class HouseInventoryEdit : EMonkeys_RscEdit
		{
			idc = 4505;
			text = "1";
			sizeEx = 0.030;
			x = 0.11; y = 0.72;
			w = 0.3; h = 0.03;
		};
		
		class PlayerGearEdit : EMonkeys_RscEdit
		{
			idc = 4506;
			text = "1";
			sizeEx = 0.030;
			x = 0.49; y = 0.72;
			w = 0.3; h = 0.03;
		};
	*/
		class TakeItem : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "_nul = [] execvm ""core\eMonkeys\houseinventory\buttons\get.sqf""";
			x = 0.301042 * safezoneW + safezoneX;
			y = 0.732408 * safezoneH + safezoneY;
			w = 0.0698438 * safezoneW;
			h = 0.0192223 * safezoneH;
		};
		
		class StoreItem : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "_nul = [] execvm ""core\eMonkeys\houseinventory\buttons\store.sqf""";
			x = 0.515104 * safezoneW + safezoneX;
			y = 0.732408 * safezoneH + safezoneY;
			w = 0.0698958 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class ButtonClose : EMonkeys_RscButtonMenu {
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "closeDialog 0;";
			x = 0.703125 * safezoneW + safezoneX;
			y = 0.234259 * safezoneH + safezoneY;
			w = 0.01625 * safezoneW;
			h = 0.0216667 * safezoneH;
		};
		
		class SelectWeapons : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			//onButtonClick = "[] call EMonkeys_fnc_houseInventory_take;";
			action = "_nul = [0,playergear,dbgear] execvm ""core\eMonkeys\houseinventory\buttons\houseinventory_select.sqf""";
			x = 0.392708 * safezoneW + safezoneX;
			y = 0.292593 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class SelectMagazines : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			action = "_nul = [1,playergear,dbgear] execvm ""core\eMonkeys\houseinventory\buttons\houseinventory_select.sqf""";
			x = 0.466666 * safezoneW + safezoneX;
			y = 0.292593 * safezoneH + safezoneY;
			w = 0.0688542 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class SelectItems : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			action = "_nul = [2,playergear,dbgear] execvm ""core\eMonkeys\houseinventory\buttons\houseinventory_select.sqf""";
			x = 0.540104 * safezoneW + safezoneX;
			y = 0.292592 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class SelectHeadgear : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			action = "_nul = [6,playergear,dbgear] execvm ""core\eMonkeys\houseinventory\buttons\houseinventory_select.sqf""";
			x = 0.580729 * safezoneW + safezoneX;
			y = 0.264815 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class Selectuniform : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			action = "_nul = [3,playergear,dbgear] execvm ""core\eMonkeys\houseinventory\buttons\houseinventory_select.sqf""";
			x = 0.356771 * safezoneW + safezoneX;
			y = 0.264815 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class Selectvest : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			action = "_nul = [4,playergear,dbgear] execvm ""core\eMonkeys\houseinventory\buttons\houseinventory_select.sqf""";
			x = 0.43125 * safezoneW + safezoneX;
			y = 0.264815 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		
		class Selectbackpack : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			action = "_nul = [5,playergear,dbgear] execvm ""core\eMonkeys\houseinventory\buttons\houseinventory_select.sqf""";
			x = 0.505729 * safezoneW + safezoneX;
			y = 0.264815 * safezoneH + safezoneY;
			w = 0.069375 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
	};
};