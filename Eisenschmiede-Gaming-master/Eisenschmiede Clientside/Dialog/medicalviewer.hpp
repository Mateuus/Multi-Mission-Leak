class ES_medic_viewer
{
	idd = 1000;
	name="ES_medic_viewer";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controls {
		class RscText_1000: ES_RscText
		{
			idc = 1000;
			x = 0.237536 * safezoneW + safezoneX;
			y = 0.17798 * safezoneH + safezoneY;
			w = 0.524928 * safezoneW;
			h = 0.588037 * safezoneH;
			colorText[] = {-1,-1,-1,0.8};
			colorBackground[] = {-1,-1,-1,0.8};
			colorActive[] = {-1,-1,-1,0.8};
		};
		class RscText_1001: ES_RscText
		{
			idc = 1001;
			text = "Beobachten Körper von: %1";
			x = 0.23746 * safezoneW + safezoneX;
			y = 0.149978 * safezoneH + safezoneY;
			w = 0.52508 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {1,0.6,0,1};
			colorActive[] = {1,0.6,0,1};
		};
		class RscText_1002: ES_RscText
		{
			idc = 1002;
			text = "Geschichte:";
			x = 0.250587 * safezoneW + safezoneX;
			y = 0.598006 * safezoneH + safezoneY;
			w = 0.498826 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {1,0.6,0,1};
			colorActive[] = {1,0.6,0,1};
		};
		class RscListbox_1510: ES_RscListbox
		{
			idc = 1520;
			x = 0.250587 * safezoneW + safezoneX;
			y = 0.626008 * safezoneH + safezoneY;
			w = 0.498826 * safezoneW;
			h = 0.128011 * safezoneH;
			sizeEx = 0.030;
		};
		class RscPicture_1200: ES_RscPicture
		{
			idc = 1200;
			text = "Images\Icons\medical\body_background.paa";
			x = 0.376606 * safezoneW + safezoneX;
			y = 0.163979 * safezoneH + safezoneY;
			w = 0.249413 * safezoneW;
			h = 0.448028 * safezoneH;
		};
		class RscPicture_1202: ES_RscPicture
		{
			idc = 1202;
			text = "Images\Icons\medical\body_head.paa";
			x = 0.376606 * safezoneW + safezoneX;
			y = 0.166779 * safezoneH + safezoneY;
			w = 0.249413 * safezoneW;
			h = 0.448028 * safezoneH;
		};
		class RscPicture_1203: ES_RscPicture
		{
			idc = 1203;
			text = "Images\Icons\medical\body_torso.paa";
			x = 0.376606 * safezoneW + safezoneX;
			y = 0.166783 * safezoneH + safezoneY;
			w = 0.249413 * safezoneW;
			h = 0.448028 * safezoneH;
		};
		class RscPicture_1204: ES_RscPicture
		{
			idc = 1204;
			text = "Images\Icons\medical\body_legs.paa";
			x = 0.347727 * safezoneW + safezoneX;
			y = 0.0827736 * safezoneH + safezoneY;
			w = 0.308485 * safezoneW;
			h = 0.560035 * safezoneH;
		};
		class RscPicture_1201: ES_RscPicture
		{
			idc = 1201;
			text = "Images\Icons\medical\body_arms.paa";
			x = 0.341111 * safezoneW + safezoneX;
			y = 0.0715727 * safezoneH + safezoneY;
			w = 0.321612 * safezoneW;
			h = 0.574036 * safezoneH;
		};
		class RscPicture_1205: ES_RscPicture
		{
			idc = 1205;
			text = "Images\Icons\health.paa";
			x = 36.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class RscButtonMenu_2400: ES_RscButtonMenu
		{
			idc = 2400;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 33 * GUI_GRID_W + GUI_GRID_X;
			y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1003: ES_RscText
		{
			idc = 1003;
			text = "Bewusstlos seid: %1";
			x = 0.250587 * safezoneW + safezoneX;
			y = 0.289987 * safezoneH + safezoneY;
			w = 0.196905 * safezoneW;
			h = 0.0280018 * safezoneH;
		};
		class RscText_1004: ES_RscText
		{
			idc = 1004;
			text = "Information";
			x = 0.250587 * safezoneW + safezoneX;
			y = 0.205981 * safezoneH + safezoneY;
			w = 0.196905 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {1,0.6,0,1};
			colorActive[] = {1,0.6,0,1};
		};
		class RscText_1005: ES_RscText
		{
			idc = 1005;
			text = "Name: %1";
			x = 0.250587 * safezoneW + safezoneX;
			y = 0.233983 * safezoneH + safezoneY;
			w = 0.196905 * safezoneW;
			h = 0.0280018 * safezoneH;
		};
	};
};
