////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Huntah, v1.063, #Viqomo)
////////////////////////////////////////////////////////

class rulesMenu {
	idd = 69696;
	name = "rulesMenu";
	movingEnable = true;
	enableSimulation = true;
	
	class controls
	{

		class backGround: IGUIBack
		{
			idc = 2200;
			x = -15 * GUI_GRID_W + GUI_GRID_X;
			y = 0.42 * GUI_GRID_H + GUI_GRID_Y;
			w = 68 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
		};
		class button1: RscButtonMenu
		{
			idc = 2400;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class button2: RscButtonMenu
		{
			idc = 2401;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class button3: RscButtonMenu
		{
			idc = 2402;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class listBox: DS_RscListBox
		{
			idc = 1500;
			x = -14 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 17.5 * GUI_GRID_H;
			onLBSelChanged = "[_this] spawn DS_fnc_rulesUpdateSubcat";
		};
		class listBox2: DS_RscListBox
		{
			idc = 1501;
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 17.5 * GUI_GRID_H;
			onLBSelChanged = "[_this] spawn DS_fnc_rulesDisplayRule";
		};
		class closeButton: RscButtonMenu
		{
			idc = 2403;
			x = -14 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class textArea: DS_RscStructuredText
		{
			idc = 1100;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 35 * GUI_GRID_W;
			h = 19.5 * GUI_GRID_H;
		};
		class title: RscText
		{
			idc = 1000;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};