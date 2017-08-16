////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Shinji, v1.063, #Wyxyvo)
////////////////////////////////////////////////////////
class mp_news_paper {
	idd = 8180;
	name= "mp_news_paper";
	onLoad = "uiNamespace setVariable ['mp_news_papers', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['mp_news_papers', nil]";
	movingEnable = false;
	enableSimulation = true;
class controlsBackground {
class RscPicture_1200: RscPicture
{
	idc = 8181;
	text = "MINEFACTORY\textures\altis_news.paa";
	x = 0.197165 * safezoneW + safezoneX;
	y = 0.108982 * safezoneH + safezoneY;
	w = 0.605669 * safezoneW;
	h = 0.782036 * safezoneH;
};
};
class controls {
class RscStructuredText_1100: RscStructuredText
{
	idc = 8182;
	text = "Headline"; //--- ToDo: ;
	font = "TahomaB";
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.318773 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 8183;
	text = "TEXT"; //--- ToDo: ;
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.363993 * safezoneH + safezoneY;
	w = 0.318773 * safezoneW;
	h = 0.153007 * safezoneH;
};
class RscStructuredText_1102: RscStructuredText
{
	idc = 8184;
	text = "Headline2"; //--- ToDo: ;
	font = "TahomaB";
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.534002 * safezoneH + safezoneY;
	w = 0.318773 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscStructuredText_1103: RscStructuredText
{
	idc = 8185;
	text = "TEXT"; //--- ToDo: ;
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.602005 * safezoneH + safezoneY;
	w = 0.318773 * safezoneW;
	h = 0.204009 * safezoneH;
};
/*
class RscStructuredText_1102: RscStructuredText
{
	idc = 8184;
	text = "Headline"; //--- ToDo: ;
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.318773 * safezoneW;
	h = 0.0680031 * safezoneH;
};

class RscStructuredText_1103: RscStructuredText
{
	idc = 8185;
	text = "TEXT"; //--- ToDo: ;
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.636006 * safezoneH + safezoneY;
	w = 0.318773 * safezoneW;
	h = 0.170008 * safezoneH;
};
*/
};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Shinji, v1.063, #Dikape)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
