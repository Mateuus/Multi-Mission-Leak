class licenseTest {
	idd = 323345;
	name= "licenseTest";
	movingEnable = true;
	enableSimulation = true;
	
	class controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 36 * GUI_GRID_W;
			h = 18 * GUI_GRID_H;
		};
		class Question: DS_RscStructuredText
		{
			idc = 1100;
			x = 2.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 17 * GUI_GRID_H;
			text = "";
		};
		class titlePrice: DS_RscStructuredText
		{
			idc = 1101;
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			text = "";
		};
		class option1: DS_RscStructuredText
		{
			idc = 1102;
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			text = "";

		};
		class option2: DS_RscStructuredText
		{
			idc = 1103;
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			text = "";

		};
		class option3: DS_RscStructuredText
		{
			idc = 1104;
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			text = "";

		};
		class option4: DS_RscStructuredText
		{
			idc = 1105;
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			text = "";

		};
		class submit: DS_RscButtonMenu
		{
			idc = 2400;
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class close: DS_RscButtonMenu
		{
			idc = 2401;
			x = 32.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class check1: DS_RscCheckbox
		{
			idc = 2800;
			x = 32.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class check2: DS_RscCheckbox
		{
			idc = 2801;
			x = 32.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class check3: DS_RscCheckbox
		{
			idc = 2802;
			x = 32.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class check4: DS_RscCheckbox
		{
			idc = 2803;
			x = 32.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
	};
};