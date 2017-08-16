#include "Debugging.hpp"
#include "Spawning.hpp"
#include "Ranks.hpp"
#include "Compensate.hpp"
#include "Scripts.hpp"
#include "Main2.hpp"
#include "Events.hpp"
#include "Events2.hpp"
#include "buttonsConfig.hpp"


class ADPLoading
{
	idd = 6000;
	movingEnable = 1;
	onLoad = "[] spawn ADP_fnc_whdbkivvdczhdmqlixdcmuftzugdlqycjmxlaxrnqoqkjitdiiwkgzdmlmjc";
	controlsBackground[] = 
	{
	ADP_PICTUREBACK1,
	ADP_PICTUREBACK2
	};
	class ADP_PICTUREBACK1: ADPRscPicture
	{
		idc = -1;
		text = "ADP\Dialog\ADPImage.paa";
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.505313 * safezoneW;
		h = 0.781 * safezoneH;
	};
	
	class ADP_PICTUREBACK2: ADPRscPicture
	{
		idc = -1;
		text = "ADP\Dialog\ADPloadingtext.PAA";
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.505313 * safezoneW;
		h = 0.781 * safezoneH;
	};

	class controls {};
}

class ADP 
{
	idd = 6001;
	movingEnable = 1;
	onLoad = "";
	onUnload = "";
	controlsBackground[] = 
	{
	ADP_PICTUREBACK,
	ADP_TEXT1,
	ADP_TEXT2,
	ADP_TEXT4,
	ADP_TEXT5
	
	};
	class ADP_PICTUREBACK: ADPRscPicture
	{
		idc = 1200;
		text = "ADP\Dialog\ADPImage.paa";
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.505313 * safezoneW;
		h = 0.781 * safezoneH;
	};
	class ADP_TEXT5: ADPRscText
	{
		idc = 9000;
		text = "Fade"; 
		colorDisabled[] = {1,1,1,1};
		type = 11;
		style = ST_CENTER;
		x = 0.665 * safezoneW + safezoneX;
		y = 0.550 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class ADP_TEXT1: ADPRscText
	{
		idc = 9002;
		text = "View Distance"; 
		colorDisabled[] = {1,1,1,1};
		type = 11;
		x = 0.608437 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.08725 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class ADP_TEXT2: ADPRscText
	{
		idc = 9003;
		text = "Grass Quality"; 
		colorDisabled[] = {1,1,1,1};
		type = 11;
		x = 0.608437 * safezoneW + safezoneX;
		y = 0.599 * safezoneH + safezoneY;
		w = 0.08725 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class ADP_TEXT4: ADPRscText
	{
		idc = 9004;
		text = "Shadow Distance"; 
		colorDisabled[] = {1,1,1,1};
		type = 11;
		x = 0.608437 * safezoneW + safezoneX;
		y = 0.643 * safezoneH + safezoneY;
		w = 0.08725 * safezoneW;
		h = 0.022 * safezoneH;
	};
	
	
	class Controls 
	{
		class ADP_SLIDE1: ADPRscSlider
		{
			idc = 1901;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.545 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.011 * safezoneH;
			onSliderPosChanged = "[6001,(_this) select 1] call ADP_fnc_zmjfgyjvajivrhxolzkwhtecaptiobigwamtpdezsjorwnfyvqfofrv;";
		};
		
		class ADP_EXEC: ADPRscEdit
		{
			idc = 1400;
			style = ST_LEFT+ST_FRAME;
			autocomplete = "scripting";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyDown = "_this call ADP_fnc_uvhljrlcwtqtslxtcbwevzcfhvgznojcwerdteeokwqgdnkhnzfnjfcgztn";
		};

		class IGUIBack_2200: ADP_IGUIBack
		{
			idc = 9400;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ADP_EXEC1: RscEditR
		{
			idc = 1405; 
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ADP_LIST: ADPRscListbox
		{
			idc = 1500;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY; 
			w = 0.0979687 * safezoneW;
			h = 0.302 * safezoneH;
			sizeEx = 0.025;
			class ScrollBar
			{
				type = CT_XSLIDER;
				color[] = {1,1,1,1};
				colorActive[] = {1,1,1,1};
				thumb = "#(argb,8,8,3)color(0,0,0,9)";
				arrowEmpty = "#(argb,8,8,3)color(0,0,0,9)";
				arrowFull = "#(argb,8,8,3)color(0.631,0.153,0.153,1)";
				border = "#(argb,8,8,3)color(0.361,0.349,0.353,1)";
			};
			class ListScrollBar: ScrollBar 
			{
				height = 0.021;
				width = 0.021;
				autoScrollEnabled = 0;
				color[] = {1,1,1,1};
			}; 
		};
		
		
		
		
		class ADP_COMBO: ADPRscCombo
		{
			idc = 2100;
			text = "View Distance";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.575 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "#(argb,8,8,3)color(1,1,1,1)";
				arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
				arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
				border = "#(argb,8,8,3)color(1,1,1,1)";
			};
			class ComboScrollBar: ScrollBar
			{
				color[] = {1,1,1,1};
			}; 
		};
		class ADP_COMBO1: ADPRscCombo
		{
			idc = 2101;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "#(argb,8,8,3)color(1,1,1,1)";
				arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
				arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
				border = "#(argb,8,8,3)color(1,1,1,1)";
			};
			class ComboScrollBar: ScrollBar
			{
				color[] = {1,1,1,1};
			}; 
		};
		
		class ADP_COMBO2: ADPRscCombo
		{
			idc = 2102;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.663 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "#(argb,8,8,3)color(1,1,1,1)";
				arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
				arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
				border = "#(argb,8,8,3)color(1,1,1,1)";
			};
			class ComboScrollBar: ScrollBar {
				color[] = {1,1,1,1};
			}; 
		};

		class ADP_MenuScripts: ADPRscButtonMenu
		{
			idc = 2400;
			text = "Debugging"; 
			x = 0.2916 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "To execute and watch all of your Favorite Variables";
			theAction = "[] spawn ADP_fnc_ndsybjptxwqixppdiqgpiumakpibsmjgnlshiudulvnffjfodg;";
			adminlevel = -1;
		};
		
		class ADP_MenuMain: ADPRscButtonMenu
		{
			idc = 2401;
			text = "Main"; 
			x = 0.3708 * safezoneW + safezoneX; 
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			action = "[] spawn ADP_fnc_adpMain;";
			adminlevel = -2;
		};
		
		class ADP_MenuMain2: ADPRscButtonMenu
		{
			idc = 2409;
			text = "Main 2"; 
			x = 0.45 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Main 2";
			theAction = "[] spawn ADP_fnc_iiglvqyubunxskkcuapgnyknpbrbadnpdqhfegozvfkwquvswtv;";
			adminlevel = -1;
		};
		
		class ADP_MenuSpawning: ADPRscButtonMenu
		{
			idc = 2403;
			text = "Spawning"; 
			x = 0.5292 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "To spawn anything your heart desires";
			theAction = "[] spawn ADP_fnc_havzyadaqqqecudzryocdruhpzmvesqrxfketorpetwwjgrvdwrhrgxvkbx;";
			adminlevel = -1;
		};
		
		class ADP_MenuRanks: ADPRscButtonMenu
		{
			idc = 2405;
			text = "Ranks"; 
			x = 0.6084 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Set various player ranks";
			theAction = "[] spawn ADP_fnc_ssqixfzneimkhownrodvsniaaedmglqlymuutbysnfypippzqn;";
			adminlevel = -1;
		};
		
		class ADP_MenuEvents: ADPRscButtonMenu
		{
			idc = 25000;
			text = "Events"; 
			x = 0.2916 * safezoneW + safezoneX;
			y = 0.928 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Events";
			theAction = "[] spawn ADP_fnc_adpEvents;";
			adminlevel = -1;
		};
		
		class ADP_MenuEvents2: ADPRscButtonMenu
		{
			idc = 25001;
			text = "Events 2"; 
			x = 0.3708 * safezoneW + safezoneX;
			y = 0.928 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Events 2";
			theAction = "[] spawn ADP_fnc_bwjgbwwqcnxmhsnptfpkrfnopvqpsdxwqpjwfyzjbctyjhijquqmuxj;";
			adminlevel = -1;
		};
		
		class ADP_BUTTONEXIT: ADPRscButtonMenu
		{
			idc = 1647;
			text = "X"; 
			x = 0.6855 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0229 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Close ADP";
			theAction = "closeDialog 0";
			adminlevel = -1;
		};
		
		
		class ADP_BUTTONCUSTOM: ADPRscButtonMenu
		{
			idc = 1801;
			text = "Keybinds";
			tooltip = "Öppnar en ruta med alla snabbknappar/keybinds som kan vara bra att ha för en trial mod/mod/admin.";
			theAction = "[] spawn ADP_fnc_deinpjsmwcivoipkcikuuaqcnfsarjagjkmizvhfchubgqrdreotsh;";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			adminlevel = 1;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM1: ADPRscButtonMenu
		{
			idc = 1802;
			text = "TP Map";
			tooltip = "Teleportera den spelare du har valt i listan och spelarens fordon till vart du vill på kartan";
			theAction = "[] call ADP_fnc_TeleOther";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			adminlevel = 1;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM2: ADPRscButtonMenu
		{
			idc = 1606;
			text = "TP to player"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Teleporterar dig till den spelare du har valt i listan";
			theAction = "[6001,1565,10] call ADP_fnc_dbfzrnbwtypadydlpbjgbclltombnslxivdaopcdeneanfzjxrfswssrigv";
			adminlevel = 1;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM3: ADPRscButtonMenu
		{
			idc = 1608;
			text = "TP player here"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Teleporterar spelaren som du har valt till dig eller in i ditt fordon";
			theAction = "[6001,1565,0] call ADP_fnc_zyuristwvudynpavxjrpyyekmscbxpfhtseecsfmmpbnltugso";
			adminlevel = 1;
			eventlevel = 1;
		};
			class ADP_BUTTONCUSTOM4: ADPRscButtonMenu
		{
			idc = 1609;
			text = "TP pos"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[] call ADP_fnc_dfjdrdeaqeqyrnvzjveynminlcizrymhhfmqrgspmidmhaniloywae";
			tooltip = "Teleportera den valda spelaren till kordinaterna som du anger i textfältet nedan, i formatet [x,y,z]. T.ex [3000,12000,3]";
			adminlevel = 1;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM5: ADPRscButtonMenu
		{
			idc = 1610;
			text = "God mode"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätter igång odödlighet";
			theAction = "_this call ADP_fnc_jkkddnacltodckdzzgkjgfebbsnalmbpviifjupjmbyhmivlbuxur";
			adminlevel = 1;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM6: ADPRscButtonMenu
		{
			idc = 1611;
			text = "Kill player"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Dödar valda spelaren";
			theAction = "_this call ADP_fnc_Kill";
			adminlevel = 3;
		};
		
		class ADP_BUTTONCUSTOM200: ADPRscButtonMenu
		{
			idc = 16200;
			text = ""; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 200";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM201: ADPRscButtonMenu
		{
			idc = 16201;
			text = ""; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 201";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM202: ADPRscButtonMenu
		{
			idc = 1740;
			text = ""; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 202";
			theAction = "";
			adminlevel = -2;
		};
		
		
		class ADP_BUTTONCUSTOM9: ADPRscButtonMenu
		{
			idc = 1803;
			text = "Map markers"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "För Trial mods+: Markerar alla spelare på kartan \n\nFör eventplanerare: Markerar alla spelare med safekeeping på kartan";
			theAction = "[] spawn ADP_fnc_mryrhitqjscpuwarpwrvxkjucemygyjvzglajewdlhjdmtkjjw";
			adminlevel = 2;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM10: ADPRscButtonMenu
		{
			idc = 1677;
			text = "Invisibility cloak"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Make yourself invisible with very haxy cloak";
			theAction = "[] call ADP_fnc_invisibility";
			adminlevel = 1;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM11: ADPRscButtonMenu
		{
			idc = 1678;
			text = "Revive"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Revive the selected player";
			theAction = "[] call ADP_fnc_Revive";
			adminlevel = 3;
		};
		
		class ADP_BUTTONCUSTOM12: ADPRscButtonMenu
		{
			idc = 1679;
			text = "Spawn item"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Öppna menyn för att spawna virtuella items (Y-items)";
			theAction = "[1] spawn life_fnc_srbdfueanvagnubeyqhkfmvjdoqmgvhysqdvicgwqfftvydqbbezas;";
			adminlevel = 3;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM13: ADPRscButtonMenu
		{
			idc = 1680;
			text = "Grant money"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Grant the selected player money, specify amount in the box below";
			theAction = "[] call ADP_fnc_Compensate";
			adminlevel = 2;
		};
		
		class ADP_BUTTONCUSTOM14: ADPRscButtonMenu
		{
			idc = 1681;
			text = "Remove money"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Remove money from the player's account, specify amount in the box below";
			theAction = "[] call ADP_fnc_owpiwbmvnbvidxfhwrewyngnbvmbhozcvozefhyclpfdtehoobrdxzixkud";
			adminlevel = 2;
		};
		
		class ADP_BUTTONCUSTOM15: ADPRscButtonMenu
		{
			idc = 1682;
			text = "Check info"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Check the player's info";
			theAction = "[] call ADP_fnc_checkMoney";
			adminlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM203: ADPRscButtonMenu
		{
			idc = 1741;
			text = "STÄNG AV databasen"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "ENDAST NÖDFALL, den här funktionen blockerar all kommunikation med databasen, ingenting kan alltså synkas över huvud taget. Den är tänkt för situationer där många spelare blir dödade av t.ex en fuskare eller liknande.";
			theAction = "[0,false] spawn ADP_fnc_tzsdippfdsuyxpvukmogbrkjelcpfguguaxelzkgqioxsrhcuovp;";
			adminlevel = 2;
		};
		
		class ADP_BUTTONCUSTOM204: ADPRscButtonMenu
		{
			idc = 1742;
			text = "SÄTT PÅ databasen"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Den är funktionen återställer kommunikationen med databasen efter att övanstående funktion har stängt av den";
			theAction = "[0,true] spawn ADP_fnc_tzsdippfdsuyxpvukmogbrkjelcpfguguaxelzkgqioxsrhcuovp;";
			adminlevel = 2;
		};
		
		class ADP_BUTTONCUSTOM205: ADPRscButtonMenu
		{
			idc = 1743;
			text = "Kick ALL"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = 'Den här funktionen kickar ALLA på servern utom dig själv, skriv "kick all" i övre fältet precis under knappen.';
			theAction = "[1] spawn ADP_fnc_tzsdippfdsuyxpvukmogbrkjelcpfguguaxelzkgqioxsrhcuovp;";
			adminlevel = 2;
		};
		
		
		class ADP_BUTTONCUSTOM7: ADPRscButtonMenu
		{
			idc = 1612;
			text = "Update"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Updates selected view settings";
			theAction = "_this call ADP_fnc_akqblvsefdeiblznlscrqptgqrycfaeoogxrywmtckrhcewwiod";
			adminlevel = -1;
		};
		
		class ADP_BUTTONKILL: ADPRscButtonMenu
		{
			idc = 1604;
			text = "Kannels spec mode"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Öppna kannels pro mega spectate-meny. Du tjänar både XP och pengar på att specca folk, det är dock strängt förbjudet att gå AFK i spec-menyn om du inte håller på med ett ärende i TS eller liknande.";
			theAction = "closeDialog 0; [4,(getPlayerUID player),'','Kannels spec mode','Enabled',profileName,'',str (getPos player)] remoteExec ['TON_fnc_cqbslmzhelexdchvshruhtirwniyhyywbybxhiltsdxdujmnhjuhnal',2]; [false,true] spawn ADP_fnc_mamjhsmxzowbovnweugxquapdoiogtxhekfppmvmuuqvcuxpoxtblrkl";
			adminlevel = 1;
			copleveltotal = 7;
			medicleveltotal = 4;
			reblevel = 8;
		};
		
		class ADP_BUTTONSPECTATE: ADPRscButtonMenu
		{
			idc = 1602;
			text = "Spectate 2"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Spectates selected player";
			theAction = "closeDialog 0; _this call ADP_fnc_zhqprspxyqtpzjdscpwqrjeilsfjdwdcbuqjhxdfkmolontjkk";
			adminlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM8: ADPRscButtonMenu
		{
			idc = 1613;
			text = "Spec mode";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Aktivera/deaktivera Arma spectator-läget, instruktion här: www.community.bistudio.com/wiki/Spectator_Mode";
			theAction = "[] call ADP_fnc_ubpwbjleddbbcimzumvxadmjwvatxsjuvlkgjpdbhrjuuzuoygtizms;";
			adminlevel = 3;
		};
		
		class ADP_BUTTONCUSTOM89: ADPRscButtonMenu
		{
			idc = 1689;
			text = "Grant XP";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.788 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Ge en person XP eller ta XP från personen, för att ta bort XP skriver du ett minustecken framför.";
			theAction = "[] call ADP_fnc_hswwaqlszqlajynjgpxyvmbxbulyrbrumzafojdicikipuckghyr;";
			adminlevel = 4;
		};
		
		class ADP_BUTTONCUSTOM90: ADPRscButtonMenu
		{
			idc = 1690;
			text = "TS pengar";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.755 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Ge personen $50 000 för att de har kommit in på TS (om de inte redan fått $50 000)";
			theAction = "[] call ADP_fnc_drdlhjweieavzwaxoelwyldyglguopseaobcixrijfiucmnbdamhabx;";
			adminlevel = -1;
		};
		
		class ADP_BUTTONEXEC: ADPRscButtonMenu
		{
			idc = 1601;
			text = "EXEC"; 
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.848 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Exekvera kommandot själv";
			theAction = "[0] call ADP_fnc_mrjvhujyjqzpkwsavpuccisfnbwleakyzrpfggieitzjqrlcpchegssb";
			adminlevel = 5;
			miscperm[] = {55};
		};

		class ADP_BUTTONGEXEC: ADPRscButtonMenu
		{
			idc = 16095;
			text = "GEXEC"; 
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Exekvera kommandot för alla spelare";
			theAction = "[3] call ADP_fnc_mrjvhujyjqzpkwsavpuccisfnbwleakyzrpfggieitzjqrlcpchegssb";
			adminlevel = 5;
			miscperm[] = {55};
		};
		
		class ADP_BUTTONREXEC: ADPRscButtonMenu
		{
			idc = 16096;
			text = "REXEC"; 
			tooltip = "Exekvera kommandot för den valda spelaren i listan";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.906 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[1] call ADP_fnc_mrjvhujyjqzpkwsavpuccisfnbwleakyzrpfggieitzjqrlcpchegssb";
			adminlevel = 5;
			miscperm[] = {55};
		};
		
		class ADP_BUTTONSEXEC: ADPRscButtonMenu
		{
			idc = 16097;
			text = "SEXEC"; 
			tooltip = "Exekvera kommandot på servern";
			x = 0.702 * safezoneW + safezoneX;
			y = 0.906 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[2] call ADP_fnc_mrjvhujyjqzpkwsavpuccisfnbwleakyzrpfggieitzjqrlcpchegssb";
			adminlevel = 5;
			miscperm[] = {55};
		};
		
		class ADP_BUTTONCLEAR: ADPRscButtonMenu
		{
			idc = 16105;
			text = "CLEAR"; 
			tooltip = "Rensa kommandofältet";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.934 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "ctrlSetText [1400, """"];";
			adminlevel = -1;
		};
	};
};
