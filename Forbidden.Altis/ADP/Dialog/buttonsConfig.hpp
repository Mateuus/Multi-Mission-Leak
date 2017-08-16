



class AdpButtons1 {
	
	class ADP_MenuScripts: ADPRscButtonMenu
	{
		idc = 2400;
		text = "Debugging"; 
		x = 0.2916 * safezoneW + safezoneX;
		y = 0.499889 * safezoneH + safezoneY;
		w = 0.0792 * safezoneW;
		h = 0.033 * safezoneH;
		tooltip = "To execute and watch all of your Favorite Variables";
		action = "[] spawn ADP_fnc_ndsybjptxwqixppdiqgpiumakpibsmjgnlshiudulvnffjfodg;";
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
		action = "[] spawn ADP_fnc_iiglvqyubunxskkcuapgnyknpbrbadnpdqhfegozvfkwquvswtv;";
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
		action = "[] spawn ADP_fnc_havzyadaqqqecudzryocdruhpzmvesqrxfketorpetwwjgrvdwrhrgxvkbx;";
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
		action = "[] spawn ADP_fnc_ssqixfzneimkhownrodvsniaaedmglqlymuutbysnfypippzqn;";
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
		action = "[] spawn ADP_fnc_adpEvents;";
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
		action = "[] spawn ADP_fnc_bwjgbwwqcnxmhsnptfpkrfnopvqpsdxwqpjwfyzjbctyjhijquqmuxj;";
		adminlevel = -1;
	};
	
	
	class ADP_BUTTONCUSTOM: ADPRscButtonMenu
	{
		text = "Keybinds";
		tooltip = "Öppnar en ruta med alla snabbknappar/keybinds som kan vara bra att ha för en trial mod/mod/admin.";
		action = "[] spawn ADP_fnc_deinpjsmwcivoipkcikuuaqcnfsarjagjkmizvhfchubgqrdreotsh;";
		x = 0.407187 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.0876563 * safezoneW;
		h = 0.022 * safezoneH;
		adminlevel = 1;
		eventlevel = 1;
	};
	
	class ADP_BUTTONCUSTOM1: ADPRscButtonMenu
	{
		text = "TP Map";
		tooltip = "Teleportera den spelare du har valt i listan och spelarens fordon till vart du vill på kartan";
		action = "[] call ADP_fnc_TeleOther";
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
		action = "[6001,1565,10] call ADP_fnc_dbfzrnbwtypadydlpbjgbclltombnslxivdaopcdeneanfzjxrfswssrigv";
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
		action = "[6001,1565,0] call ADP_fnc_zyuristwvudynpavxjrpyyekmscbxpfhtseecsfmmpbnltugso";
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
		action = "[] call ADP_fnc_dfjdrdeaqeqyrnvzjveynminlcizrymhhfmqrgspmidmhaniloywae";
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
		action = "_this call ADP_fnc_jkkddnacltodckdzzgkjgfebbsnalmbpviifjupjmbyhmivlbuxur";
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
		action = "_this call ADP_fnc_Kill";
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
		action = "";
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
		action = "";
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
		action = "";
	};
	
	
	class ADP_BUTTONCUSTOM9: ADPRscButtonMenu
	{
		text = "Map markers"; 
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.0876563 * safezoneW;
		h = 0.022 * safezoneH;
		tooltip = "Markerar alla spelare på kartan";
		action = "[] call ADP_fnc_mryrhitqjscpuwarpwrvxkjucemygyjvzglajewdlhjdmtkjjw";
		adminlevel = 4;
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
		action = "[] call ADP_fnc_invisibility";
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
		action = "[] call ADP_fnc_Revive";
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
		tooltip = "Spawna virtuella items, ange sort i skript-fältet";
		action = "[] call ADP_fnc_htozcgummoshicwscafojopgdgyigdbrbskkarwckestjrmeoulv";
		adminlevel = 3;
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
		action = "[] call ADP_fnc_Compensate";
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
		action = "[] call ADP_fnc_owpiwbmvnbvidxfhwrewyngnbvmbhozcvozefhyclpfdtehoobrdxzixkud";
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
		action = "[] call ADP_fnc_checkMoney";
		adminlevel = 1;
	};
	
	class ADP_BUTTONCUSTOM203: ADPRscButtonMenu
	{
		idc = 1741;
		text = ""; 
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.765 * safezoneH + safezoneY;
		w = 0.0876563 * safezoneW;
		h = 0.022 * safezoneH;
		tooltip = "Oanvänd knapp 203";
		action = "";
	};
	
	class ADP_BUTTONCUSTOM204: ADPRscButtonMenu
	{
		idc = 1742;
		text = ""; 
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.795 * safezoneH + safezoneY;
		w = 0.0876563 * safezoneW;
		h = 0.022 * safezoneH;
		tooltip = "Oanvänd knapp 204";
		action = "";
	};
	
	class ADP_BUTTONCUSTOM205: ADPRscButtonMenu
	{
		idc = 1743;
		text = ""; 
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.825 * safezoneH + safezoneY;
		w = 0.0876563 * safezoneW;
		h = 0.022 * safezoneH;
		tooltip = "Oanvänd knapp 205";
		action = "";
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
		action = "_this call ADP_fnc_akqblvsefdeiblznlscrqptgqrycfaeoogxrywmtckrhcewwiod";
		adminlevel = -1;
	};
	
	class ADP_BUTTONKILL: ADPRscButtonMenu
	{
		idc = 1604;
		text = "Spectate"; 
		x = 0.298906 * safezoneW + safezoneX;
		y = 0.863 * safezoneH + safezoneY;
		w = 0.0876563 * safezoneW;
		h = 0.022 * safezoneH;
		tooltip = "Spectates selected player";
		action = "closeDialog 0; _this call ADP_fnc_Spectate";
		adminlevel = 1;
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
		action = "closeDialog 0; _this call ADP_fnc_zhqprspxyqtpzjdscpwqrjeilsfjdwdcbuqjhxdfkmolontjkk";
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
		action = "[] call ADP_fnc_ubpwbjleddbbcimzumvxadmjwvatxsjuvlkgjpdbhrjuuzuoygtizms;";
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
		action = "[] call ADP_fnc_hswwaqlszqlajynjgpxyvmbxbulyrbrumzafojdicikipuckghyr;";
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
		action = "[] call ADP_fnc_drdlhjweieavzwaxoelwyldyglguopseaobcixrijfiucmnbdamhabx;";
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
		action = "[0] call ADP_fnc_mrjvhujyjqzpkwsavpuccisfnbwleakyzrpfggieitzjqrlcpchegssb";
		adminlevel = 5;
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
		action = "[3] call ADP_fnc_mrjvhujyjqzpkwsavpuccisfnbwleakyzrpfggieitzjqrlcpchegssb";
		adminlevel = 5;
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
		action = "[1] call ADP_fnc_mrjvhujyjqzpkwsavpuccisfnbwleakyzrpfggieitzjqrlcpchegssb";
		adminlevel = 5;
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
		action = "[2] call ADP_fnc_mrjvhujyjqzpkwsavpuccisfnbwleakyzrpfggieitzjqrlcpchegssb";
		adminlevel = 5;
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
		action = "ctrlSetText [1400, """"];";
		adminlevel = -1;
	};
};

class AdpButtons2 {
	class ADP_MenuScripts: ADPRscButtonMenu
	{
		idc = 2400;
		text = "Debugging"; 
		x = 0.2916 * safezoneW + safezoneX;
		y = 0.499889 * safezoneH + safezoneY;
		w = 0.0792 * safezoneW;
		h = 0.033 * safezoneH;
		tooltip = "To execute and watch all of your Favorite Variables";
		action = "[] spawn ADP_fnc_ndsybjptxwqixppdiqgpiumakpibsmjgnlshiudulvnffjfodg;";
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
		action = "[] spawn ADP_fnc_iiglvqyubunxskkcuapgnyknpbrbadnpdqhfegozvfkwquvswtv;";
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
		action = "[] spawn ADP_fnc_havzyadaqqqecudzryocdruhpzmvesqrxfketorpetwwjgrvdwrhrgxvkbx;";
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
		action = "[] spawn ADP_fnc_ssqixfzneimkhownrodvsniaaedmglqlymuutbysnfypippzqn;";
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
		action = "[] spawn ADP_fnc_adpEvents;";
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
		action = "[] spawn ADP_fnc_bwjgbwwqcnxmhsnptfpkrfnopvqpsdxwqpjwfyzjbctyjhijquqmuxj;";
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
		action = "closeDialog 0";
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
		action = "[] call ADP_fnc_vsoucttboqxqscumwnjgfihliayixekbcjjzibheoxvpqygjikslbirtyvt;";
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
		action = "[] call ADP_fnc_hntscidewsgxodtfqevfyagacssxadlfkfwzfxhfitfywqphmnkkkbjcbeu;";
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
		action = "[1] call ADP_fnc_wdouajxvifaqhdylzqkdknninwfxlbknxsaspdrwoteoiwacirtzmexaka";
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
		action = "[0] call ADP_fnc_wdouajxvifaqhdylzqkdknninwfxlbknxsaspdrwoteoiwacirtzmexaka";
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
		action = "[2] call ADP_fnc_wdouajxvifaqhdylzqkdknninwfxlbknxsaspdrwoteoiwacirtzmexaka";
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
		action = "[] spawn ADP_fnc_ffhpedvskbfazvhlgohxmfunhkzeescgcjdbckacvujxynrlihtnm";
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
		action = "[] spawn ADP_fnc_vxymzczrzsbxbdzovlvxhpttcsieagwtfenbrvghdnbvtssvvvue;";
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
		action = "[false] spawn ADP_fnc_vxymzczrzsbxbdzovlvxhpttcsieagwtfenbrvghdnbvtssvvvue";
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
		action = "[6001,1565] call ADP_fnc_msjvlcnadkexsomjvuufmlutzziaptydsagmlkwezdpezdqbni";
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
		action = "[] call ADP_fnc_oztzqimnhzjxwpxbqhacmftqmekvhckqhlhsrhqathcbsawccuwoiuwffdu";
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
		action = "[true] spawn life_fnc_voteDay;";
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
		tooltip = "Spärra av ett område för alla spelare som INTE har safekeeping, spelare som bryter mot avspärrningen får automatiskt en varning och hamnar sedan i adminjail. \n\nOmrådet centreras runt din position, ange radie i vänstra fältet. \n\nFör att ta bort ALLA avspärrade områden, skriv 'ta bort' i vänstra fältet utan appostrofer.";
		action = "[] call ADP_fnc_azaiwvdhlzsihimcdrpkrqtumisgrgelyazrxdazkgijfzcjzfpgqweqaaqj;";
		adminlevel = 4;
		eventlevel = 1;
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
		action = "[] call ADP_fnc_cnvjukewwuqbrpsgwobvrwoacglaxkgiwotdrtplohgmaleheoitln";
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
		action = "[] spawn ADP_fnc_jooggfuzhtstifvzpnqdhfawfrtuzvtvzqcsumyuvmzahladkbcifai";
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
		action = "[] spawn ADP_fnc_cjxycuypeewwhjvqyvwpmgzhzstqrulfxfqiupiyokbbneukiupkntfflwkr;";
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
		action = "closeDialog 0; [player] execVM 'spectator\specta.sqf';";
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
		action = "[] call ADP_fnc_tuuaujhiukcjrxldxlfytnwykwmxhswrzleaxtdywsehjkckriwzkbll;";
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
		action = "[] spawn ADP_fnc_nveixbzpaoipikfwydypdxpigoocuzsgehbujdavmtjearjjxasdcqg;";
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
		action = "life_debugging = !life_debugging; if(life_debugging) then {hint 'debugging aktiverat'} else {hint 'debugging avstängt'};";
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
		action = "[] call ADP_fnc_xenjypgrhzxzafdlhuxpsfjxainaxrqyuaslraktybjztusahnlbyzaj;";
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
		action = "[3,4] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
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
		action = "[3,3] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
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
		action = "[3,2] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
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
		action = "[3,1] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
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
		action = "[3,0] call ADP_fnc_ncazzlexqozsjpqvgtivxzraxmovzxzvzavtfugjcwrjyckykfkll";
		adminlevel = 3;
	};
};

