class lhm_my_smartphone {
	idd = 88888;
	name = "lhm_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn lhm_fnc_smartphone;";

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

	//	class MessageTitle : lhm_RscTitle {
	//		colorBackground[] = {0, 0, 0, 0};
	//		idc = 88886;
	//		text = "";
	//		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
	//		x = 0.325;
	//		y = 0.25;
	//		w = 0.7;
	//		h = (1 / 25);
	//	};

		class RandomTitle : lhm_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88890;
			text = "$STR_SMARTPHONE_RANDOMTITLE";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.329798;
			y = 0.526532;
			w = 0.6;
			h = 0.04;
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

		class MSGHeader: lhm_RscTitle
		{
			idc = 4999;
			colorBackground[] = {0, 0, 0, 0};
			text = "$STR_SMARTPHONE_HEADER";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			x = 0.328283;
			y = 0.198653;
			w = 0.603788;
			h = 0.0298991;
		};

		class PlayerList : lhm_RscListBox
		{
			idc = 88881;
			onLBSelChanged = "[2] spawn lhm_fnc_smartphone;";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			x = 0.09625;
			y = 0.2428;
			w = 0.218687;
			h = 0.424916;
		};

		class BTNClose: lhm_RscButtonSilent
		{
			idc = 4998;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0; [] call lhm_fnc_p_updateMenu;";
			x = 0.11995;
			y = 0.746262;
			w = 0.1;
			h = 0.1;
		};

		class MessageList : lhm_RscListNBox
		{
			idc = 88882;
			onLBSelChanged = "[(lbCurSel 88882)] call lhm_fnc_showMsg;";
			//sizeEx = 0.04;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {0, 0, 0, 0.0};
			columns[] = {0,0.3};
			x = 0.325;
			y = 0.24;
			w = 0.6125;
			h = 0.28;
		};

		class TextShow : lhm_RscControlsGroup {
			x = 0.325;
			y = 0.58;
			w = 0.6125;
			h = 0.2;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : lhm_RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.6125;//w = 0.7;
					h = 1;//h = 2.15;
				};
			};
		};

		class Schreiben : lhm_RscButtonMenu {
			idc = 887892;
			text = "$STR_SMARTPHONE_SCHREIBEN";
			onButtonClick = "[4] call lhm_fnc_smartphone;";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			x = 0.09775;
			y = 0.6764;
			w = 0.214268;
			h = 0.04;
		};

	//	class Title : lhm_RscTitle {
			//colorBackground[] = {0, 0, 0, 0};
			//idc = -1;
			//text = "$STR_SMARTPHONE_TITLE";
			//sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		//	x = 0.1;
		//	y = 0.2;
		///	w = 0.95;
		//	h = (1 / 25);
		//};

		class PlayerListTitle : lhm_RscTitle {
			//colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_SMARTPHONE_PLAYERLISTTITLE";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.10101;
			y = 0.200337;
			w = 0.208586;
			h = 0.0298991;
		};

		// Emergency
		class Notruf : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_SMARTPHONE_NOTRUF";
			onButtonClick = "createDialog ""lhm_smartphone_notruf"";";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			x = 0.776904;
			y = 0.80303;
			w = 0.159849;
			h = 0.0399999;
			class Attributes {
				align = "center";
			};
		};

		// Delete All Messages
		class removeAllMessages : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_SMARTPHONE_MSGREMOVE";
			onButtonClick = "[3] spawn lhm_fnc_smartphone;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			x = 0.327904;
			y = 0.80303;
			w = 0.309849;
			h = 0.0399999;
			class Attributes {
				align = "center";
			};
		};
	};

};

class lhm_smartphone_schreiben {
	idd = 88883;
	name = "lhm_my_smartphone_schreiben";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";


	class controlsBackground {
		class MainBackground: lhm_RscPicture
		{
			idc = 1200;
			text = "core\textures\icons\Menu\phone.paa";
			x = 0.033;
			y = -0.072;
			w = 0.9125;
			h = 1.14;
		};

	};
	class controls {
		//class Title : lhm_RscTitle {
			//colorBackground[] = {0, 0, 0, 0};
			//idc = 88886;
			//text = "$STR_SMARTPHONE_NACHRICHTTITLE";
			//x = 0.1;
			//y = 0.2;
			//w = 0.95;
			//h = (1 / 25);
	//	};

		class Absenden : lhm_RscButtonMenu {
			idc = 88885;
			text = "$STR_SMARTPHONE_ABSENDEN";
			onButtonClick = "[1,-1,(ctrlText 88884)] call lhm_fnc_newMsg;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			x = 0.492045;
			y = 0.624444;
			w = 0.145076;
			h = 0.0534681;
		};

		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.427399;
			y = 0.89138;
			w = 0.075;
			h = 0.08;
		};

		class AdminMsg : lhm_RscButtonMenu
		{
			idc = 888897;
			text = "$STR_CELL_AdminMsg";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			onButtonClick = "[5,-1,(ctrlText 88884)] call lhm_fnc_newMsg;";

			x = 0.335859;
			y = 0.624579;
			w = 0.145076;
			h = 0.0534681;
		};

		class textEdit : lhm_RscEdit {
			idc = 88884;
			text = "";
			sizeEx = 0.030;
			x = 0.3;
			y = 0.554747;
			w = 0.3375;
			h = 0.06;
		};

	};

};

class lhm_smartphone_notruf {
	idd = 887890;
	name= "lhm_my_smartphone_notruf";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[6] spawn lhm_fnc_newMsg;";

	class controlsBackground {
		class MainBackground: lhm_RscPicture
		{
			idc = 1200;
			text = "core\textures\icons\Menu\phone.paa";
			x = 0.033;
			y = -0.072;
			w = 0.9125;
			h = 1.14;
		};
	};

	class controls {

		//class Title : lhm_RscTitle {
		//	colorBackground[] = {0, 0, 0, 0};
		//	idc = 888892;
		//	text = "$STR_SMARTPHONE_Notruftitle";
		//	x = 0.1;
		//	y = 0.2;
		//	w = 0.6;
		//	h = (1 / 25);
		//};

		class textEdit : lhm_RscEdit {

			idc = 888894;

			text = "";
			sizeEx = 0.030;
			x = 0.3;
			y = 0.554747;
			w = 0.3375;
			h = 0.06;

		};

		class TxtCopButton : lhm_RscButtonMenu
		{
			idc = 888895;
			text = "$STR_CELL_TextPolice";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[2,-1,(ctrlText 888894)] call lhm_fnc_newMsg;";

			x = 0.474748;
			y = 0.626263;
			w = 0.1625;
			h = 0.0549496;
		};

		class TxtAdminButton : lhm_RscButtonMenu
		{
			idc = 888896;
			text = "$STR_CELL_TextAdmins";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[3,-1,(ctrlText 888894)] call lhm_fnc_newMsg;";

			x = 0.306819;
			y = 0.624579;
			w = 0.1625;
			h = 0.0549496;
		};


		class AdminMsgAll : lhm_RscButtonMenu
		{
			idc = 888898;
			text = "$STR_CELL_AdminMSGAll";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[7,-1,(ctrlText 888894)] call lhm_fnc_newMsg;";
			//onButtonClick = "_msg = ctrlText 888894; if(_msg != "") then {[[1,(_msg)],'lhm_fnc_centerMsg',true] call lhm_fnc_mp;} else {hint 'Um etwas zu senden musst du eine Nachricht eingeben!'} closeDialog 0";

			x = 0.306818;
			y = 0.626263;
			w = 0.1625;
			h = 0.0549496;
		};

		class EMSReq : lhm_RscButtonMenu
		{
			idc = 888899;
			text = "$STR_CELL_EMSRequest";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[4,-1,(ctrlText 888894)] call lhm_fnc_newMsg;";

			x = 0.306818;
			y = 0.691919;
			w = 0.1625;
			h = 0.0549496;
		};

		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.427399;
			y = 0.89138;
			w = 0.075;
			h = 0.08;
		};

		class SecReq : lhm_RscButtonMenu
		{
			idc = 888900;
			text = "An Security";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[8,-1,(ctrlText 888894)] call lhm_fnc_newMsg;";

			x = 0.47601;
			y = 0.690236;
			w = 0.1625;
			h = 0.0549496;
		};


	};
};