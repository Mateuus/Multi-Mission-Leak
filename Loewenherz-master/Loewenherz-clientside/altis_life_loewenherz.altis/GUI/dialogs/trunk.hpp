class TrunkMenu
{
	idd = 3500;
	name = "TrunkMenu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground
	{
		//class RscTitleBackground : lhm_RscText
		//{
		//	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		//	x = 0.1;
		//	y = 0.2;
		//	w = 0.7;
		//	h = (1 / 25);
		//};

		class RscBackground : lhm_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.091035;
			y = 0.086936;
			w = 0.788763;
			h = 0.904781;
		};

		class RscTitleText : lhm_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 3501;
			text = "";
			x = 0.0925505;
			y = 0.0149495;
			w = 0.791162;
			h = 0.06;
		};

		class VehicleWeight : lhm_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 3504;
			//style = 1;
			text = "";
			x = 0.619697;
			y = 0.033468;
			w = 0.2625;
			h = 0.04;
		};

		class RscTrunkText : lhm_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_Trunk_TInventory";
			sizeEx = 0.04;

			x = 0.0925505;
			y = 0.089899;
			w = 0.303662;
			h = 0.063367;
		};

		class RscPlayerText : lhm_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_Trunk_PInventory";
			sizeEx = 0.04;

			x = 0.579546;
			y = 0.0892256;
			w = 0.303662;
			h = 0.063367;
		};
	};

	class Controls
	{
		class TrunkGear : lhm_RscListBox
		{
			idc = 3502;
			text = "";
			sizeEx = 0.040;

			x = 0.0875;
			y = 0.16;
			w = 0.3125;
			h = 0.7;
		};

		class PlayerGear : lhm_RscListBox
		{
			idc = 3503;
			text = "";
			sizeEx = 0.040;

			x = 0.575;
			y = 0.16;
			w = 0.3125;
			h = 0.7;
		};

		class TrunkEdit : lhm_RscEdit
		{
			idc = 3505;
			text = "1";
			sizeEx = 0.050;
			x = 0.0912879;
			y = 0.86;
			w = 0.308712;
			h = 0.06;
		};

		class PlayerEdit : lhm_RscEdit
		{
			idc = 3506;
			text = "1";
			sizeEx = 0.050;
			x = 0.578788;
			y = 0.86;
			w = 0.308712;
			h = 0.063367;
		};

		class TakeItem : lhm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Trunk_Take";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[""normal""] call lhm_fnc_vehTakeItem;";
			x = 0.159596;
			y = 0.927811;
			w = 0.15;
			h = 0.06;
		};

		class quicktakeitem : lhm_RscButtonMenu
		{
			idc = 8579;
			text = "";
			sizeEx = 0.050;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[""extra""] call lhm_fnc_vehTakeItem;";
			x = 0.441919;
			y = 0.456229;
			w = 0.0875;
			h = 0.06;
		};

		class quickstoreitem : lhm_RscButtonMenu
		{
			idc = 8578;
			text = "";
			sizeEx = 0.050;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[""extra""] call lhm_fnc_vehStoreItem;";
			x = 0.441288;
			y = 0.356229;
			w = 0.0875;
			h = 0.06;
		};

		class BTNChangeQuickZahl: lhm_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Ch. Quickzahl";
			onButtonClick = "_num = ctrlText 3499; if(!([_num] call TON_fnc_isnumber)) exitWith {hint localize ""STR_MISC_WrongNumFormat"";}; LHM_quick_change_virtitem = _num; closeDialog 0; [] spawn {sleep 0.3; if(vehicle player != player) then {[vehicle player] call lhm_fnc_openInventory;} else{[cursorTarget] call lhm_fnc_openInventory;};};";
			sizeEx = 0.03;
			x = 0.39675;
			y = 1.0044;
			w = 0.2125;
			h = 0.06;
		};

		class Quickitemchange : lhm_RscEdit
		{
			idc = 3499;
			text = "10";
			sizeEx = 0.040;
			x = 0.232712;
			y = 1.0028;
			w = 0.156314;
			h = 0.0583165;
		};

		class StoreItem : lhm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Trunk_Store";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[""normal""] call lhm_fnc_vehStoreItem;";
			x = 0.657576;
			y = 0.928215;
			w = 0.15;
			h = 0.06;
		};

		class ButtonClose : lhm_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.0876264;
			y = 0.999394;
			w = 0.1375;
			h = 0.06;
		};
	};
};