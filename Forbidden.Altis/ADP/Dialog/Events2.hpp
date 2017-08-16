
class ADPEvents2
{
	idd = 6009;
	movingEnable = 0;
	onLoad = "";
	controlsBackground[] = 
	{
	ADP_PICTUREBACK1,
	};
	
	class ADP_PICTUREBACK1: ADPRscPicture
	{
		idc = 1200;
		text = "ADP\Dialog\ADPImage.paa";
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.505313 * safezoneW;
		h = 0.781 * safezoneH;
	};	
	
	class Controls 
	{
		class ADP_BUTTONEXIT26: ADPRscButtonMenu
		{
			idc = 2;
			text = "X"; 
			x = 0.6855 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0229 * safezoneW;
			h = 0.033 * safezoneH;
			theAction = "closeDialog 0; closeDialog 0;";
			adminlevel = -1;
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
			theAction = "[] spawn ADP_fnc_adpMain;";
			adminlevel = -1;
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
			adminlevel = -2;
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
		
		class ADP_EXEC: ADPRscEdit 
		{
			idc = 1400;
			style = ST_LEFT+ST_FRAME;
			x = 0.4 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyDown = "_this call ADP_fnc_uvhljrlcwtqtslxtcbwevzcfhvgznojcwerdteeokwqgdnkhnzfnjfcgztn";
		};
		
		class ADP_EXEC2: ADPRscEdit 
		{
			idc = 1450;
			style = ST_LEFT+ST_FRAME;
			x = 0.55 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyDown = "_this call ADP_fnc_uvhljrlcwtqtslxtcbwevzcfhvgznojcwerdteeokwqgdnkhnzfnjfcgztn";
		};
		
		class ADP_BUTTONEXTRA1: ADPRscButtonMenu
		{
			idc = 1601;
			text = ""; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.866 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "extra 1";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONEXTRA2: ADPRscButtonMenu
		{
			idc = 1602;
			text = ""; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "extra 2";
			theAction = "";
			adminlevel = -2;
		};
		
		
		
		
		
		class ADP_BUTTONCUSTOM1: ADPRscButtonMenu
		{
			idc = 1611;
			text = "Havet stormar"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Aktivera/avaktivera hela havet stormar på det fordon du sitter i eller det fordon som du siktar på (måste vara inom 15 meter).";
			theAction = "[] spawn ADP_fnc_fyjcukaqpuuouyftidaepyeirwnjmbiibezknqnzahgplqqyygteoz";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM2: ADPRscButtonMenu
		{
			idc = 1612;
			text = "Purge"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Starta purge-eventet, ange tid till start (minuter) i vänstra fältet för att starta nedräkningen. För att stänga av eventet, ange -1 i vänstra fältet.";
			theAction = "[] call ADP_fnc_vnpgghxwzmcwdromgvqloxumkgtxiblwmlwrvswubymguhsrrlx;";
			adminlevel = 4;
		};
		
		class ADP_BUTTONCUSTOM3: ADPRscButtonMenu
		{
			idc = 1613;
			text = "Bomber"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Aktivera bomber som släpps inom ett område. Välj område i vänstra fältet från nedanstående alternativ och ange hur många bomber som ska släppas per sekund i högra fältet. Alternativt ange radie i vänstra fältet så släpps bomberna i den radien kring din nuvarande position. \n\nsalt";
			theAction = "[] spawn ADP_fnc_gwprcznxrllruuqxixtzomazxesymymnmmuoldlserezpkufhlzn;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM4: ADPRscButtonMenu
		{
			idc = 1614;
			text = "Självmordsväst"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Ställ in hur självmordsvästen får användas av spelare med safekeeping, spelare utan safekeeping påverkas ej. \n\nVälj läge i vänstra fältet: \n0: Dödmansgrepp tillåts ej, väst kan triggas maneullt (default) \n1: Dödmansgrepp valfritt, väst kan triggas manuellt \n2: Dödmansgrepp valfritt, väst kan INTE triggas manuellt \n3: Dödmansgrepp påtvingat, väst kan triggas manuellt \n4: Dödmansgrepp påtvingat, bomb kan INTE triggas manuellt";
			theAction = "[] spawn ADP_fnc_xeloxdtrpvwujdvxhvsutyisgktkshkcffwbtyfxvxlipporrklhuv;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM5: ADPRscButtonMenu
		{
			idc = 1615;
			text = ""; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 15";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM6: ADPRscButtonMenu
		{
			idc = 1616;
			text = ""; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 16";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM7: ADPRscButtonMenu
		{
			idc = 1617;
			text = ""; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 17";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM8: ADPRscButtonMenu
		{
			idc = 1618;
			text = ""; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 18";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM9: ADPRscButtonMenu
		{
			idc = 1619;
			text = ""; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 19";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM10: ADPRscButtonMenu
		{
			idc = 48941;
			text = ""; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 48941";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM11: ADPRscButtonMenu
		{
			idc = 48942;
			text = "KOTH area"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt King of the Hill cirkeln. Ange radie i högra fältet.";
			theAction = "[] call ADP_fnc_vnjwvbjberbhtvydmajfecektcjqjnmgnnghvvxxbjwxwoxqyjbsxyfr;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		
		
		
		
		class ADP_BUTTONCUSTOM20: ADPRscButtonMenu
		{
			idc = 1620;
			text = "Auto events"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Öppnar en meny där du kan välja bland många förprogrammerade automatiska events. Dom här eventen sköter sig helt själva (skickar ut meddelanden själv, startar eventet själv, delar upp lag, delar ut priser osv). Det enda du behöver tänka på är att låsa banken och rebellernas vapenförråd om det är lämpligt.";
			theAction = "[0] spawn life_fnc_srbdfueanvagnubeyqhkfmvjdoqmgvhysqdvicgwqfftvydqbbezas";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM21: ADPRscButtonMenu
		{
			idc = 1621;
			text = "Event loadout"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Med den här funktionen kan du välja vilken safekeeping-loadout som ska användas i auto-event (resettas efter varje autoevent). Skriv in den safekeeping-loadout du vill använda i vänstra fältet (Fungerar även med custom loadouts).";
			theAction = "[] call ADP_fnc_nulnfqlwnrozuaurhqjomkkqxtnehduqkrqkiscsnbfiesaakzi;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM22: ADPRscButtonMenu
		{
			idc = 1622;
			text = ""; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 22";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM23: ADPRscButtonMenu
		{
			idc = 1623;
			text = ""; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 23";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM24: ADPRscButtonMenu
		{
			idc = 1624;
			text = ""; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 24";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM25: ADPRscButtonMenu
		{
			idc = 1625;
			text = ""; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 25";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM26: ADPRscButtonMenu
		{
			idc = 1626;
			text = ""; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 26";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM27: ADPRscButtonMenu
		{
			idc = 1627;
			text = ""; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 27";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM28: ADPRscButtonMenu
		{
			idc = 1628;
			text = ""; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 28";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM29: ADPRscButtonMenu
		{
			idc = 1629;
			text = ""; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 29";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM30: ADPRscButtonMenu
		{
			idc = 1630;
			text = "Eventinfo"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Visa diverse info om det nuvarande eventet (olika kordinater osv)";
			theAction = "[] call ADP_fnc_seovdtyhshlamjlwsgkgmuyomnddxduaprmfmihxrpijymulnzcfgtyhesve";
			adminlevel = 1;
			eventlevel = 1;
		};
		
		
		
		
		
		class ADP_BUTTONCUSTOM40: ADPRscButtonMenu
		{
			idc = 1640;
			text = "Lås bank o förråd"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Toggla låset på banken och rebellernas vapenförråd. Detta gör så att ingen kan råna banken tills en admin låser upp igen.";
			theAction = "[0] call ADP_fnc_jayahchhrowpaagvxqsfyyrcnifeyynxmluqrxpwutjirwpxjjtpgr;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM41: ADPRscButtonMenu
		{
			idc = 1641;
			text = "Lås gängtillhåll"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Toggla låset på banken och rebellernas vapenförråd. Detta gör så att ingen kan råna banken tills en admin låser upp igen.";
			theAction = "[1] call ADP_fnc_jayahchhrowpaagvxqsfyyrcnifeyynxmluqrxpwutjirwpxjjtpgr;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM42: ADPRscButtonMenu
		{
			idc = 1642;
			text = ""; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 42";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM43: ADPRscButtonMenu
		{
			idc = 1643;
			text = ""; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 43";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM44: ADPRscButtonMenu
		{
			idc = 1644;
			text = ""; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 44";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM45: ADPRscButtonMenu
		{
			idc = 1645;
			text = ""; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 45";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM46: ADPRscButtonMenu
		{
			idc = 1646;
			text = ""; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 46";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM47: ADPRscButtonMenu
		{
			idc = 16447;
			text = ""; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 447";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM48: ADPRscButtonMenu
		{
			idc = 1648;
			text = ""; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 48";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM49: ADPRscButtonMenu
		{
			idc = 1649;
			text = ""; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 49";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM50: ADPRscButtonMenu
		{
			idc = 1650;
			text = ""; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 50";
			theAction = "";
			adminlevel = -2;
		};
	};
};