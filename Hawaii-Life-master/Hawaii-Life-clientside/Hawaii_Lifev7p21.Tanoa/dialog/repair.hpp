class life_repair_car {
	idd = 3380;
	name= "life_repair_car";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class MainBackground:Life_RscPicture {
			text = "textures\repair\repair_menu.paa";
			idc = -1;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.7425 * safezoneW;
			h = 0.99 * safezoneH;
		};
		class VehicleShow: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_car.paa";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.598125 * safezoneW;
			h = 0.7975 * safezoneH;
		};
	};

	class controls {
		class Vehicle_Info: Life_RscStructuredText
		{
			idc = 3385;
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.517 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};
		class WL1_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WL2_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.732031 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WR1_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WR2_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.732031 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Hull_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Fuel_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.701094 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Engine_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WL1_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,1] spawn life_fnc_repair_car;";
			tooltip = "$STR_Repair_WheelL1";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class WL2_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.732031 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,2] spawn life_fnc_repair_car;";
			tooltip = "$STR_Repair_WheelL2";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class WR1_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,3] spawn life_fnc_repair_car;";
			tooltip = "$STR_Repair_WheelR1";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class WR2_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.732031 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,4] spawn life_fnc_repair_car;";
			tooltip = "$STR_Repair_WheelR2";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Hull_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[1] spawn life_fnc_repair_car;";
			tooltip = "$STR_Repair_Hull";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Fuel_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.701094 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[3] spawn life_fnc_repair_car;";
			tooltip = "$STR_Repair_Fuel";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Engine_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[2] spawn life_fnc_repair_car;";
			tooltip = "$STR_Repair_Engine";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.159687 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.012375 * safezoneW;
			h = 0.0165 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
	};
};

class life_repair_truck {
	idd = 3382;
	name= "life_repair_truck";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class MainBackground:Life_RscPicture {
			text = "textures\repair\repair_menu.paa";
			idc = -1;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.7425 * safezoneW;
			h = 0.99 * safezoneH;
		};
		class VehicleShow: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_truck.paa";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.608437 * safezoneW;
			h = 0.946 * safezoneH;
		};
	};

	class controls {
		class Vehicle_Info: Life_RscStructuredText
		{
			idc = 3385;
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.517 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};
		class WL1_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WL2_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WL3_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WL4_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.737188 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WR1_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WR2_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WR3_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WR4_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.7475 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Hull_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Engine_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Fuel_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class WL1_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,1] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_WheelL1";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class WL2_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,2] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_WheelL2";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class WL3_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,3] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_WheelL3";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class WL4_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.737188 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,4] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_WheelL4";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class WR1_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,5] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_WheelR1";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class WR2_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,6] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_WheelR2";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class WR3_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,7] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_WheelR3";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class WR4_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.7475 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0,8] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_WheelR4";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Hull_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[1] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_Hull";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Engine_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[2] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_Engine";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Fuel_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[3] spawn life_fnc_repair_truck;";
			tooltip = "$STR_Repair_Fuel";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.159687 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.012375 * safezoneW;
			h = 0.0165 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
	};
};

class life_repair_heli {
	idd = 3383;
	name= "life_repair_heli";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class MainBackground:Life_RscPicture {
			text = "textures\repair\repair_menu.paa";
			idc = -1;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.7425 * safezoneW;
			h = 0.99 * safezoneH;
		};
		class VehicleShow: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_heli.paa";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.572344 * safezoneW;
			h = 1.001 * safezoneH;
		};
	};

	class controls {
		class Vehicle_Info: Life_RscStructuredText
		{
			idc = 3385;
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.517 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};
		class HRotor_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class VRotor_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Avionics_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Engine_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Hull_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class HRotor_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0] spawn life_fnc_repair_heli;";
			tooltip = "$STR_Repair_HRotor";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class VRotor_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[1] spawn life_fnc_repair_heli;";
			tooltip = "$STR_Repair_VRotor";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Avionics_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[2] spawn life_fnc_repair_heli;";
			tooltip = "$STR_Repair_Avionics";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Engine_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[3] spawn life_fnc_repair_heli;";
			tooltip = "$STR_Repair_Engine";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Hull_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[4] spawn life_fnc_repair_heli;";
			tooltip = "$STR_Repair_Hull";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.159687 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.012375 * safezoneW;
			h = 0.0165 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
	};
};

class life_repair_boat {
	idd = 3384;
	name= "life_repair_boat";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class MainBackground:Life_RscPicture {
			text = "textures\repair\repair_menu.paa";
			idc = -1;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.7425 * safezoneW;
			h = 0.99 * safezoneH;
		};
		class VehicleShow: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_boat.paa";
			x = -0.0625;
			y = -0.42;
			w = 1.4375;
			h = 1.82;
		};
	};

	class controls {
		class Vehicle_Info: Life_RscStructuredText
		{
			idc = 3385;
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.517 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};
		class Engine_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Hull_Button: Life_RscPicture
		{
			idc = -1;
			text = "textures\repair\repair_icon.paa";
			x = 0.665 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Engine_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[0] spawn life_fnc_repair_boat;";
			tooltip = "$STR_Repair_Engine";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Hull_Button2: life_RscButtonMenu
		{
			idc = -1;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[1] spawn life_fnc_repair_boat;";
			tooltip = "$STR_Repair_Hull";
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.159687 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.012375 * safezoneW;
			h = 0.0165 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
	};
};