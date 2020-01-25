class a3l_jail_menu {
	idd = 5546;
	name= "a3l_jail_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	objects[] = { };
	class controls {
		class background: RscPicture
		{
			idc = 1200;
			text = "\cg_client\textures\jailmenu.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};
		class nameofplayer: Life_RscText
		{
			idc = 2200;
			x = 0.395885 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.199531 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class jailtime: RscEdit
		{
			idc = 2201;
			text = "0";
			x = 0.394792 * safezoneW + safezoneX;
			y = 0.424075 * safezoneH + safezoneY;
			w = 0.0786977 * safezoneW;
			h = 0.0311481 * safezoneH;
		};
		class crimescommited: RscEdit
		{
			idc = 2202;
			x = 0.480729 * safezoneW + safezoneX;
			y = 0.423148 * safezoneH + safezoneY;
			w = 0.114635 * safezoneW;
			h = 0.0339259 * safezoneH;
		};

		class sendtojail: RscButtonSilent
		{
			idc = 2204;
			action = "[] call life_fnc_arrestButton;";
			x = 0.525 * safezoneW + safezoneX;
			y = 0.472778 * safezoneH + safezoneY;
			w = 0.0703642 * safezoneW;
			h = 0.0339261 * safezoneH;
		};
	};
};

