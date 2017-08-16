////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Rath Bone, v1.063, #Kafota)
////////////////////////////////////////////////////////
class pInteraction_Menu
{
	idd = 37400;
	movingEnabled = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Interaction Menu"; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
	};
	class controls {
		class buttonone: Life_RscButtonMenu
		{
			idc = 37450;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttontwo: Life_RscButtonMenu
		{
			idc = 37451;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonthree: Life_RscButtonMenu
		{
			idc = 37452;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Buttonfour: Life_RscButtonMenu
		{
			idc = 37453;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonfive: Life_RscButtonMenu
		{
			idc = 37454;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonsix: Life_RscButtonMenu
		{
			idc = 37455;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonseven: Life_RscButtonMenu
		{
			idc = 37456;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttoneight: Life_RscButtonMenu
		{
			idc = 37457;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonnine: Life_RscButtonMenu
		{
			idc = 37458;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonten: Life_RscButtonMenu
		{
			idc = 37459;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttoneleven: Life_RscButtonMenu
		{
			idc = 37460;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttontwelve: Life_RscButtonMenu
		{
			idc = 37461;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonthirteen: Life_RscButtonMenu
		{
			idc = 37462;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonfourteen: Life_RscButtonMenu
		{
			idc = 37463;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonfifteen: Life_RscButtonMenu
		{
			idc = 37464;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonsixteen: Life_RscButtonMenu
		{
			idc = 37465;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonseventeen: Life_RscButtonMenu
		{
			idc = 37466;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class closebutton: Life_RscButtonMenu
		{
			idc = 37467;
			text = "X"; //--- ToDo: Localize;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
	};
};
class vInteraction_Menu
{
	idd = 37400;
	movingEnabled = 0;
	enableSimulation = 1;
	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Vehicle Interaction"; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
	};
	class controls {
		class buttonone: Life_RscButtonMenu
		{
			idc = 37450;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttontwo: Life_RscButtonMenu
		{
			idc = 37451;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonthree: Life_RscButtonMenu
		{
			idc = 37452;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Buttonfour: Life_RscButtonMenu
		{
			idc = 37453;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonfive: Life_RscButtonMenu
		{
			idc = 37454;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonsix: Life_RscButtonMenu
		{
			idc = 37455;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonseven: Life_RscButtonMenu
		{
			idc = 37456;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttoneight: Life_RscButtonMenu
		{
			idc = 37457;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonnine: Life_RscButtonMenu
		{
			idc = 37458;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonten: Life_RscButtonMenu
		{
			idc = 37459;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttoneleven: Life_RscButtonMenu
		{
			idc = 37460;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttontwelve: Life_RscButtonMenu
		{
			idc = 37461;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonthirteen: Life_RscButtonMenu
		{
			idc = 37462;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonfourteen: Life_RscButtonMenu
		{
			idc = 37463;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonfifteen: Life_RscButtonMenu
		{
			idc = 37464;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonsixteen: Life_RscButtonMenu
		{
			idc = 37465;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buttonseventeen: Life_RscButtonMenu
		{
			idc = 37466;
			text = ""; //--- ToDo: Localize;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class closebutton: Life_RscButtonMenu
		{
			idc = 37467;
			text = "X"; //--- ToDo: Localize;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
	};
};
