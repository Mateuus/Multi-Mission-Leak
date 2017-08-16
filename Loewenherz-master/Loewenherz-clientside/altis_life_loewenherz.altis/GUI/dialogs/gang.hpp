class lhm_My_Gang_Diag {
	idd = 2620;
	name= "lhm_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class TabletBCKGRND: lhm_RscPicture 
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0203282;
			y = -0.104377;
			w = 1.08561;
			h = 1.18545;
			
		};
		class PictureClose: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.123737;
			y = 0.745791;
			w = 0.0875;
			h = 0.1;
		};
	};
	
	class controls {

		
		//class Title : lhm_RscTitle {
		//	colorBackground[] = {0, 0, 0, 0};
		//	idc = 2629;
		//	text = "";
		//	x = 0.1;
		//	y = 0.2;
		//	w = 0.6;
		//	h = (1 / 25);
		//};
		
		class DeineGang : lhm_RscText
		{
			idc = 2629;
			text = "";
			x = 0.478535;
			y = 0.193603;
			w = 0.255429;
			h = 0.06;
		};
		
		class AllPlayersHeader: lhm_RscText
		{
			idc = -1;
			text = "Alle Spieler"; //--- ToDo: Localize;
			x = 0.205555;
			y = 0.194546;
			w = 0.2125;
			h = 0.06;
		};
		
		class AlleSpieler: lhm_RscListbox
		{
			idc = 2632;
			text = "";
			sizeEx = 0.035;
			x = 0.21325;
			y = 0.2624;
			w = 0.2375;
			h = 0.54;
		};
		
		class GangMemberList : lhm_RscListBox 
		{
			idc = 2621;
			text = "";
			sizeEx = 0.035;
			
			x = 0.47472;
			y = 0.261033;
			w = 0.2625;
			h = 0.54;
		};

		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call lhm_fnc_p_updateMenu";
			x = 0.11995;
			y = 0.746262;
			w = 0.1;
			h = 0.1;
		};
		
		class GangLeave : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Leave";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_gangLeave";
			x = 0.750252;
			y = 0.475892;
			w = 0.202652;
			h = 0.0431651;
		};
		
		class GangLock : lhm_RscButtonMenu 
		{
			idc = 2622;
			text = "$STR_Gang_UpgradeSlots";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn lhm_fnc_gangUpgrade";
			x = 0.75;
			y = 0.370371;
			w = 0.202652;
			h = 0.0431651;
		};
		
		class GangKick : lhm_RscButtonMenu 
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_gangKick";
			x = 0.748737;
			y = 0.264309;
			w = 0.202652;
			h = 0.0431651;
		};
		
		class GangLeader : lhm_RscButtonMenu 
		{
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn lhm_fnc_gangNewLeader";
			x = 0.75;
			y = 0.530304;
			w = 0.202652;
			h = 0.0431651;
		};
		class TimeText: lhm_RscText
		{
			idc = 7858;
			SizeEx = 0.027;
			text = "";
			x = 0.930556;
			y = 0.127946;
			w = 0.0534085;
			h = 0.033266;
		};
		class InviteMember : GangLeader
		{
			idc = 2630;
			text = "$STR_Gang_Invite_Player";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn lhm_fnc_gangInvitePlayer";
			x = 0.748738;
			y = 0.316499;
			w = 0.202652;
			h = 0.0431651;
		};
		
		class DisbandGang : InviteMember
		{
			idc = 2631;
			text = "$STR_Gang_Disband_Gang";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn lhm_fnc_gangDisband";
			x = 0.75;
			y = 0.424242;
			w = 0.202652;
			h = 0.0431651;
		};
		
		//class ColorList : lhm_RscListbox
	//	{
		//	idc = 2632;
		//	x = 0.20075;
		//	y = 0.2624;
		//	w = 0.25;
		//	h = 0.54;
		//};
		
		class GangBank : lhm_rscText {
			idc = 601;
			style = 1;
			text = "";
			x = 0.748863;
			y = 0.20633;
			w = 0.175;
			h = 0.04;
		};
	};
};

class lhm_Create_Gang_Diag {
	idd = 2520;
	name= "lhm_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(call lhm_gangPrice)] call lhm_fnc_numberText]};";
	
	class controlsBackground {
		class TabletBCKGRND: lhm_RscPicture 
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0203282;
			y = -0.104377;
			w = 1.08561;
			h = 1.18545;
			
		};
		class PictureClose: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.123737;
			y = 0.745791;
			w = 0.0875;
			h = 0.1;
		};
	};
	
	class controls {
	
		class InfoMsg : lhm_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.27172;
			y = 0.380884;
			w = 0.5625;
			h = 0.04;
		};
		
		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call lhm_fnc_p_updateMenu;";
			x = 0.11995;
			y = 0.746262;
			w = 0.1;
			h = 0.1;
		};
		
		class Title : lhm_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Gang_Title";
			x = 0.418;
			y = 0.3212;
			w = 0.196971;
			h = 0.0416836;
		};

		
		class GangCreateField : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call lhm_fnc_createGang";
			x = 0.425;
			y = 0.5;
			w = 0.175;
			h = 0.04;
		};
		
		class CreateGangText : lhm_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";
			
			x = 0.326;
			y = 0.4376;
			w = 0.383713;
			h = 0.04;
		};
	};
};
