/*###############################
#	(c) 2016 PierreAmyf     	#
#								#
#	Author: PierreAmyf		    #
#	Lizenz: Lizenz.txt Lesen!	#
###############################*/


class life_polizei1computer
{
	idd = 6000;
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_dropdown;";
	
	class controlBackground
	{
		
	};

	class controls
	{
		class WantedList_HG: Life_RscText
		{
			idc = 1000;
			x = 0.108055 * safezoneW + safezoneX;
			y = 0.191882 * safezoneH + safezoneY;
			w = 0.78389 * safezoneW;
			h = 0.649248 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};
		class WantedList: Life_RscText
		{
			idc = 1001;
			text = "MineFactory Polizei Computer"; //--- ToDo: ;
			x = 0.368229 * safezoneW + safezoneX;
			y = 0.203116 * safezoneH + safezoneY;
			w = 0.355208 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class namestructuredtext: Life_RscStructuredText
		{
			idc = 6001;
			x = 0.265104 * safezoneW + safezoneX;
			y = 0.335064 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class fuhrerscheinstructuredtext: Life_RscStructuredText
		{
			idc = 6002;
			x = 0.265104 * safezoneW + safezoneX;
			y = 0.390043 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class gefangnisstrukturettext: Life_RscStructuredText
		{
			idc = 6003;
			x = 0.265104 * safezoneW + safezoneX;
			y = 0.445021 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class fahndungstructuredtext: Life_RscStructuredText
		{
			idc = 6004;
			x = 0.265104 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class nameuberschrift: Life_RscText
		{
			idc = 1002;
			text = "Name"; //--- ToDo: ;
			x = 0.196354 * safezoneW + safezoneX;
			y = 0.324069 * safezoneH + safezoneY;
			w = 0.0630208 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class Fuhrerscheinuberschrift: Life_RscText
		{
			idc = 1003;
			text = "Fuhrerschein"; //--- ToDo: ;
			x = 0.150521 * safezoneW + safezoneX;
			y = 0.379047 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class Gefangnisstatusueberschrift: Life_RscText
		{
			idc = 1004;
			text = "Gefangnisstatus"; //--- ToDo: ;
			x = 0.127604 * safezoneW + safezoneX;
			y = 0.434026 * safezoneH + safezoneY;
			w = 0.131771 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class Fahndungsstatusueberschrift: Life_RscText
		{
			idc = 1005;
			text = "Fahndungsstatus"; //--- ToDo: ;
			x = 0.121875 * safezoneW + safezoneX;
			y = 0.489004 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class Informationenuerbserschrift: Life_RscText
		{
			idc = 1006;
			text = "Informationen vom Zivilist"; //--- ToDo: ;
			x = 0.139062 * safezoneW + safezoneX;
			y = 0.247099 * safezoneH + safezoneY;
			w = 0.240625 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class strafberichttxt: Life_RscStructuredText
		{
			idc = 6006;
			x = 0.442708 * safezoneW + safezoneX;
			y = 0.324069 * safezoneH + safezoneY;
			w = 0.406771 * safezoneW;
			h = 0.329871 * safezoneH;
		};
		class boxstraftaten: Life_RscListbox
		{
			idc = 6012;
			x = 0.121875 * safezoneW + safezoneX;
			y = 0.65394 * safezoneH + safezoneY;
			w = 0.297917 * safezoneW;
			h = 0.15394 * safezoneH;
			onLBSelChanged = "[(lbCurSel 6012)] call life_fnc_straftaten;";
		};
		class rsccombo: Life_RscCombo
		{
			idc = 6013;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.65394 * safezoneH + safezoneY;
			w = 0.303646 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class Straftatenueberschrift: Life_RscText
		{
			idc = 1007;
			text = "Straftaten"; //--- ToDo: ;
			x = 0.442708 * safezoneW + safezoneX;
			y = 0.26909 * safezoneH + safezoneY;
			w = 0.0973958 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class Straftatenueberschrift2: Life_RscText
		{
			idc = 1008;
			text = "Straftaten"; //--- ToDo: ;
			x = 0.127604 * safezoneW + safezoneX;
			y = 0.598961 * safezoneH + safezoneY;
			w = 0.0973958 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class berichtedit: Life_RscButtonMenu
		{
			idc = 6014;
			text = "Bericht Editieren"; //--- ToDo: ;
			x = 0.442708 * safezoneW + safezoneX;
			y = 0.719914 * safezoneH + safezoneY;
			w = 0.0973958 * safezoneW;
			h = 0.0549786 * safezoneH;
			onButtonClick = "[] call life_fnc_berichtedit;";
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
		};
		class wantedadd: Life_RscButtonMenu
		{
			idc = 6007;
			text = "Ausgewalte Person zur wanted liste Hinzufugen"; //--- ToDo: ;
			x = 0.557292 * safezoneW + safezoneX;
			y = 0.719914 * safezoneH + safezoneY;
			w = 0.166146 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
			onButtonClick = "_info = call compile format[""%1"", life_computergesucht];[] remoteExecCall [""life_fnc_wirdgesucht"",_info]; closedialog 0;";
		};
		class homebutton: Life_RscButtonMenu
		{
			idc = 6008;
			text = "HomeBildschirm"; //--- ToDo: ;
			x = 0.442708 * safezoneW + safezoneX;
			y = 0.785888 * safezoneH + safezoneY;
			w = 0.0973958 * safezoneW;
			h = 0.0439828 * safezoneH;
			onButtonClick = "closedialog 0;closedialog 0; createdialog ""life_polizei2computer"";";
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";			
		};
		class bericht: Life_RscButtonMenu
		{
			idc = 6009;
			text = "Bericht ueber das Ziel schreiben"; //--- ToDo: ;
			x = 0.557292 * safezoneW + safezoneX;
			y = 0.785888 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
			onButtonClick = "createdialog ""life_polizei3computer"";";			
		};
		class closebutton: Life_RscButtonMenu
		{
			idc = 6011;
			text = "Schliessen"; //--- ToDo: ;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.774893 * safezoneH + safezoneY;
			w = 0.0744792 * safezoneW;
			h = 0.0549786 * safezoneH;
			onButtonClick = "closedialog 0;";
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
		};
		class berichtloeschenbutton: Life_RscButtonMenu
		{
			idc = 6010;
			text = "ausgewaehlten Bericht loeschen"; //--- ToDo: ;
			x = 0.683333 * safezoneW + safezoneX;
			y = 0.785888 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
			onButtonClick = "[] spawn life_fnc_deletebericht";
		};			
	};
};

class life_polizei2computer
{
	idd = 6025;
	movingEnable = false;
	enalbeSimulation = true;
	onLoad = "[] spawn life_fnc_pcinit;";
	
	class controlBackground
	{
		
	};
	
	class controls
	{
		class WantedList_HG: Life_RscText
		{
			idc = 1000;
			x = 0.108055 * safezoneW + safezoneX;
			y = 0.191882 * safezoneH + safezoneY;
			w = 0.78389 * safezoneW;
			h = 0.649248 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};
		class WantedList: Life_RscText
		{
			idc = 1001;
			text = "MineFactory Polizei Computer"; //--- ToDo: ;
			x = 0.368229 * safezoneW + safezoneX;
			y = 0.203116 * safezoneH + safezoneY;
			w = 0.355208 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class spielerliste: Life_RscListbox
		{
			idc = 6031;
			x = 0.127604 * safezoneW + safezoneX;
			y = 0.26909 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.483811 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			onLBSelChanged  = "[0] call life_fnc_playerQuery;"; //(lbCurSel 6031)			
		};
		class uhrzeitdatumtxt: Life_RscStructuredText
		{
			idc = 6026;
			x = 0.694792 * safezoneW + safezoneX;
			y = 0.214111 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class Buergertxt: Life_RscStructuredText
		{
			idc = 6028;
			x = 0.620312 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.131949 * safezoneH;
		};
		class spielerinfo: Life_RscButtonMenu
		{
			idc = 6030;
			text = "informationen ueber den spieler abrufen"; //--- ToDo: ;
			x = 0.454167 * safezoneW + safezoneX;
			y = 0.65394 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0659743 * safezoneH;
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
			onButtonClick  = "[1] call life_fnc_playerQuery;";			
		};
		class bericht: Life_RscButtonMenu
		{
			idc = 6029;
			text = "Bericht ueber das Ziel schreiben"; //--- ToDo: ;
			x = 0.597396 * safezoneW + safezoneX;
			y = 0.65394 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0659743 * safezoneH;
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
			onButtonClick = "createdialog ""life_polizei3computer"";";			
		};
		class ziviueberschrift: Life_RscText
		{
			idc = 1002;
			text = "Zivilist"; //--- ToDo: ;
			x = 0.660417 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class spielerlisteueberschrift: Life_RscText
		{
			idc = 1003;
			text = "Spieler Liste"; //--- ToDo: ;
			x = 0.173438 * safezoneW + safezoneX;
			y = 0.214111 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class closebutton: Life_RscButtonMenu
		{
			idc = 6032;
			text = "Schliessen"; //--- ToDo: ;
			x = 0.144792 * safezoneW + safezoneX;
			y = 0.774893 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
			onButtonClick = "closedialog 0;";
		};
	};
};

class life_polizei3computer
{
	idd = 6050;
	movingEnable = false;
	enalbeSimulation = true;
	onLoad = "[] spawn life_fnc_dropdown;";
	
	class controlBackground
	{
		
	};
	
	class controls
	{		
		class WantedList_HG: Life_RscText
		{
			idc = 1000;
			x = 0.108055 * safezoneW + safezoneX;
			y = 0.191882 * safezoneH + safezoneY;
			w = 0.78389 * safezoneW;
			h = 0.649248 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};
		class WantedList: Life_RscText
		{
			idc = 1001;
			text = "MineFactory Polizei Computer"; //--- ToDo: ;
			x = 0.368229 * safezoneW + safezoneX;
			y = 0.203116 * safezoneH + safezoneY;
			w = 0.355208 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class datumstrafzeittxt: Life_RscStructuredText
		{
			idc = 6051;
			x = 0.654687 * safezoneW + safezoneX;
			y = 0.324069 * safezoneH + safezoneY;
			w = 0.166146 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class uhrzeitstraftattxt: Life_RscStructuredText
		{
			idc = 6052;
			x = 0.654687 * safezoneW + safezoneX;
			y = 0.467013 * safezoneH + safezoneY;
			w = 0.166146 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class Datumueberschrift: Life_RscText
		{
			idc = 1002;
			text = "Datum"; //--- ToDo: ;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.258094 * safezoneH + safezoneY;
			w = 0.166146 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class uhrzeitueberschrift: Life_RscText
		{
			idc = 1003;
			text = "Uhrzeit"; //--- ToDo: ;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.401039 * safezoneH + safezoneY;
			w = 0.166146 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class berichtedit: Life_RscEdit
		{
			idc = 6058;
			x = 0.15625 * safezoneW + safezoneX;
			y = 0.554979 * safezoneH + safezoneY;
			w = 0.538542 * safezoneW;
			h = 0.252901 * safezoneH;
		};
		class speichernbutton: Life_RscButtonMenu
		{
			idc = 6055;
			text = "In der db Speichern"; //--- ToDo: ;
			x = 0.717708 * safezoneW + safezoneX;
			y = 0.664936 * safezoneH + safezoneY;
			w = 0.120313 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
			onButtonClick = "[] call life_fnc_berichtverfassen";
		};
		class closebutton: Life_RscButtonMenu
		{
			idc = 6056;
			text = "Schliessen"; //--- ToDo: ;
			x = 0.717708 * safezoneW + safezoneX;
			y = 0.741906 * safezoneH + safezoneY;
			w = 0.120313 * safezoneW;
			h = 0.0549786 * safezoneH;
			onButtonClick = "closedialog 0;";
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
		};
		class berichtueberschrift: Life_RscText
		{
			idc = 1004;
			text = "Bericht"; //--- ToDo: ;
			x = 0.15625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.166146 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class combo: Life_RscCombo
		{
			idc = 6057;
			x = 0.15625 * safezoneW + safezoneX;
			y = 0.324069 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
	};
};