////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Shinji, v1.063, #Fufowa)
////////////////////////////////////////////////////////
class mp_news_paper_new {
	idd = 8190;
	name= "mp_news_paper_new";
	onLoad = "uiNamespace setVariable ['mp_news_paper_news', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['mp_news_paper_news', nil]";
	movingEnable = false;
	enableSimulation = true;
class controlsBackground {
class RscText_1000: RscText
{
	idc = 8191;	
	x = 0.316705 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.533945 * safezoneW;
	h = 0.714033 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.7};
	colorActive[] = {-1,-1,-1,0.7};
};
class RscText_1001: RscText
{
	idc = 8192;
	text = "News Paper Control"; //--- ToDo: ;
	x = 0.316705 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.533945 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {1,0.6,0,1};
	colorText[] = {1,1,1,1};
};
};
class controls {
class RscStructuredText_1100: RscStructuredText
{
	idc = 8193;	
	text = "Die Text-Edits hier sind genau die Groesse der News Paper"; //--- ToDo: ;
	x = 0.332644 * safezoneW + safezoneX;
	y = 0.193986 * safezoneH + safezoneY;
	w = 0.342681 * safezoneW;
	h = 0.0850039 * safezoneH;
};
class RscEdit_1400: RscEdit
{
	idc = 8194;
	text = "Schlagzeile 1"; //--- ToDo: ;
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.318773 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscEdit_1401: RscEdit
{
	idc = 8195;
	text = "Schlagzeile 2"; //--- ToDo: ;
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.534002 * safezoneH + safezoneY;
	w = 0.318773 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscEdit_1402: RscEdit
{
	idc = 8196;
	style = ST_MULTI;
	text = "Text 1"; //--- ToDo: ;
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.363994 * safezoneH + safezoneY;
	w = 0.318773 * safezoneW;
	h = 0.153007 * safezoneH;
	lineSpacing = 1;
};
class RscEdit_1403: RscEdit
{
	idc = 8197;
	style = ST_MULTI;
	text = "Text 2"; //--- ToDo: ;
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.602005 * safezoneH + safezoneY;
	w = 0.318773 * safezoneW;
	h = 0.204009 * safezoneH;
	lineSpacing = 1;
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 8198;
	text = "Die Texte in der News Paper passen sich der Schrift groesse und der Zeilen an. sie sind nicht komplett genau wie hier im Editor zu sehen. Wenn die 2 Schlagzeile leer ist, ist sie auch in der Zeitung leer!"; //--- ToDo: ;
	x = 0.675325 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.167356 * safezoneW;
	h = 0.510023 * safezoneH;
};
class RscButtonMenu_2400: RscButtonMenu
{
	idc = 8199;
	text = "Abbrechen"; //--- ToDo: ;
	action = "closedialog 0;";
	x = 0.523908 * safezoneW + safezoneX;
	y = 0.857017 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};
class RscButtonMenu_2401: RscButtonMenu
{
	idc = 8200;
	text = "SPEICHERN"; //--- ToDo: ;
	action = "[] spawn life_fnc_news_save; closedialog 0;";
	x = 0.340613 * safezoneW + safezoneX;
	y = 0.857016 * safezoneH + safezoneY;
	w = 0.135479 * safezoneW;
	h = 0.0510023 * safezoneH;
};
};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
