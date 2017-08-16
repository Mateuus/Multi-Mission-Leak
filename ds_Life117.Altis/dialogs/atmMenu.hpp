#define true 1
#define false 0

class atmMenu {
	idd = 666;
	name= "atmMenu";
	movingEnable = true;
	enableSimulation = true;

#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)



	class controls 
	{

controls[]=
{
	background,
	inputBox,
	deposit,
	withdraw,
	playerList,
	transfer,
	title,
	balance,
	insurance,
	exit,
	logo1,
	logo2
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Huntah, v1.063, #Sumucu)
////////////////////////////////////////////////////////

class background: IGUIBack
{
	idc = 2200;
	moving = 1;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 22.5 * GUI_GRID_W;
	h = 11.5 * GUI_GRID_H;
};
class logo1: DS_RscPicture
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.7};
			text = "extras\textures\menus\bankBackground.jpg";
			x = 8.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 22.5 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
		};
class logo2: DS_RscPicture
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.7};
			text = "";
			x = 23.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
		};
class inputBox: DS_RscEdit
{
	idc = 1400;
	text = "0";
	x = 16.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class deposit: RscButtonMenu
{
	idc = 2400;
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class withdraw: RscButtonMenu
{
	idc = 2401;
	x = 20 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class playerList: DS_RscCombo
{
	idc = 2100;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class transfer: RscButtonMenu
{
	idc = 2402;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class title: DS_RscStructuredText
{
	idc = 1000;
	text = "";
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 20 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class balance: DS_RscStructuredText
{
	idc = 1001;
	text = "0";
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class insurance: RscButtonMenu
{
	idc = 2403;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class exit: RscButtonMenu
{
	idc = 2404;
	x = 25 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};};