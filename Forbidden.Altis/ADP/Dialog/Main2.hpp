
class ADPMain2
{
	idd = 6007;
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
			adminlevel = -2;
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
		
		class ADP_BUTTONEXTRA1: ADPRscButtonMenu
		{
			idc = 1601;
			text = "Belöning ärende"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.866 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = 'Belöna dig själv för ett utfört adminärende/supportärende, bedöm svårighetsgraden av ärendet enligt nedan. \n\nBelöningsgrader: \nTrial moderator: Basbelöning. \nModerator: 150% av basbelöningen. \nAdmin: 200% av basbelöningen. \n\nSvårighetsgrader för ärenden: \n1: Snabb fråga/ PLD transaktion/ kolla upp en regel (Upp till 2 min): 250 xp & $10 000 \n2: Forumet, svara på ban request/förslag eller liknande: 350 xp & $20 000 \n3: Normalärende (Rapportera spelare, ersättning eller liknande) (3-6 min): 500 xp & $40 000 \n4: Husproblem eller likvärdigt (6-14 min): 750 xp & $90 000 \n5: Komplicerat ärende, konflikt mellan gäng (Minst 15 minuter): 1500 xp & $250 000 \n6: Delas ut av admin vid speciella tillfällen';
			theAction = "[] call ADP_fnc_vsoucttboqxqscumwnjgfihliayixekbcjjzibheoxvpqygjikslbirtyvt;";
			adminlevel = 2;
			hide = 1;
		};
		
		class ADP_BUTTONEXTRA2: ADPRscButtonMenu
		{
			idc = 1602;
			text = "Belöning arbete"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Välj en person i listan att belöna för utfört arbete för serverns bästa (t.ex bygga baser, göra skins/ikoner eller skripta för servern). Ange tid (minuter) i vänstra fältet. \n\nOBS: Måste godkännas av Bryan eller Kannel. \n\nRate: 7500 xp & $300 000 per timme.";
			theAction = "[] call ADP_fnc_hntscidewsgxodtfqevfyagacssxadlfkfwzfxhfitfywqphmnkkkbjcbeu;";
			adminlevel = 5;
			hide = 1;
		};
		
		
		
		
		
		class ADP_BUTTONCUSTOM1: ADPRscButtonMenu
		{
			idc = 1611;
			text = "Jail"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt personen i apburen, när spelaren kommer ut igen så har hen kvar allt sitt gear. Ange tid i antal minuter med vänstra textfältet nedan (t.ex 30) eller 'perm' utan appostroferna. Tiden tickar bara när spelaren är aktiv (timern stannar om spelaren går AFK)";
			theAction = "[1] call ADP_fnc_wdouajxvifaqhdylzqkdknninwfxlbknxsaspdrwoteoiwacirtzmexaka";
			adminlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM2: ADPRscButtonMenu
		{
			idc = 1612;
			text = "Jail and strip"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt personen i apburen och ta spelarens gear och items. Ange tid i antal minuter i vänstra textfältet nedan (t.ex 30) eller 'perm' utan appostrofer. OBS: Använd endast denna när personen skulle ha förlorat sitt gear om hen följde reglerna (t.ex lobbyhopp i fight) eller när personen har gear som denne inte ska ha.";
			theAction = "[0] call ADP_fnc_wdouajxvifaqhdylzqkdknninwfxlbknxsaspdrwoteoiwacirtzmexaka";
			adminlevel = 3;
		};
		
		class ADP_BUTTONCUSTOM3: ADPRscButtonMenu
		{
			idc = 1613;
			text = "Jail release"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Släpp personen fri från apburen/fängelset (Om personen sitter i det vanliga fängelset så blir hen frisläppt därifrån istället).";
			theAction = "[2] call ADP_fnc_wdouajxvifaqhdylzqkdknninwfxlbknxsaspdrwoteoiwacirtzmexaka";
			adminlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM4: ADPRscButtonMenu
		{
			idc = 1614;
			text = "Mute Adminjail"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Tryck för att toggla mute på adminfängelset, så dom kan prata och skriva (default av).";
			theAction = "[] spawn ADP_fnc_ffhpedvskbfazvhlgohxmfunhkzeescgcjdbckacvujxynrlihtnm";
			adminlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM5: ADPRscButtonMenu
		{
			idc = 1615;
			text = ""; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 5";
			
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
			tooltip = "Oanvänd knapp 6";
			
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
			tooltip = "Oanvänd knapp 7";
			
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM8: ADPRscButtonMenu
		{
			idc = 1618;
			text = "Mute player"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = 'Muta spelaren från att skriva chattmeddelanden, skriv antal minuter (t.ex 60) i vänsta skrivfältet eller skriv "perm" utan citattecken för permanent mute. Tiden räknas som bantider, oavsett om spelaren är inne eller inte.';
			theAction = "[] spawn ADP_fnc_vxymzczrzsbxbdzovlvxhpttcsieagwtfenbrvghdnbvtssvvvue;";
			adminlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM9: ADPRscButtonMenu
		{
			idc = 1619;
			text = "Unmute player"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Unmuta spelaren";
			theAction = "[false] spawn ADP_fnc_vxymzczrzsbxbdzovlvxhpttcsieagwtfenbrvghdnbvtssvvvue";
			adminlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM10: ADPRscButtonMenu
		{
			idc = 48941;
			text = ""; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 10";
			
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM11: ADPRscButtonMenu
		{
			idc = 48942;
			text = "Strip player"; 
			x = 0.407 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Deletes all the player's gear except map, compass and watch.";
			theAction = "[6001,1565] call ADP_fnc_msjvlcnadkexsomjvuufmlutzziaptydsagmlkwezdpezdqbni";
			adminlevel = 3;
		};
		
		
		
		
		
		class ADP_BUTTONCUSTOM20: ADPRscButtonMenu
		{
			idc = 1620;
			text = "Sync all"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Synka all data från en spelare (gear,pengar,licenser,loadouts etc) till databasen direkt och rensa synk-cachen (så allt hämtas från databasen när spelaren loggar in igen). Välj spelare i listan eller skriv spelarens playerid i vänstra fältet.";
			theAction = "[] call ADP_fnc_oztzqimnhzjxwpxbqhacmftqmekvhckqhlhsrhqathcbsawccuwoiuwffdu";
			adminlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM21: ADPRscButtonMenu
		{
			idc = 1621;
			text = "Vote day"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Starta en omröstning för dagtid på servern, om tillräckligt många spelare röstar så blir det dag.";
			theAction = "[true] spawn life_fnc_voteDay;";
			adminlevel = 4;
		};
		
		class ADP_BUTTONCUSTOM22: ADPRscButtonMenu
		{
			idc = 1622;
			text = "Spärra område"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Spärra av ett område för alla spelare som INTE har safekeeping, spelare som bryter mot avspärrningen får automatiskt en varning och hamnar sedan i adminjail. \n\nOmrådet centreras runt din position, ange radie i vänstra fältet. \n\nFör att ta bort ALLA avspärrade områden utom dom som hör till autoevents, skriv 'ta bort' i vänstra fältet utan appostrofer.";
			theAction = "[] call ADP_fnc_azaiwvdhlzsihimcdrpkrqtumisgrgelyazrxdazkgijfzcjzfpgqweqaaqj;";
			adminlevel = 4;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM23: ADPRscButtonMenu
		{
			idc = 1623;
			text = "Neochori"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Toggla vem som kontrollerar Neochori (rebellerna eller poliserna).";
			theAction = "[] call ADP_fnc_kalochori;";
			adminlevel = 4;
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
			text = ""; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Oanvänd knapp 25";
			
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
			
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM27: ADPRscButtonMenu
		{
			idc = 1627;
			text = "Hitta fordon"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "TPa dig själv till ett fordon, ange fordonets regplåt (plate) i vänstra fältet ELLER fordonets VID i högre fältet.";
			theAction = "[] call ADP_fnc_cnvjukewwuqbrpsgwobvrwoacglaxkgiwotdrtplohgmaleheoitln";
			adminlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM28: ADPRscButtonMenu
		{
			idc = 1628;
			text = "Kameleonten"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Välj en spelare i listan och kopiera hans gear till dig själv (safekeeping slås automatiskt igång om du inte redan har safekeeping på).";
			theAction = "[] spawn ADP_fnc_jooggfuzhtstifvzpnqdhfawfrtuzvtvzqcsumyuvmzahladkbcifai";
			adminlevel = 1;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM29: ADPRscButtonMenu
		{
			idc = 1629;
			text = "Arsenal"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Starta arsenalen";
			theAction = "[] spawn ADP_fnc_cjxycuypeewwhjvqyvwpmgzhzstqrulfxfqiupiyokbbneukiupkntfflwkr;";
			adminlevel = 1;
			eventlevel = 1;
		};
		
		class ADP_BUTTONCUSTOM30: ADPRscButtonMenu
		{
			idc = 1630;
			text = "Advanced spec"; 
			x = 0.507 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Aktivera/deaktiver det avancerade spectator-läget.";
			theAction = "closeDialog 0; [player] execVM 'spectator\specta.sqf';";
			adminlevel = 5;
		};
		
		
		
		
		
		class ADP_BUTTONCUSTOM40: ADPRscButtonMenu
		{
			idc = 1640;
			text = "Restart timer"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätter tiden för restart varningar (statusbaren och meddelanden på skärmen). Använd formatet [h,m,s] i vänstra fältet. \n\nOm det är t.ex är 2 timmar och 6 minuter kvar så skriver du [2,6,0] med hakparenteserna.";
			theAction = "[] call ADP_fnc_tuuaujhiukcjrxldxlfytnwykwmxhswrzleaxtdywsehjkckriwzkbll;";
			adminlevel = 4;
		};
		
		class ADP_BUTTONCUSTOM41: ADPRscButtonMenu
		{
			idc = 1641;
			text = "Nytt mission"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Indikera att det är ny missionfil efter restart, så adminmeddelande automatiskt skickas ut om detta 3 min innan restart.";
			theAction = "[] spawn ADP_fnc_nveixbzpaoipikfwydypdxpigoocuzsgehbujdavmtjearjjxasdcqg;";
			adminlevel = 4;
		};
		
		class ADP_BUTTONCUSTOM42: ADPRscButtonMenu
		{
			idc = 1642;
			text = "Debugging"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Aktivera/deaktivera debugging, spammar ut meddelanden här o var";
			theAction = "life_debugging = !life_debugging; if(life_debugging) then {hint 'debugging aktiverat'} else {hint 'debugging avstängt'};";
			adminlevel = 5;
		};
		
		class ADP_BUTTONCUSTOM43: ADPRscButtonMenu
		{
			idc = 1643;
			text = "Undersökning"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Starta/uppdatera/avsluta en undersökning eller en upplysning som visas för spelare när de loggar in. Om du vill skapa en undersökning så skriver du frågan och svarsalternativen i databasen och använder sedan något av följande kommandon i vänstra fältet: \n\nStarta ny - Avslutar undersökning om en undersökning pågår, skapar sedan en ny undersökning med värden från tabellen 'survey' i databasen. \nUppdatera - Uppdaterar frågorna från databasen (tabellen 'survey') till servern utan att påverka inkomna svar. \nAvsluta - Avslutar den pågående undersökningen, sparar undan resultaten i en ny tabell i databasen och wipar 'survey'-tabellen.";
			theAction = "[] call ADP_fnc_xenjypgrhzxzafdlhuxpsfjxainaxrqyuaslraktybjztusahnlbyzaj;";
			adminlevel = 4;
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
			
			adminlevel = -2;
		};
		
		class ADP_BUTTONCUSTOM46: ADPRscButtonMenu
		{
			idc = 1646;
			text = "Donator VIP"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt valda spelarens donatorlevel till VIP (4)";
			theAction = "[3,4] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 3;
		};
		
		class ADP_BUTTONCUSTOM47: ADPRscButtonMenu
		{
			idc = 16447;
			text = "Donator 3"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt valda spelarens donatorlevel till 3";
			theAction = "[3,3] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 3;
		};
		
		class ADP_BUTTONCUSTOM48: ADPRscButtonMenu
		{
			idc = 1648;
			text = "Donator 2"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt valda spelarens donatorlevel till 2";
			theAction = "[3,2] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 3;
		};
		
		class ADP_BUTTONCUSTOM49: ADPRscButtonMenu
		{
			idc = 1649;
			text = "Donator 1"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.825 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sätt valda spelarens donatorlevel till 1";
			theAction = "[3,1] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 3;
		};
		
		class ADP_BUTTONCUSTOM50: ADPRscButtonMenu
		{
			idc = 1650;
			text = "Donator remove"; 
			x = 0.607 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Ta bort spelarens donatorstatus";
			theAction = "[3,0] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 3;
		};
		
	};
};