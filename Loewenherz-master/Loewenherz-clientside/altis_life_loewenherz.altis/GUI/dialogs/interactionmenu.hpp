class interactionmenu_loewenherz {

	idd = 999;
	movingEnable = true;
	enableSimulation = true;

	class controlsBackground {
class background: lhm_RscPicture
{
	idc = 1200;
	text = "core\textures\icons\misc\inter_menu.paa";
	x = -0.0738913;
	y = -0.18404;
	w = 1.15;
	h = 1.36;
};
};

	class controls {
class Button1: lhm_RscButtonMenu
{
	idc = 2400;
	x = 0.202167;
	y = 0.320875;
	w = 0.175;
	h = 0.04;
};
class Button2: lhm_RscButtonMenu
{
	idc = 2401;
	x = 0.174798;
	y = 0.402357;
	w = 0.175;
	h = 0.04;
};
class Button3: lhm_RscButtonMenu
{
	idc = 2402;
	x = 0.168599;
	y = 0.481482;
	w = 0.175;
	h = 0.04;
};
class Button4: lhm_RscButtonMenu
{
	idc = 2403;
	x = 0.177419;
	y = 0.560606;
	w = 0.175;
	h = 0.04;
};
class Button5: lhm_RscButtonMenu
{
	idc = 2404;
	x = 0.217742;
	y = 0.641414;
	w = 0.175;
	h = 0.04;
};
class Button6: lhm_RscButtonMenu
{
	idc = 2405;
	x = 0.624748;
	y = 0.321549;
	w = 0.175;
	h = 0.04;
};
class Button7: lhm_RscButtonMenu
{
	idc = 2406;
	x = 0.65247;
	y = 0.400673;
	w = 0.175;
	h = 0.04;
};
class Button8: lhm_RscButtonMenu
{
	idc = 2407;
	x = 0.66255;
	y = 0.481481;
	w = 0.175;
	h = 0.04;
};
class Button9: lhm_RscButtonMenu
{
	idc = 2408;
	x = 0.646169;
	y = 0.560606;
	w = 0.175;
	h = 0.04;
};
class Button10: lhm_RscButtonMenu
{
	idc = 2409;
	x = 0.603327;
	y = 0.639731;
	w = 0.175;
	h = 0.04;
};
class Button_close: lhm_RscButtonMenu
{
	idc = 2410;
	text = "close"; //--- ToDo: Localize;
	onButtonClick = "closeDialog 0;";
	x = 0.433216;
	y = 0.728956;
	w = 0.1375;
	h = 0.04;
};
		
	};
};