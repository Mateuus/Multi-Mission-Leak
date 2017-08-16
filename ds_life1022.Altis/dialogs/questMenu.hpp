#include "defines.sqf"

class questLog {
	idd = 866667;
	movingEnable = true;
	enableSimulation = true;
	name = "questLog";

	class controlsBackground
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 38.5 * GUI_GRID_W;
			h = 17.5 * GUI_GRID_H;
		};
	};

	class controls
	{
		class QuestList: DS_RscListBox
		{
			idc = 1500;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14.5 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
			onLBSelChanged = "_this call DS_fnc_questLBChange";
		};
		class QuestText: DS_RscStructuredText
		{
			idc = 1100;
			text = "Quest Text"; //--- ToDo: Localize;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 22 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class header: DS_RscPicture
		{
			idc = 1200;
			text = "extras\textures\menus\questBanner.jpg";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 38.5 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
		};
		class RscButton_1600: RscButtonMenu
		{
			idc = 1600;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "Civilian";
			onButtonClick = "[0] spawn DS_fnc_openQuestLog;";
		};
		class RscButton_1601: RscButtonMenu
		{
			idc = 1601;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "Gang";
			onButtonClick = "[1] spawn DS_fnc_openQuestLog;";
		};
		class RscButton_1602: RscButtonMenu
		{
			idc = 1602;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "Rebel";
			onButtonClick = "[2] spawn DS_fnc_openQuestLog;";
		};
		class RscButton_1603: RscButtonMenu
		{
			idc = 1603;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "Special";
			onButtonClick = "[3] spawn DS_fnc_openQuestLog;";
		};
		class close: RscButtonMenu
		{
			idc = 1604;
			text = "Close";
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			onButtonClick = "closeDialog 0;";
		};/*
		class complete: RscButtonMenu
		{
			idc = 1605;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};*/
	};
};