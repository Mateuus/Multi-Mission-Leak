class marketMenu {
	idd = 905309;
	name= "marketMenu";
	movingEnable = false;
	enableSimulation = true;

	class controls
	{
		class background: IGUIBack
		{
			idc = 2200;
			x = 0.1 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39.8 * GUI_GRID_W;
			h = 17.5 * GUI_GRID_H;
		};
		class title: RscText
		{
			idc = 1001;
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class btn3: RscButtonMenu
		{
			idc = 2401;
			text = "Tips";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "[] spawn DS_civ_marketTips";
		};
		class btn2: RscButtonMenu
		{
			idc = 2402;
			text = "Job Information";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "[] call DS_civ_marketInformation";
		};
		class btn4: RscButtonMenu
		{
			idc = 2406;
			text = "Close";
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "closeDialog 0;";
		};
		class RscCombo_2100: DS_RscListBox
		{
			idc = 2669;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 16.5 * GUI_GRID_H;
			sizeEx = 0.035;
			onLBSelChanged = "_this call DS_civ_marketLbChange";
		};
		class textInfoBounty: DS_RscStructuredText
		{
			idc = 1666;
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 27 * GUI_GRID_W;
			h = 16.5 * GUI_GRID_H;
			text = "text should go here yo";
		};
	};
};