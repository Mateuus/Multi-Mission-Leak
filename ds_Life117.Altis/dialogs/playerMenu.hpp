
class playerMenu {

	idd = 666666;
	movingEnable = true;
	enableSimulation = true;
	name = "playerMenu";
	
	class controlsBackground {
	
		class fondtablet: DS_RscPicture
		{
			idc = 9090909;
			colorBackground[] = {0, 0, 0, 0.7};
			text = "extras\textures\menus\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
			moving = 1;
		};
		
		class MainBackground:DS_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.025;
			y = 0.12 + (11 / 250);
			w = 0.92;
			h = 0.8 - (22 / 250);
		};
		
		class Title : DS_RscStructuredText {
			colorBackground[] = {0, 0, 0, 0};
			idc = 1424;
			text = "";
			x = 0.2;
			y = 0.18;
			w = 4.9;
			h = 0.8;
		};
		
		class moneyStatusInfo : DS_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.105;
			y = 0.30;
			w = 0.3; h = 0.6;
		};
		
		class timeStatusInfo : DS_RscStructuredText
		{
			idc = 666008;
			sizeEx = 0.020;
			text = "";
			x = 0.105;
			y = 0.65;
			w = 0.3; h = 0.6;
		};
		
		class timeStatusInfoNew : DS_RscStructuredText
		{
			idc = 666009;
			sizeEx = 0.020;
			text = "";
			x = 0.105;
			y = 0.70;
			w = 0.3; h = 0.6;
		};
		
		class PlayersName : Title {
			idc = 2009;
			style = 1;
			text = "";
			
			x = 0.775; y = 0.26;
			w = 0.275; h = 0.04;
		};
	};
	
	class controls {
		
		
		class itemHeader : DS_RscText
		{
			idc = -1;
			text = "  Inventory";
			sizeEx = 0.04;
			
			x = 0.62; y = 0.26;
			w = 0.275; h = 0.04;
		};
		
		class licenseHeader : DS_RscText
		{
			idc = -1;
			text = "  Licenses";
			sizeEx = 0.04;
			
			x = 0.336; y = 0.26;
			w = 0.275; h = 0.04;
		};
		
		class moneySHeader : DS_RscText
		{
			idc = -1;
			text = "   Money ";
			sizeEx = 0.04;
			
			x = 0.11; y = 0.26;
			w = 0.219; h = 0.04;
		};
	
		class itemList : DS_RscListBox 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 9009;
			sizeEx = 0.030;
			
			x = 0.62; y = 0.33;
			w = 0.275; h = 0.27;
		};
		
		class moneyEdit : DS_RscEdit 
		{
			idc = 2018;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.12; y = 0.42;
			w = 0.18; h = 0.03;
		};
		
		class NearPlayers : DS_RscCombo 
		{
			idc = 2022;
		
			x = 0.12; y = 0.46;
			w = 0.18; h = 0.03;
		};
		
		class moneyDrop : DS_RscButtonMenu
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 2001;
			text = "   Give";
			sizeEx = 0.025;
			x = 0.135; y = 0.50;
			w = 0.13; h = 0.036;
		};
		
		class viewText : DS_RscText
		{
			idc = 10011;
			sizeEx = 0.030;
			text = "";
			x = 0.105;
			y = 0.29;
			w = 0.3; h = 0.6;
		};
		
		class viewDistance : DS_RscXSliderH
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 2001;
			text = "";
			sizeEx = 0.025;
			x = 0.10; y = 0.62;
			w = 0.20; h = 0.026;
			onSliderPosChanged = "[_this select 1] call DS_fnc_viewDistance;";
		};
		
		class itemEdit : DS_RscEdit {
		
		idc = 3131;
		
		text = "1";
		sizeEx = 0.030;
		x = 0.62; y = 0.61;
		w = 0.275; h = 0.03;
		
		};
		class iNearPlayers : DS_RscCombo
		{
			idc = 2023;
			
			x = 0.62; y = 0.65;
			w = 0.275; h = 0.03;
		};
		
		class DropButton : DS_RscButtonMenu {
		
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 2002;
			text = "   Give";
			onButtonClick = "[] spawn DS_fnc_giveItem;";
			x = 0.765;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		class UseButton : DS_RscButtonMenu {
		
			colorBackground[] = {0, 0, 0, 0.7};
			text = "   Use";
			onButtonClick = "[] spawn DS_fnc_useItem;";
			x = 0.62;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		class RemoveButton : DS_RscButtonMenu {
		
			colorBackground[] = {0, 0, 0, 0.7};
			text = " Remove";
			onButtonClick = "[] spawn DS_fnc_itemRemove;";
			x = 0.475;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		
		class ButtonClose : DS_PictureButtonMenu {
			colorBackground[] = {0, 0, 0, 0};
			idc = 666005;
			x = 0.395 + (2.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.92 - (1 / 25);
			w = (1.4 / 40);
			h = (1.25 / 25);
			onButtonClick = "closeDialog 0;";
		};
		//Settings
		class ButtonSettings : DS_PictureButtonMenu {
			colorBackground[] = {0, 0, 0, 0};
			idc = 666000;
			x = 0.018 + (2.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.806 - (1 / 25);
			w = (2.55 / 40);
			h = (1.85 / 25);
			//onButtonClick = "[] call life_fnc_settingsMenu;[] spawn life_fnc_showPlayerStats;";
		};
		
		class ButtonMyGang : DS_PictureButtonMenu {
			colorBackground[] = {0, 0, 0, 0};
			idc = 666007;
			x = 0.468 + (2.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.806 - (1 / 25);
			w = (2.55 / 40);
			h = (1.85 / 25);
		};
		
		class Licenses_Menu : DS_RscControlsGroup
		{
			idc = -1;
			w = 0.28;
			h = 0.38;
			x = 0.34;
			y = 0.30;
			
			class Controls
			{
				class DS_Licenses : DS_RscStructuredText
				{
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; h = 0.65;
				};
			};
		};
		
		class ButtonKeys : DS_PictureButtonMenu {
			colorBackground[] = {0, 0, 0, 0};
			idc = 666003;
			//onButtonClick = "closeDialog 0;createDialog ""Life_key_management"";";
			x = 0.659 + (2.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.806 - (1 / 25);
			w = (2.55 / 40);
			h = (1.85 / 25);
		};
		
		class ButtonCell : DS_PictureButtonMenu {
			colorBackground[] = {0, 0, 0, 0};
			idc = 666004;
			//onButtonClick = "closeDialog 0;createDialog ""life_cell_phone"";";
			x = 0.755 + (2.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.806 - (1 / 25);
			w = (2.55 / 40);
			h = (1.85 / 25);
		};
		
		class ButtonAdminMenu : DS_PictureButtonMenu {
			colorBackground[] = {0, 0, 0, 0};
			idc = 666006;
			x = 0.01 + (1.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.94 - (1 / 25);
			w = (6 / 40);
			h = (0.7 / 25);
			onButtonClick = "createDialog ""DS_admin_menu"";";
		};
		//Sync
		class ButtonSyncData : DS_PictureButtonMenu {
		    colorBackground[] = {0, 0, 0, 0};
			idc = 666001;
			x = 0.115 + (2.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.806 - (1 / 25);
			w = (2.55 / 40);
			h = (1.85 / 25);
		};
		//Quest
		class ButtonQuestLog : DS_PictureButtonMenu {
		    colorBackground[] = {0, 0, 0, 0};
			idc = 666013;
			x = 0.212 + (2.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.806 - (1 / 25);
			w = (2.55 / 40);
			h = (1.85 / 25);
		};
		//Quest
		class ButtonBug : DS_PictureButtonMenu {
		    colorBackground[] = {0, 0, 0, 0};
			idc = 666053;
			x = 0.309 + (2.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.806 - (1 / 25);
			w = (2.55 / 40);
			h = (1.85 / 25);
		};
		class ButtonMarket : DS_PictureButtonMenu {
			colorBackground[] = {0, 0, 0, 0};
			idc = 666002;
			x = 0.565 + (2.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.806 - (1 / 25);
			w = (2.55 / 40);
			h = (1.85 / 25);
		};
		/*
		class picSettings : DS_RscStructuredText
		{
			idc = 666100;
			text = "1";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
		};
		*/
	};
};