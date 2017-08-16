class RPP_PaintBallMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PaintBallMenu', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.18 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.66 * safezoneH;
};
class blueTeam_Que: RPP_RscListbox
{
	idc = 1500;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.18 * safezoneH;
};
class RedTeam_Que: RPP_RscListbox
{
	idc = 1501;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.18 * safezoneH;
};
class Shop_list: RPP_RscListbox
{
	idc = 1502;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.58 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.18 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Blue Team Que"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Red Team Que"; //--- ToDo: Localize;
	x = 0.5875 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Join Team Red"; //--- ToDo: Localize;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Join Team Blue"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Buy one Ticket"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.78 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1603: RPP_RscButton
{
	idc = 1603;
	text = "Friends only mode"; //--- ToDo: Localize;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.78 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1604: RPP_RscButton
{
	idc = 1604;
	text = "Team Death Match"; //--- ToDo: Localize;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.66 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1605: RPP_RscButton
{
	idc = 1605;
	text = "Capture the Flag"; //--- ToDo: Localize;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.6 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1606: RPP_RscButton
{
	idc = 1606;
	text = "Death Match"; //--- ToDo: Localize;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.12 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Paintball System"; //--- ToDo: Localize;
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.12 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscButton_1607: RPP_RscButton
{
	idc = 1607;
	text = "Start Game (Host Only)"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.2 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1608: RPP_RscButton
{
	idc = 1608;
	text = "Ready/Leave"; //--- ToDo: Localize;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.2 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1003: RPP_RscText
{
	idc = 1003;
	text = "Game Modes"; //--- ToDo: Localize;
	x = 0.5875 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.04 * safezoneH;
};
};
};
