////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Niky, v1.063, #Wyryhy)
////////////////////////////////////////////////////////

#define GUI_GRID_W		0.033
#define GUI_GRID_H		0.033
#define GUI_GRID_X		0.13
#define GUI_GRID_Y		0.1
class EmpMenu
{
	idd = 13371;
	movingenable = true;
	name= "EmpMenu";
	class controls
	{
		class RscText_1000: EMonkeys_RscText
		{
			idc = 1000;
			text = "EMP Menü";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class RscListbox_1500: EMonkeys_RscListbox
		{
			idc = 1500;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 18 * GUI_GRID_H;
			onLBSelChanged = "empListSelection = (_this select 1);";
		};
		class RscButton_1601: EMonkeys_RscButtonMenu
		{
			idc = 1601;
			text = "Schließen";
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "closeDialog 0;";
		};
		class RscButton_1600: EMonkeys_RscButtonMenu
		{
			idc = 1600;
			text = "Warnen";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "empSelection = 1;empDidAction = true;";
		};
		class RscText_1604: EMonkeys_RscText
		{
			idc = 1604;
			text = "";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButton_1602: EMonkeys_RscButtonMenu
		{
			idc = 1602;
			text = "Auslösen";
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "if(((vehicle player) getVariable [""empReadyTimeStamp"", 0]) - time <= 0) then {empSelection = 2;empDidAction = true;};";
		};
		class RscText_1603: EMonkeys_RscText
		{
			idc = 1603;
			text = "";
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
