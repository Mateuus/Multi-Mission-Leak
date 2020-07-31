//current phone call
class Life_CurrentPhoneCall_Menu {
	idd = 5337;
	name= "life_call";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "uiNamespace setVariable [""tabletmenu"", _this select 0]; tabletmenuisopen = 1; [] call fnc_fadephone;";
	onunload = "tabletmenuisopen = 0;";
	class controls {

		class tabletbackground: RscPicture
		{
			idc = 85441;
			text = "\CG_Client\textures\samsungbg2.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};
		class tabletframe: RscPicture
		{
			idc = 85442;
			text = "\CG_Client\textures\samsungframe.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};


		class PlayerListCall : Life_RscListBox 
		{
			idc = 5338;
			text = "";
			sizeEx = 0.035;
			x = 0.412 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.2; 
			h = 0.4;
		};	
		class CallButton : Life_RscButtonMenu {

			idc = -1;
			text = "Add";
			colorBackground[] = {0,0.535294117647059,0.2725490196078431,1};
			onButtonClick = "closedialog 0; [] spawn fnc_CallMenu;";
			x = 0.412 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};