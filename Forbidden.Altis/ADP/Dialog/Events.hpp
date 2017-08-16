
class ADPEvents
{
	idd = 6008;
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
			adminlevel = -2;
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
			autocomplete = "";
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
			text = "Safekeeping"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Aktivera/deaktivera safekeeping-läget för den markerade spelaren. Välj lag i högra fältet (röd, blå eller grön) samt välj loadout om du vill, mellan: \n\ndefault \npolis \npolis_mki \nrebel \nrebel_mk14 \nrebel_nyman \ncarbine \nmxc \nmk18 \nmk18_silencer \nmk20 \nmk200 \nsting \npdw \n4-five \nrook \nzubr \nrpg \npilot \ninsats \ninsats_mar \nheavygunner \ncyrus \ngröngöling \nlynx \nspotter \ntaliban \ntaliban_norpg \ndiver \nblixten \nevent \nadmin";
			theAction = "[0] call ADP_fnc_SafeKeeping";
			adminlevel = 3;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM2: ADPRscButtonMenu
		{
			idc = 1612;
			text = "Safekeeping 50m"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Samma sak som default safekeeping skriptet, men detta skript gäller för alla spelare inom 50 meter utom dig själv";
			theAction = "[1] call ADP_fnc_SafeKeeping";
			adminlevel = 3;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM3: ADPRscButtonMenu
		{
			idc = 1613;
			text = "Safekeeping av"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Avaktivera safekeeping för den markerade spelaren i listan. För att deaktivera safekeeping för flera personer, skriv en radie i vänstra fältet (räknat från den spelare du väljer i listan), om du anger -1 så avaktiveras safekeeping för alla spelare på servern.";
			theAction = "[2] call ADP_fnc_SafeKeeping";
			adminlevel = 3;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM4: ADPRscButtonMenu
		{
			idc = 1614;
			text = "Sätt loadout"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Denna funktion sparar gearet som du har på dig nu som en safekeeping loadout. Döp loadoutet till något med vänstra fältet. Sedan kan du dela ut denna loadout som vanligt, skriv bara in namnet på loadoutet som du har skapat istället för t.ex 'Polis', 'mxc' eller liknande.";
			theAction = "[] call ADP_fnc_ovwjwsezykkotqstwpxtlrmqwlutnzstfcvbljsfbrpswvenzpan";
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
			text = "Safezones"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt safezones runt alla safekeeping-spawnpunkter, ange radien i vänstra fältet (0 för att stänga av safezones).";
			theAction = "[] call ADP_fnc_safeZones;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM7: ADPRscButtonMenu
		{
			idc = 1617;
			text = "Spawnpunkter"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt spawnpunkter för olika lag och se avstånden mellan dig och spawnpunkterna";
			theAction = "[] call ADP_fnc_spawnpoints";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM8: ADPRscButtonMenu
		{
			idc = 1618;
			text = "Mass teleport"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Teleportera alla spelare med safekeeping, eller bara vissa till deras spawnpunkter. Skriv i vänstra fältet vilka du vill teleportera, välj mellan: \n\nalla (med safekeeping) \ngenerell (alla med safekeeping som ej är med i ett lag) \nblå (hela blåa laget) \nröd (hela röda laget) \ngrön (hela gröna laget) \n\nVanligtvis teleporteras alla till sina spawnpunkter, men om du skriver 'hit' i högra fältet blir alla som du valt teleporterade till dig själv istället.";
			theAction = "[] call ADP_fnc_sopwnhwiiwjqtyxzntyurronnrvgwovwplpuwvgpemgkgvajloqcl";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM9: ADPRscButtonMenu
		{
			idc = 1619;
			text = "1st person"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Tvinga alla spelare med safekeeping att vara i första person";
			theAction = "[] call ADP_fnc_kwaqfjcxmqdmlcgwcrkhaxaiztrhnjyvafvypyjwnbhjlfvmxjma";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM10: ADPRscButtonMenu
		{
			idc = 48941;
			text = "God mode"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Ge alla spelare med safekeeping god mode på dem och deras fordon.";
			theAction = "[] call ADP_fnc_massGodMode";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM11: ADPRscButtonMenu
		{
			idc = 48942;
			text = "Turbo"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt turbo för alla spelare med safekeeping aktiverat. Ange boost-faktor i vänstra fältet och maxfart (frivilligt) i högra fältet. 0 i vänstra fältet för att avaktivera.";
			theAction = "[] call ADP_fnc_teqooaaldoironkujsmlcpbmhdezhbycecrlqitrdhsaqnvkzrr";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		
		
		
		
		class ADP_BUTTONCUSTOM20: ADPRscButtonMenu
		{
			idc = 1620;
			text = "Markera objekt"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Markera det objekt du siktar på (människa eller fordon) med en röd cirkel på kartan. Ange text i vänsta fältet och radie i högra fältet. För att markera flaggan skriver du 'flaggan' i vänstra fältet och radie i högra. För att markera dig själv, använd formatet 'jag: TextHär' i vänsta fältet";
			theAction = "[] spawn ADP_fnc_ssbwchpyelmtjzffvvfngpluxublvjyhwsxsbkgwfliihgscuv";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM21: ADPRscButtonMenu
		{
			idc = 1621;
			text = "Radera alla marks"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Radera alla röda cirklar som är utsatta av admins";
			theAction = "[player,""deleteAllMarkers""] remoteExec [""TON_fnc_mapmarker"",2]";
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
			
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM23: ADPRscButtonMenu
		{
			idc = 1623;
			text = "Dela lag 200m"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Dela upp alla spelare inom 200 meter som har safekeeping aktiverat i 2 eller 3 lag med lika många spelare i varje. Dom måste alltså redan ha safekeeping för att tilldelas ett lag. Välj antal lag i vänstra fältet (2 eller 3)";
			theAction = "[] spawn ADP_fnc_rutonjhbycuyhuvjwgepefdemtzwaxtrotqrfnrdajolvlsfwlty";
			adminlevel = 4;
			eventlevel = 1;
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
			
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM25: ADPRscButtonMenu
		{
			idc = 1625;
			text = "Skapa event"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Skapa ett event (så att folk kan trycka F8 för att TPas till plats och få Safekeeping), välj event bland: \n\ncustom \nhopp_1 \nknockout (välj storlek på plattformen med högra fältet, dvs antalet block i bredd. Mellan 3 och 30. Fordon och bredd kan ändras med 'Pausa event'-knappen) \nkoth (King of the Hill)";
			theAction = "[0] spawn ADP_fnc_kluqgmutcadpktqapkxkdvxntfaxxzfvmgdwvmtamvpyqowucymji";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM26: ADPRscButtonMenu
		{
			idc = 1626;
			text = "Starta event"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Starta eventet. Ange tid till start i vänstra fältet (minuter), default är 10 sekunder. En nedräkning startar varefter eventet aktiveras (t.ex bomber aktiveras). Ange -1 i vänstra fältet för att avbryta nedräkningen!";
			theAction = "[1] spawn ADP_fnc_kluqgmutcadpktqapkxkdvxntfaxxzfvmgdwvmtamvpyqowucymji";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM27: ADPRscButtonMenu
		{
			idc = 1627;
			text = "Pausa event"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Pausa/ avbryt eventet. Deaktivera t.ex bomber och teleportera alla spelare till start för avslutning eller för att starta en ny runda. \n\nFör knockout-eventet: Ange klassnamn för ett fordon i vänstra fältet för att sätta det till nya eventfordonet och/eller ange ny bredd (i antal block) i högra fältet (mellan 3 och 30).";
			theAction = "[2] spawn ADP_fnc_kluqgmutcadpktqapkxkdvxntfaxxzfvmgdwvmtamvpyqowucymji";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM28: ADPRscButtonMenu
		{
			idc = 1628;
			text = "Avsluta event"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Avslutar eventet helt, kickar alla spelare (skickar dom till spawnmenyn).";
			theAction = "[3] spawn ADP_fnc_kluqgmutcadpktqapkxkdvxntfaxxzfvmgdwvmtamvpyqowucymji";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM29: ADPRscButtonMenu
		{
			idc = 1629;
			text = "Lås event"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Lås elelr lås upp event, så att man bara kan joina med kick/invite knappen, inte F8";
			theAction = "[5] spawn ADP_fnc_kluqgmutcadpktqapkxkdvxntfaxxzfvmgdwvmtamvpyqowucymji";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM30: ADPRscButtonMenu
		{
			idc = 1630;
			text = "Kick/invite"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Välj en spelare i listan till vänster, om spelaren är i ett event så blir han bannad från events till server restart, annars joinar han/hon eventet.";
			theAction = "[4] spawn ADP_fnc_kluqgmutcadpktqapkxkdvxntfaxxzfvmgdwvmtamvpyqowucymji";
			adminlevel = 1;
			eventlevel = 1;
		};
		
		
		
		
		
		class ADP_BUTTONCUSTOM40: ADPRscButtonMenu
		{
			idc = 1640;
			text = ""; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 40";
			theAction = "";
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM41: ADPRscButtonMenu
		{
			idc = 1641;
			text = "Bygg grejer"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Bygg upp/radera en tillfällig bana/arena. skriv in numret på den bana du vill bygga/radera i vänstra fältet.\n \n1: Saltfältsrace 1 av Nilsson \n2: Arena på saltfältet av Oskar \n3: Oskars andra paintball på grid 215108 \n4: Arenan i Syrta \n5: Turneringsarenor på saltfältet av Krabban \n6: Plattform vid undervattenstaden \n7: Stadsarena på saltfältet \n9: Liten arena i vattnet, grid 254248";
			theAction = "[] call ADP_fnc_lcqxpjbrgtkjpegdbkpcfvbsyeljuhmvagsnzzebohyufohynvf;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM42: ADPRscButtonMenu
		{
			idc = 1642;
			text = "Sätt maxhöjd"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt maxhöjd som spelare med safekeeping kan flyga på i helis/flygplan, om de flyger över denna höjd så trycks de neråt";
			theAction = "[] call ADP_fnc_ubelirpycifyyoypisvnlktuhfbhefuiuybvapxesnlqpatzvumld;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM43: ADPRscButtonMenu
		{
			idc = 1643;
			text = "TP flagga"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Ta flaggan ifrån eventuell flaggbärare och teleportera flaggan till din nuvarande position";
			theAction = "[] spawn ADP_fnc_lqhyplpswsoqfnxmlcagclnadgaftswsdwxwzzinukawzpvnpvvgpsisstdb;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM44: ADPRscButtonMenu
		{
			idc = 1644;
			text = "Sätt radie"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt radie för eventet, ange tid (minuter) i vänstra fältet och nya radien i högra fältet. Radien gäller från tiden du anger.";
			theAction = "[6] call ADP_fnc_kluqgmutcadpktqapkxkdvxntfaxxzfvmgdwvmtamvpyqowucymji";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM45: ADPRscButtonMenu
		{
			idc = 1645;
			text = "Sätt radie 2"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Ändra radie för eventet över tid. Ange tid (minuter) i vänstra fältet och radien i högra fältet. Radien ändras varje sekund tills den nått nya radien.";
			theAction = "[8] call ADP_fnc_kluqgmutcadpktqapkxkdvxntfaxxzfvmgdwvmtamvpyqowucymji";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM46: ADPRscButtonMenu
		{
			idc = 1646;
			text = "Mute event"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Muta eventet så att endast eventplanerare och trial mod+ kan prata in-game";
			theAction = "[7] spawn ADP_fnc_kluqgmutcadpktqapkxkdvxntfaxxzfvmgdwvmtamvpyqowucymji";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM47: ADPRscButtonMenu
		{
			idc = 16447;
			text = "Nästa set"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Välj nästa gearset som medlemmar i custom-event kommer få när de respawnar efter att ha dött eller joinar eventet. Definera safekeeping-settet i vänstra fältet, om du lämnar den blank så spawnar alla med samma gear de hade innan de dog";
			theAction = "[] spawn ADP_fnc_ojezcjkjyzvzppnjagjoymbqsdatstlufjkbqrgnyurbcyoayawlzqgjlcmb";
			adminlevel = 4;
			eventlevel = 1;
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
			
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM49: ADPRscButtonMenu
		{
			idc = 1649;
			text = "Oändligt ammo"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt på/stäng av oändligt ammo för alla spelare som har safekeeping aktiverat.";
			theAction = "[] spawn ADP_fnc_bevdzzvevgojwyhygwnqsywpujebygifsilhphuamorikrkgrwayck;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM50: ADPRscButtonMenu
		{
			idc = 1650;
			text = "Scoreboard"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt på/stäng av poängtavlan, varje gång en spelare i ett event blir dödad så får alla upp den uppdaterade poängtavlan";
			theAction = "[] call ADP_fnc_ahixegmvzkfwsghdykslyuhgicpbxpwshndpibajyjnpqyrexuvcyw;";
			adminlevel = 4;
			eventlevel = 1;
		};
	};
};