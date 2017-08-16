class interactionMenu {

	idd = 666675;
	movingEnable = true;
	enableSimulation = true;
	name = "interactionMenu";

	class controlsBackground
	{
		class background: IGUIBack
		{
			idc = 2200;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
			moving = 1;
		};
	};

	class controls
	{
		class img1: DS_RscPicture
		{
			idc = 1200;
			text = "";
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class img2: DS_RscPicture
		{
			idc = 1201;
			text = "";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class img3: DS_RscPicture
		{
			idc = 1202;
			text = "";
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class img4: DS_RscPicture
		{
			idc = 1203;
			text = "";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class img5: DS_RscPicture
		{
			idc = 1204;
			text = "";
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class img6: DS_RscPicture
		{
			idc = 1205;
			text = "";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class img7: DS_RscPicture
		{
			idc = 1206;
			text = "";
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class img8: DS_RscPicture
		{
			idc = 1207;
			text = "";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class img9: DS_RscPicture
		{
			idc = 1208;
			text = "";
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class img10: DS_RscPicture
		{
			idc = 1209;
			text = "";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class btnClose: RscButtonMenu
		{
			idc = 2400;
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Close";
			onButtonClick = "closeDialog 0;";
		};
		class btn1: DS_PictureButtonMenu
		{
			idc = 2401;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class btn2: DS_PictureButtonMenu
		{
			idc = 2402;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class btn3: DS_PictureButtonMenu
		{
			idc = 2403;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class btn4: DS_PictureButtonMenu
		{
			idc = 2404;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class btn5: DS_PictureButtonMenu
		{
			idc = 2405;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class btn6: DS_PictureButtonMenu
		{
			idc = 2406;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class btn7: DS_PictureButtonMenu
		{
			idc = 2407;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class btn8: DS_PictureButtonMenu
		{
			idc = 2408;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class btn9: DS_PictureButtonMenu
		{
			idc = 2409;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class btn10: DS_PictureButtonMenu
		{
			idc = 2410;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class headerImg: DS_RscPicture
		{
			idc = 1210;
			text = "";
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = -2 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 4.5 * GUI_GRID_H;
		};
	};
};