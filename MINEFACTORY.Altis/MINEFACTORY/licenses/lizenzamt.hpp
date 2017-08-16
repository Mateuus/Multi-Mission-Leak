////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Shinji, v1.063, #Byloki)
////////////////////////////////////////////////////////
class mp_license_maker {
	idd = 6779;
	name= "mp_license_maker";
	onLoad = "uiNamespace setVariable ['mp_license_maker', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['mp_license_maker', nil]";
	movingEnable = false;
	enableSimulation = true;
class controlsBackground {
class RscText_1000: RscText
{
	idc = 6781;
	x = 0.268889 * safezoneW + safezoneX;
	y = 0.125983 * safezoneH + safezoneY;
	w = 0.47816 * safezoneW;
	h = 0.714033 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.7};
	colorActive[] = {-1,-1,-1,0.7};
};
class RscText_1001: RscText
{
	idc = 6780;
	text = "Lizenz-Amt"; //--- ToDo: ;
	x = 0.268889 * safezoneW + safezoneX;
	y = 0.125983 * safezoneH + safezoneY;
	w = 0.47816 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {1,0.6,0,1};
	colorText[] = {1,1,1,1};
};
};
class controls {
class RscStructuredText_1100: RscStructuredText
{
	idc = 6782;
	text= "Du wirst immer kleinere Instruktionen erhalten. Halte diese und die vorgegebene Zeit ein, dann solltest du die Lizenzen spielend leicht erhalten. ACHTUNG: Solltest du während deiner Tests von anderen Spielern in irgendeiner Hinsicht blockiert, behindert werden, so wende dich direkt an die Polizei des Servers. Dies ist Strafbar und kann mit Freiheitsentzug bestraft werden!";
	x = 0.523908 * safezoneW + safezoneX;
	y = 0.210987 * safezoneH + safezoneY;
	w = 0.207203 * safezoneW;
	h = 0.595027 * safezoneH;
	colorBackground[] = {-1,-1,-1,-1};
	colorText[] = {1,1,1,1};
};
class RscButtonMenu_2400: RscButtonMenu
{
	idc = 6783;
	text = "Auto - Schein"; //--- ToDo: ;
	action = "_nil=[""Car""]ExecVM ""MINEFACTORY\licenses\lizenzen_abfrage.sqf"";";
	tooltip ="Kosten: 500$";
	x = 0.284828 * safezoneW + safezoneX;
	y = 0.210987 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};
class RscButtonMenu_2401: RscButtonMenu
{
	idc = 6784;
	text = "LKW - Schein"; //--- ToDo: ;
	action = "_nil=[""Trucker""]ExecVM ""MINEFACTORY\licenses\lizenzen_abfrage.sqf"";";
	tooltip ="Kosten: 15000$";
	x = 0.284828 * safezoneW + safezoneX;
	y = 0.27899 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};
class RscButtonMenu_2402: RscButtonMenu
{
	idc = 6785;
	text = "Boots - Schein"; //--- ToDo: ;
	action = "_nil=[""Boating""]ExecVM ""MINEFACTORY\licenses\lizenzen_abfrage.sqf"";";
	tooltip ="Kosten: 1000$";
	x = 0.284828 * safezoneW + safezoneX;
	y = 0.346993 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};
class RscButtonMenu_2403: RscButtonMenu
{
	idc = 6786;
	text = "Flug - Schein"; //--- ToDo: ;
	action = "_nil=[""Flying""]ExecVM ""MINEFACTORY\licenses\lizenzen_abfrage.sqf"";";
	tooltip ="Kosten: 25000$";
	x = 0.284828 * safezoneW + safezoneX;
	y = 0.414996 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};
class RscButtonMenu_2404: RscButtonMenu
{
	idc = 6787;
	text = "Waffenschein"; //--- ToDo: ;
	action = "_nil=[""Weapons""]ExecVM ""MINEFACTORY\licenses\lizenzen_abfrage.sqf"";";
	tooltip ="Kosten: 10000$";
	x = 0.284828 * safezoneW + safezoneX;
	y = 0.482999 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};
class RscButtonMenu_2405: RscButtonMenu
{
	idc = 6788;
	text = "Besitzurkunde"; //--- ToDo: ;
	action = "_nil=[""Housing""]ExecVM ""MINEFACTORY\licenses\lizenzen_abfrage.sqf"";";
	tooltip ="Kosten: 75000$";
	x = 0.284828 * safezoneW + safezoneX;
	y = 0.755012 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};

class RscButtonMenu_2406: RscButtonMenu
{
	idc = 6789;
	text = "LEER"; //--- ToDo: ;
//	action = "_nil=[""hunting""]ExecVM ""MINEFACTORY\licenses\lizenzen_abfrage.sqf"";";
	tooltip ="Kosten: 30000$ Diese Lizenz erlaubt es dir Tiere zu jagen und sie auszuweiden.";
	x = 0.284828 * safezoneW + safezoneX;
	y = 0.551002 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};
class RscButtonMenu_2407: RscButtonMenu
{
	idc = 6790;
	text = "LEER"; //--- ToDo: ;
//	action = "_nil=[""Placeholder""]ExecVM ""MINEFACTORY\licenses\lizenzen_abfrage.sqf"";";
	tooltip ="Kosten: 500$";
	x = 0.284828 * safezoneW + safezoneX;
	y = 0.619005 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};
class RscButtonMenu_2408: RscButtonMenu
{
	idc = 6791;
	text = "LEER"; //--- ToDo: ;
//	action = "_nil=[""Placeholder""]ExecVM ""MINEFACTORY\licenses\lizenzen_abfrage.sqf"";";
	tooltip ="Kosten: 500$";
	x = 0.284828 * safezoneW + safezoneX;
	y = 0.687009 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};
};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
