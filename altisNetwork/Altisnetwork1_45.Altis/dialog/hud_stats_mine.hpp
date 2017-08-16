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
		x = 57 * GUI_GRID_W + GUI_GRID_X;
		y = 30.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 1.34856 * GUI_GRID_W;
		h = 1.04532 * GUI_GRID_H;
	};
	class Health: Life_RscProgress
	{
		idc = 5101;
		colorBar[] = {0.92,0,0,1};

		x = 58.96 * GUI_GRID_W + GUI_GRID_X;
		y = 30.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 12.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class Hunger_ICON: life_RscPicture
	{
		idc = 5102;

		text = "icons\food.paa"; //--- ToDo: Localize;
		x = 57 * GUI_GRID_W + GUI_GRID_X;
		y = 32 * GUI_GRID_H + GUI_GRID_Y;
		w = 1.34856 * GUI_GRID_W;
		h = 1.04532 * GUI_GRID_H;
	};
	class Hunger: Life_RscProgress
	{
		idc = 5103;
		colorBar[] = {0.97,0.75,0,1};

		x = 59 * GUI_GRID_W + GUI_GRID_X;
		y = 32 * GUI_GRID_H + GUI_GRID_Y;
		w = 12.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	class Thirst_ICON: life_RscPicture
	{
		idc = 5104;

		text = "icons\water.paa"; //--- ToDo: Localize;
		x = 57 * GUI_GRID_W + GUI_GRID_X;
		y = 33.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 1.34856 * GUI_GRID_W;
		h = 1.04532 * GUI_GRID_H;
	};
	class Thirst: Life_RscProgress
	{
		idc = 5105;
		colorBar[] = {0.05,0.28,0.68,1};

		x = 59 * GUI_GRID_W + GUI_GRID_X;
		y = 33.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 12.5 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
	};
	};   
 };