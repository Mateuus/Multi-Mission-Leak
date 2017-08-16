/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/

class EMonkeys_ausweis
{
	idd = 26888;
	name = "EMonkeys_ausweis";
	movingEnable=0;
	fadein=0;
	duration = 10;
	 fadeout=0;
	 
	onLoad = "with uiNameSpace do { EMonkeys_ausweis = _this select 0 }";
	class controlsBackground 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Cifon Dias, v1.063, #Hunymo)
////////////////////////////////////////////////////////

class RscFrame_1200: EMonkeys_RscFrame
{
	idc = 1200;
	x = 0.353594 * safezoneW + safezoneX;
	y = 0.0206296 * safezoneH + safezoneY;
	w = 0.276302 * safezoneW;
	h = 0.286814 * safezoneH;
};
class RscPicture_1300: EMonkeys_RscPicture
{
	idc = 1300;
	text = "core\textures\menu_background\bg_ausweis.paa";
	x = 0.313802 * safezoneW + safezoneX;
	y = 0.0150741 * safezoneH + safezoneY;
	w = 0.35276 * safezoneW;
	h = 0.605 * safezoneH;
};
class EMonkeys_ausweisname: EMonkeys_RscText
{
	idc = 1601;
	text = "";
	x = 0.391146 * safezoneW + safezoneX;
	y = 0.137037 * safezoneH + safezoneY;
	w = 0.141145 * safezoneW;
	h = 0.0182962 * safezoneH;
	sizeEx = 0.8 * GUI_GRID_H;
};
class EMonkeys_ausweisvorname: EMonkeys_RscText
{
	idc = 1600;
	text = "";
	x = 0.386979 * safezoneW + safezoneX;
	y = 0.102778 * safezoneH + safezoneY;
	w = 0.141145 * safezoneW;
	h = 0.0182962 * safezoneH;
	sizeEx = 0.8 * GUI_GRID_H;
};
class EMonkeys_ausweisgebd: EMonkeys_RscText
{
	idc = 1602;
	text = "";
	x = 0.402552 * safezoneW + safezoneX;
	y = 0.170814 * safezoneH + safezoneY;
	w = 0.141145 * safezoneW;
	h = 0.0182962 * safezoneH;
	sizeEx = 0.8 * GUI_GRID_H;
};
class EMonkeys_ausweisgeschlecht: EMonkeys_RscText
{
	idc = 1603;
	text = "";
	x = 0.393229 * safezoneW + safezoneX;
	y = 0.234259 * safezoneH + safezoneY;
	w = 0.141145 * safezoneW;
	h = 0.0182962 * safezoneH;
	sizeEx = 0.8 * GUI_GRID_H;
};
class EMonkeys_ausweisstadts: EMonkeys_RscText
{
	idc = 1604;
	text = "";
	x = 0.396822 * safezoneW + safezoneX;
	y = 0.203926 * safezoneH + safezoneY;
	w = 0.141145 * safezoneW;
	h = 0.0182962 * safezoneH;
	sizeEx = 0.8 * GUI_GRID_H;
};
class EMonkeys_ausweisstadt: EMonkeys_RscText
{
	idc = 1605;
	text = "";
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.262963 * safezoneH + safezoneY;
	w = 0.109323 * safezoneW;
	h = 0.0192222 * safezoneH;
	sizeEx = 0.8 * GUI_GRID_H;
};
class EMonkeys_ausweisausd: EMonkeys_RscText
{
	idc = 1606;
	text = "";
	x = 0.554689 * safezoneW + safezoneX;
	y = 0.265741 * safezoneH + safezoneY;
	w = 0.0760408 * safezoneW;
	h = 0.0164444 * safezoneH;
	sizeEx = 0.75 * GUI_GRID_H;
};
class EMonkeys_ausweisplayerid: EMonkeys_RscText
{
	idc = 1607;
	text = "";
	x = 0.510936 * safezoneW + safezoneX;
	y = 0.293519 * safezoneH + safezoneY;
	w = 0.118228 * safezoneW;
	h = 0.0173703 * safezoneH;
	colorText[] = {1,1,1,1};
	sizeEx = 0.7 * GUI_GRID_H;
};
class EMonkeys_ausweispass: EMonkeys_RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(0,0,0,1)";
	x = 0.558802 * safezoneW + safezoneX;
	y = 0.0802592 * safezoneH + safezoneY;
	w = 0.0636459 * safezoneW;
	h = 0.140186 * safezoneH;
};
class EMonkeys_ausweisplayername: EMonkeys_RscText
{
	idc = 1608;
	text = "";
	x = 0.400989 * safezoneW + safezoneX;
	y = 0.0728519 * safezoneH + safezoneY;
	w = 0.141145 * safezoneW;
	h = 0.0182962 * safezoneH;
	sizeEx = 0.8 * GUI_GRID_H;
};
class EMonkeys_licensename: EMonkeys_RscText
{
	idc = 1609;
	text = "";
	colorText[] = {0.522,0.784,0.035,1};
	x = 0.355579 * safezoneW + safezoneX;
	y = 0.0269612 * safezoneH + safezoneY;
	w = 0.17021 * safezoneW;
	h = 0.0330027 * safezoneH;
	sizeEx = 1.4 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
};