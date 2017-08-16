class ClientSettings 
{
	idd = 2900;
	name= "ClientSettings";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class MainBackground:Life_RscPictureKeepAspect {
			idc = -1;
			text = "images\phone.paa";			
			colorBackground[] = {0, 0, 0, 0};
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		
		class VDonFoot : life_RscText
		{
			idc = -1;
			text = "Foot:";
			
			x = 0.34;
			y = 0.22;
			w = 0.07; h = 0.04;
		};
		
		class VDinCar : life_RscText
		{
			idc = -1;
			text = "Car:";
			
			x = 0.34;
			y = 0.27;
			w = 0.07; h = 0.04;
		};
		
		class VDinAir : life_RscText
		{
			idc = -1;
			text = "Air:";
			
			x = 0.34;
			y = 0.32;
			w = 0.07; h = 0.04;
		};

	};
	
	class controls 
	{
		class TextTime : Life_RscStructuredText
		{
			idc = 90035;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0; y = 0.165;
			w = 1; h = 0.05;
		};
		
		class TextStatusLeft : Life_RscStructuredText
		{
			idc = 90036;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.5 - (0.08 * 2) - 0.005; y = 0.165;
			w = 0.3; h = 0.05;
		};
		
		class TextStatusRight : Life_RscStructuredText
		{
			idc = 90037;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.34; y = 0.165;
			w = 1 - (0.34 * 2) - 0.02; h = 0.05;
			class Attributes {
				align = "right";
			};
		};
		
		class VD_onfoot_slider : life_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "View distance while on foot";
			x = 0.34 + 0.07;
			y = 0.22;
			w = 1 - (0.34 * 2) - (0.07 * 2);
			h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_onfoot_value : life_RscText
		{
			idc = 2902;
			text = "";
			
			x = 1 - 0.34 - 0.07;
			y = 0.22;
			w = 0.07;
			h = 0.04;
			class Attributes {
				align = "right";
			};
		};
		
		class VD_car_slider : life_RscXSliderH 
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "View distance while in a land vehicle";
			x = 0.34 + 0.07;
			y = 0.27;
			w = 1 - (0.34 * 2) - (0.07 * 2);
			h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_car_value : life_RscText
		{
			idc = 2912;
			text = "";
			
			x = 1 - 0.34 - 0.07;
			y = 0.27;
			w = 0.07;
			h = 0.04;
			class Attributes {
				align = "right";
			};
		};
		
		class VD_air_slider : life_RscXSliderH 
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "View distance while in a air vehicle";
			x = 0.34 + 0.07;
			y = 0.32;
			
			w = 1 - (0.34 * 2) - (0.07 * 2);
			h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_air_value : life_RscText
		{
			idc = 2922;
			text = "";
			
			x = 1 - 0.34 - 0.07;
			y = 0.32;
			w = 0.07;
			h = 0.04;
			class Attributes {
				align = "right";
			};
		};
		
		class VDTerrSet : life_RscText
		{
			idc = -1;
			text = "Player Tags";
			shadow = 0;
			colorBackground[] = {0.4, 0, 0, 0.7};

			x = 0.34;
			y = 0.42;
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			h = (1 / 25);
		};
		
		class VD_terr_low : Life_RscActiveText
		{
			idc = -1;
			text = "Tags ON";
			action = "[] call life_fnc_playerTags";
			sizeEx = 0.04;
			
			x = 0.38; y = 0.47;
			w = 0.275; h = 0.04;
		};
		
		class VD_terr_normal : Life_RscActiveText
		{
			idc = -1;
			text = "Tags OFF";
			action = "onEachFrame {nil}";
			sizeEx = 0.04;
			
			x = 0.5; y = 0.47;
			w = 0.275; h = 0.04;
		};
		
		class SideChannelSettings : life_RscText
		{
			idc = -1;
			text = "Phone Settings";
			shadow = 0;
			colorBackground[] = {0.4, 0, 0, 0.7};

			x = 0.34;
			y = 0.57;
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			h = (1 / 25);
		};
		
		class SideChatONOFF : Life_RscActiveText
		{
			idc = 2926;
			text = "Ringer OFF";
			color[] = {1, 0, 0, 1};
			action = "[] call life_fnc_toggleRinger";
			sizeEx = 0.04;
			
			x = 0.34; y = 0.62;
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			h = 0.04;
			
			class Attributes {
				align = "center";
			};
		};
		
		class adminONOFF : Life_RscActiveText
		{
			idc = 1337;
			text = "Admin Requests ON";
			color[] = {1, 0, 0, 1};
			action = "if(life_adminReq) then {life_adminReq = false} else {life_adminReq = true}; [] call life_fnc_settingsMenu; ";
			sizeEx = 0.04;
			
			x = 0.34; y = 0.67;
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			h = 0.04;
			
			class Attributes {
				align = "center";
			};
		};
		
		/*class dropitems : Life_RscActiveText
		{
			idc = 1338;
			text = "Drop Items ON";
			color[] = {0, 1, 0, 1};
			action = "if(life_createVehicle) then {life_createVehicle = false} else {life_createVehicle = true}; [] call life_fnc_settingsMenu; ";
			sizeEx = 0.04;
			
			x = 0.34; y = 0.72;
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			h = 0.04;
			
			class Attributes {
				align = "center";
			};
		};*/

		class ButtonClose : Life_RscButtonInvisible {
			idc = -1;
			shortcuts[] = {0x00050000 + 2};
			text = "";
			onButtonClick = "closeDialog 0;";
			tooltip = "Go back to home screen";
			x = 0.5 - ((6.25 / 40) / 2);
			y = 1 - 0.15;
			w = (6.25 / 40);
			h = (6.25 / 40);
		};
	};
};