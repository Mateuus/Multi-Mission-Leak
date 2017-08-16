class martialLaw {
	idd = 3951;
	name= "martialLaw";
	movingEnable = false;
	enableSimulation = true;

	class controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 5.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29 * GUI_GRID_W;
			h = 15 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class title: RscText
		{
			idc = 1000;
			text = "Police Martial Law Menu"; //--- ToDo: Localize;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class regionWide: RscButtonMenu
		{
			idc = 2400;
			onButtonClick = "[0] spawn DS_cop_setmartiallaw";
			text = "Declare Region Wide ($50k)"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class endMartialLaw: RscButtonMenu
		{
			idc = 2405;
			onButtonClick = "[1] spawn DS_cop_setmartiallaw";
			text = "End Martial Law"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class regionWideAir: RscButtonMenu
		{
			idc = 2111;
			onButtonClick = "[2] spawn DS_cop_setmartiallaw";
			text = "Ground All Air Vehicles ($100k)"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class endAirBan: RscButtonMenu
		{
			idc = 4401;
			onButtonClick = "[3] spawn DS_cop_setmartiallaw";
			text = "End Air Ban"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class pubCopToggle: RscButtonMenu
		{
			idc = 2407;
			onButtonClick = "[] spawn DS_cop_publicblock";
			text = "Enable/Disable Public Cop Area Restrictions"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class close: RscButtonMenu
		{
			idc = 2406;
			onButtonClick = "closeDialog 0;";
			text = "Close"; //--- ToDo: Localize;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 22.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};