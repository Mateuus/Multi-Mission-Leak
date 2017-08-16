
class ADPRanks
{
	idd = 6005;
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
			theAction = "closeDialog 0";
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
			adminlevel = -2;
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
		
		class ADP_BUTTONKILL: ADPRscButtonMenu
		{
			idc = 1604;
			text = "List cops"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Lista alla poliser (offline och online), ändra de som ska ändras";
			theAction = "[true,[],0] call ADP_fnc_listAll";
			adminlevel = 4;
			coplevel = 8;
			miscperm[] = {70};
		};
		
		class ADP_BUTTONLISTMEDICS: ADPRscButtonMenu
		{
			idc = 1602;
			text = "List medics"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Lista alla sjukvårdare (offline och online), ändra de som ska ändras";
			theAction = "[true,[],1] call ADP_fnc_listAll";
			adminlevel = 4;
			mediclevel = 5;
			miscperm[] = {72};
		};
		
		class ADP_BUTTONLISTREB: ADPRscButtonMenu
		{
			idc = 1623;
			text = "List rebels"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.909 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Lista alla rebeller (offline och online), ändra de som ska ändras";
			theAction = "[true,[],2] call ADP_fnc_listAll";
			adminlevel = 4;
			reblevel = 6;
			miscperm[] = {71};
		};
		
		class ADP_BUTTONCUS123123M: ADPRscButtonMenu
		{
			idc = 1603;
			text = "Polischef"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[0,8] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			coplevel = 8;
		};
		
		class ADP_BUTTONCUST123123335657M: ADPRscButtonMenu
		{
			idc = 1698;
			text = "Polisdirektör"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[0,7] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			coplevel = 8;
		};
		
		class ADP_BUTTONCUSTOM: ADPRscButtonMenu
		{
			idc = 1699;
			text = "Polismästare"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[0,6] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			coplevel = 8;
		};
		
		class ADP_BUTTONCUSTOM2: ADPRscButtonMenu
		{
			idc = 1606;
			text = "Poliskommisarie"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[0,5] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			coplevel = 8;
		};
		
		class ADP_BUTTONCUSTOM3: ADPRscButtonMenu
		{
			idc = 1608;
			text = "Polisinspektör"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[0,4] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			coplevel = 8;
		};
		class ADP_BUTTONCUSTOM4: ADPRscButtonMenu
		{
			idc = 1609;
			text = "Poliskonstapel"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[0,3] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			coplevel = 8;
		};
		
		class ADP_BUTTONCUSTOM5: ADPRscButtonMenu
		{
			idc = 1610;
			text = "Polisassistent"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[0,2] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			coplevel = 8;
		};
		
		class ADP_BUTTONCUSTOM6: ADPRscButtonMenu
		{
			idc = 1611;
			text = "Polisaspirant"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[0,1] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			coplevel = 8;
			miscperm[] = {70};
		};
		
		class ADP_BUTTONCUSTOM34: ADPRscButtonMenu
		{
			idc = 1612;
			text = "Polis Kick"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[0,0] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			coplevel = 8;
			miscperm[] = {70};
		};
		
		class ADP_BUTTONCUSTOM1232: ADPRscButtonMenu
		{
			idc = 1780;
			text = "Polis recruiter"; 
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Lägg till eller ta bort personen som polisrekryterare";
			theAction = "['life_coprecruiter'] call ADP_fnc_phguesyitcbgbassgsztocpkgeruikmhhezgnabxemcvqlkbognxwzwoo";
			adminlevel = 4;
			coplevel = 8;
		};
		
		class ADP_BUTTONCUSTOM9: ADPRscButtonMenu
		{
			idc = 1676;
			text = "Chief Medic"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set player to the chief medic rank";
			theAction = "[1,5] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			mediclevel = 5;
		};
		
		class ADP_BUTTONCUSTOM10: ADPRscButtonMenu
		{
			idc = 1677;
			text = "Vice-chief Medic"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set player to the vice chief medic rank";
			theAction = "[1,4] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			mediclevel = 5;
		};
		
		class ADP_BUTTONCUSTOM11: ADPRscButtonMenu
		{
			idc = 1678;
			text = "Medic"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set player to the medic rank";
			theAction = "[1,3] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			mediclevel = 4;
		};
		
		class ADP_BUTTONCUSTOM12: ADPRscButtonMenu
		{
			idc = 1679;
			text = "Part-time Medic"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set player to the part-time medic rank";
			theAction = "[1,2] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			mediclevel = 4;
		};
		
		class ADP_BUTTONCUSTOM13: ADPRscButtonMenu
		{
			idc = 1680;
			text = "Trial Medic"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set player to the trial medic rank";
			theAction = "[1,1] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			mediclevel = 4;
			miscperm[] = {72};
		};
		
		class ADP_BUTTONCUSTOM14: ADPRscButtonMenu
		{
			idc = 1681;
			text = "Kick Medic"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Set player to the vice chief medic rank";
			theAction = "[1,0] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			mediclevel = 4;
			miscperm[] = {72};
		};
		
		class ADP_BUTTON4CUSTOM12231: ADPRscButtonMenu
		{
			idc = 1782;
			text = "Medic recruiter"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Lägg till eller ta bort personen som sjukvårdsrekryterare";
			theAction = "['life_medrecruiter'] call ADP_fnc_phguesyitcbgbassgsztocpkgeruikmhhezgnabxemcvqlkbognxwzwoo";
			adminlevel = 4;
			mediclevel = 5;
		};
		
		class ADP_BUT4TONCUS123123M: ADPRscButtonMenu
		{
			idc = 1903;
			text = "Rebellboss"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[2,8] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			reblevel = 8;
		};
		
		class ADP_BUTTON4CUST123123335657M: ADPRscButtonMenu
		{
			idc = 1998;
			text = "Centurion"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[2,7] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			reblevel = 8;
		};
		
		class ADP_BU4TTONCUSTOM: ADPRscButtonMenu
		{
			idc = 1999;
			text = "Alaris"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[2,6] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			reblevel = 8;
		};
		
		class ADP_BUTTONC4USTOM2: ADPRscButtonMenu
		{
			idc = 1906;
			text = "Legionär"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[2,5] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			reblevel = 8;
		};
		
		class ADP_B4UTTONCUSTOM3: ADPRscButtonMenu
		{
			idc = 1908;
			text = "Optio"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[2,4] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			reblevel = 8;
		};
		class ADP_BU4TTONCUSTOM4: ADPRscButtonMenu
		{
			idc = 1909;
			text = "Fullvärdig"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[2,3] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			reblevel = 8;
		};
		
		class ADP_BUTTO4NCUSTOM5: ADPRscButtonMenu
		{
			idc = 1910;
			text = "Rekryt"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[2,2] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			reblevel = 8;
			miscperm[] = {71};
		};
		
		class ADP_BUTTO4NCUSTOM6: ADPRscButtonMenu
		{
			idc = 1911;
			text = "Test"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[2,1] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			reblevel = 8;
			miscperm[] = {71};
		};
		
		class ADP_B4UTTONCUSTOM34: ADPRscButtonMenu
		{
			idc = 1912;
			text = "Rebell kick"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.795 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[2,0] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
			adminlevel = 4;
			reblevel = 8;
			miscperm[] = {71};
		};
		
		class ADP_BUTTONCUSTOM1eaf232: ADPRscButtonMenu
		{
			idc = 1980;
			text = "Rebel recruiter"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.855 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Lägg till eller ta bort personen som rebellrekryterare";
			theAction = "['life_rebrecruiter'] call ADP_fnc_phguesyitcbgbassgsztocpkgeruikmhhezgnabxemcvqlkbognxwzwoo";
			adminlevel = 4;
			reblevel = 8;
		};
		
		class ADP_BUTTONCUSTOM144621: ADPRscButtonMenu
		{
			idc = 1788;
			text = "List Staff"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Lista hela rättsväsendet och alla eventplanerare.";
			theAction = "[true,[],4] call ADP_fnc_listAll";
			adminlevel = 4;
		};
		
		class ADP_BUTTONCUSTOM144622: ADPRscButtonMenu
		{
			idc = 1789;
			text = "Add/remove Event"; 
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.915 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Whitelista eller de-whitelista personen som eventplanerare, bör endast användas av Eventansvarig.";
			theAction = "[1] call ADP_fnc_ljtqlzpjhfxqligxhonlqhidwobawrjjugjiekocxlipsqndvivdleziup";
			adminlevel = 4;
		};

	};
};