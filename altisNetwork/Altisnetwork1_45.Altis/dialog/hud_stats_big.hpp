	//#define IDC_LIFE_BAR_SeatBelt 4203

    class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			//-- Something mission?
		};
		
	class controls
	{
		//-- Health Border & Icon
	class Health_ICON: life_RscPicture
	{
		idc = 5100;

		text = "icons\health.paa"; //--- ToDo: Localize;
		x = 0.909696 * safezoneW + safezoneX;
		y = 0.929052 * safezoneH + safezoneY;
		w = 0.0170721 * safezoneW;
		h = 0.0289549 * safezoneH;
	};
	class Health: Life_RscProgress
	{
		idc = 5101;
		colorBar[] = {0.92,0,0,1};

		x = 0.909696 * safezoneW + safezoneX;
		y = 0.819039 * safezoneH + safezoneY;
		w = 0.0171902 * safezoneW;
		h = 0.105048 * safezoneH;
	};
	class Hunger_ICON: life_RscPicture
	{
		idc = 5102;

		text = "icons\food.paa"; //--- ToDo: Localize;
		x = 0.890416 * safezoneW + safezoneX;
		y = 0.929052 * safezoneH + safezoneY;
		w = 0.0170721 * safezoneW;
		h = 0.0289549 * safezoneH;
	};
	class Hunger: Life_RscProgress
	{
		idc = 5103;
		colorBar[] = {0.97,0.75,0,1};

		x = 0.890416 * safezoneW + safezoneX;
		y = 0.819039 * safezoneH + safezoneY;
		w = 0.0171902 * safezoneW;
		h = 0.105048 * safezoneH;
	};
	class Thirst_ICON: life_RscPicture
	{
		idc = 5104;

		text = "icons\water.paa"; //--- ToDo: Localize;
		x = 0.871136 * safezoneW + safezoneX;
		y = 0.929052 * safezoneH + safezoneY;
		w = 0.0170721 * safezoneW;
		h = 0.0289549 * safezoneH;
	};
	class Thirst: Life_RscProgress
	{
		idc = 5105;
		colorBar[] = {0.05,0.28,0.68,1};

		x = 0.871136 * safezoneW + safezoneX;
		y = 0.819039 * safezoneH + safezoneY;
		w = 0.0171902 * safezoneW;
		h = 0.105048 * safezoneH;
	};
	};   
 };