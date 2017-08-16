/*
	Author: Maverick Applications
	Tuning shop for Life
*/

class Maverick_Tuning
{

	// Map configs
	class Altis
	{
		class Camera
		{
			pos[] = {23675.1,17200.1,2.00144};
			target[] = {23671,17199.4,2.40144};
		};
		class Vehicle
		{
			pos[] = {23669.4,17200.8,1.15015};
			dir = 124.622;
		};
		class Building
		{
			type = "Land_i_Shed_Ind_F";
			pos[] = {23664.2,17196.9,1};
			dir = 0;
		};
	};

	class Tanoa
	{
		class Camera
		{
			pos[] = {1248.85,7316.04,1.78436};
			target[] = {1245.08,7315.57,2.24174};
		};
		class Vehicle
		{
			pos[] = {1243,7317.14,0.774192};
			dir = 127.67;
		};
		class Building
		{
			type = "Land_i_Shed_Ind_F";
			pos[] = {1238.47,7312.86,1};
			dir = 0;
		};
	};

	class Vehicles
	{
		class Offroad_01_base_F
		{
			default[] = {{0,0,0,0,0},"",0,0,{-1,-1,-1}};
			fetchDefaultFromVehicleState = 1;

			class RawModifications
			{
				pool[] = {"HideDoors","HideBackpacks","HideBumper","HideConstruction","HideServices"};
				class HideDoors
				{
					parts[] = {"HideDoor1","HideDoor2","HideDoor3"};
					displayText = "Hide/Show Doors";
					price = 4000;
				};
				class HideBackpacks
				{
					parts[] = {"HideBackpacks"};
					displayText = "Hide/Show Backpacks";
					price = 4000;
				};
				class HideBumper
				{
					parts[] = {"HideBumper1","HideBumper2"};
					displayText = "Hide/Show Bumpers";
					price = 4000;
				};
				class HideConstruction
				{
					parts[] = {"HideConstruction"};
					displayText = "Hide/Show Construction";
					price = 4000;
				};
				class HideServices
				{
					parts[] = {"HideServices"};
					displayText = "Hide/Show Service Lights";
					price = 20000;
				};
			};
			class Colors
			{
				pool[] = {"RGB","Red","RedGlow","YellowMetallic","YellowFade","YellowGlow","BlueMetallic","Chrome"};
				class RGB
				{
					displayText = "Custom RGB Vehicle Color";
					price = 25000;
					texture = "";
				};
				class Red
				{

					displayText = "Red (Metallic)";
					price = 2000;
					texture = "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa";
					material = "maverick\tuning\bin\materials\firered.rvmat";
				};
				class BlueMetallic
				{

					displayText = "Blue (Metallic)";
					price = 2000;
					texture = "a3\soft_f\offroad_01\data\offroad_01_ext_base03_co.paa";
					material = "maverick\tuning\bin\materials\shine_blue.rvmat";
				};
				class GreenOcean
				{

					displayText = "Green/Blue Ocean Fade";
					price = 2000;
					texture = "a3\soft_f\offroad_01\data\offroad_01_ext_base03_co.paa";
					material = "maverick\tuning\bin\materials\shine_blueocean.rvmat";
				};
				class RedGlow
				{

					displayText = "Red (Glow)";
					price = 2000;
					texture = "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa";
					material = "maverick\tuning\bin\materials\glow_red.rvmat";
				};
				class YellowMetallic
				{
					displayText = "Yellow (Metallic)";
					price = 2000;
					texture = "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa";
					material = "maverick\tuning\bin\materials\shine_gold.rvmat";
				};
				class YellowFade
				{
					displayText = "Yellow (Fade)";
					price = 2000;
					texture = "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa";
					material = "maverick\tuning\bin\materials\fade.rvmat";
				};
				class YellowGlow
				{
					displayText = "Yellow (Glow)";
					price = 2000;
					texture = "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa";
					material = "maverick\tuning\bin\materials\glow_yellow.rvmat";
				};
				class Chrome
				{
					displayText = "Chrome";
					price = 2000;
					texture = "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa";
					material = "maverick\tuning\bin\materials\chrome.rvmat";
				};
			};
			/*class Wheels
			{
				pool[] = {"BulletProof"};
				class BulletProof
				{
					displayText = "Bullet Proof Tires";
					price = 50000;
				};
			};*/
			class Nitro
			{
				pool[] = {"Nitro1","Nitro2","Nitro3"};
				class Nitro1
				{
					displayText = "Nitro Stage 1";
					timesUseable = 1;
					price = 15000;
				};
				class Nitro2
				{
					displayText = "Nitro Stage 2";
					timesUseable = 2;
					price = 25000;
				};
				class Nitro3
				{
					displayText = "Nitro Stage 3";
					timesUseable = 3;
					price = 40000;
				};
			};
			class Underglow
			{
				pool[] = {"UnderglowRGB"};
				class UnderglowRGB
				{
					displayText = "Custom RGB Vehicle Underglow";
					price = 100000;
				};
			};
		};
		class Quadbike_01_base_F
		{
			default[] = {{},"",0,0,{-1,-1,-1}};
			fetchDefaultFromVehicleState = 1;

			class Colors
			{
				pool[] = {"RGB"};
				class RGB
				{
					displayText = "Custom RGB Vehicle Color";
					price = 25000;
					texture = "";
				};
			};
			class Nitro
			{
				pool[] = {"Nitro1","Nitro2","Nitro3"};
				class Nitro1
				{
					displayText = "Nitro Stage 1";
					timesUseable = 1;
					price = 15000;
				};
				class Nitro2
				{
					displayText = "Nitro Stage 2";
					timesUseable = 2;
					price = 25000;
				};
				class Nitro3
				{
					displayText = "Nitro Stage 3";
					timesUseable = 3;
					price = 40000;
				};
			};
			class Underglow
			{
				pool[] = {"UnderglowRGB"};
				class UnderglowRGB
				{
					displayText = "Custom RGB Vehicle Underglow";
					price = 100000;
				};
			};
		};
		class SUV_01_base_F
		{
			default[] = {{},"",0,0,{-1,-1,-1}};
			fetchDefaultFromVehicleState = 1;

			class Colors
			{
				pool[] = {"RGB"};
				class RGB
				{
					displayText = "Custom RGB Vehicle Color";
					price = 25000;
					texture = "";
				};
			};
			class Nitro
			{
				pool[] = {"Nitro1","Nitro2","Nitro3"};
				class Nitro1
				{
					displayText = "Nitro Stage 1";
					timesUseable = 1;
					price = 15000;
				};
				class Nitro2
				{
					displayText = "Nitro Stage 2";
					timesUseable = 2;
					price = 25000;
				};
				class Nitro3
				{
					displayText = "Nitro Stage 3";
					timesUseable = 3;
					price = 40000;
				};
			};
			class Underglow
			{
				pool[] = {"UnderglowRGB"};
				class UnderglowRGB
				{
					displayText = "Custom RGB Vehicle Underglow";
					price = 100000;
				};
			};
		};
		class Hatchback_01_base_F
		{
			default[] = {{},"",0,0,{-1,-1,-1}};
			fetchDefaultFromVehicleState = 1;

			class Colors
			{
				pool[] = {"RGB"};
				class RGB
				{
					displayText = "Custom RGB Vehicle Color";
					price = 25000;
					texture = "";
				};
			};
			class Nitro
			{
				pool[] = {"Nitro1","Nitro2","Nitro3"};
				class Nitro1
				{
					displayText = "Nitro Stage 1";
					timesUseable = 1;
					price = 15000;
				};
				class Nitro2
				{
					displayText = "Nitro Stage 2";
					timesUseable = 2;
					price = 25000;
				};
				class Nitro3
				{
					displayText = "Nitro Stage 3";
					timesUseable = 3;
					price = 40000;
				};
			};
			class Underglow
			{
				pool[] = {"UnderglowRGB"};
				class UnderglowRGB
				{
					displayText = "Custom RGB Vehicle Underglow";
					price = 100000;
				};
			};
		};
		class Hatchback_01_sport_base_F
		{
			default[] = {{},"",0,0,{-1,-1,-1}};
			fetchDefaultFromVehicleState = 1;

			class Colors
			{
				pool[] = {"RGB"};
				class RGB
				{
					displayText = "Custom RGB Vehicle Color";
					price = 25000;
					texture = "";
				};
			};
			class Underglow
			{
				pool[] = {"UnderglowRGB"};
				class UnderglowRGB
				{
					displayText = "Custom RGB Vehicle Underglow";
					price = 100000;
				};
			};
		};
		class Offroad_02_unarmed_base_F
		{
			default[] = {{},"",0,0,{-1,-1,-1}};
			fetchDefaultFromVehicleState = 1;

			class Colors
			{
				pool[] = {"RGB","Red"};
				class RGB
				{
					displayText = "Custom RGB Vehicle Color";
					price = 25000;
					texture = "";
				};
				class Red
				{
					displayText = "Red";
					price = 2000;
					texture = "a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa";
				};
			};
			class Nitro
			{
				pool[] = {"Nitro1","Nitro2","Nitro3"};
				class Nitro1
				{
					displayText = "Nitro Stage 1";
					timesUseable = 1;
					price = 15000;
				};
				class Nitro2
				{
					displayText = "Nitro Stage 2";
					timesUseable = 2;
					price = 25000;
				};
				class Nitro3
				{
					displayText = "Nitro Stage 3";
					timesUseable = 3;
					price = 40000;
				};
			};
			class Underglow
			{
				pool[] = {"UnderglowRGB"};
				class UnderglowRGB
				{
					displayText = "Custom RGB Vehicle Underglow";
					price = 100000;
				};
			};
		};
		class Truck_F
		{
			default[] = {{},"",0,0,{-1,-1,-1}};
			fetchDefaultFromVehicleState = 1;
			class Nitro
			{
				pool[] = {"Nitro1","Nitro2","Nitro3"};
				class Nitro1
				{
					displayText = "Nitro Stage 1";
					timesUseable = 1;
					price = 75000;
				};
				class Nitro2
				{
					displayText = "Nitro Stage 2";
					timesUseable = 2;
					price = 150000;
				};
				class Nitro3
				{
					displayText = "Nitro Stage 3";
					timesUseable = 3;
					price = 200000;
				};
			};
			class Underglow
			{
				pool[] = {"UnderglowRGB"};
				class UnderglowRGB
				{
					displayText = "Custom RGB Vehicle Underglow";
					price = 100000;
				};
			};
		};
	};
};






























/* DIALOG */
class mav_tuning_dialog_main {
    idd = 5100;
    movingEnable = 0;
    enableSimulation = 1;
    duration = 999999;
    class controls {
		class Life_RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class Life_RscText_1001: Life_RscText
		{
			idc = -1;
			text = "VEHICLE TUNING SHOP"; //--- ToDo: Localize;
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.2514 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			shadow = 2;
		};
		class Life_RscText_1002: Life_RscText
		{
			idc = -1;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.473 * safezoneH;
			colorBackground[] = {0.12,0.14,0.16,0.8};
		};
		class Life_RscListbox_1500: Life_RscListbox
		{
			idc = 0;
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.451 * safezoneH;
			sizeEx = 0.045;
		};
		class Life_RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 1;
			text = "LEAVE TUNING SHOP"; //--- ToDo: Localize;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.7552 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class mav_tuning_dialog_rgbcolor {
    idd = 5200;
    movingEnable = 0;
    enableSimulation = 1;
    duration = 999999;
    class controls {
		class Life_RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.286 * safezoneH;
			colorText[] = {};
			colorBackground[] = {0.12,0.14,0.16,0.8};
		};
		class Life_RscSlider_1900: Life_RscSlider
		{
			idc = 0;
			x = 0.082344 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
			color[] = { 1, 1, 1, 1 };
    		coloractive[] = { 1, 0, 0, 0.5 };
    		style = 1024;
    		type = 3;
		};
		class Life_RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Red"; //--- ToDo: Localize;
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Life_RscText_1002: Life_RscText
		{
			idc = -1;
			text = "Green"; //--- ToDo: Localize;
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Life_RscSlider_1901: Life_RscSlider
		{
			idc = 1;
			x = 0.082344 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
			color[] = { 1, 1, 1, 1 };
    		coloractive[] = { 1, 0, 0, 0.5 };
    		style = 1024;
    		type = 3;
		};
		class Life_RscSlider_1902: Life_RscSlider
		{
			idc = 2;
			x = 0.082344 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
			color[] = { 1, 1, 1, 1 };
    		coloractive[] = { 1, 0, 0, 0.5 };
    		style = 1024;
    		type = 3;
		};
		class Life_RscText_1003: Life_RscText
		{
			idc = -1;
			text = "Blue"; //--- ToDo: Localize;
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Life_RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 3;
			text = "APPLY COLOR"; //--- ToDo: Localize;
			x = 0.151437 * safezoneW + safezoneX;
			y = 0.6562 * safezoneH + safezoneY;
			w = 0.152625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Life_RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 4;
			text = "ABORT"; //--- ToDo: Localize;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.6562 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};