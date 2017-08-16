class Cop_classification {
	idd = 4890;
	name= "Cop_classification";
	movingEnable = false;
	enableSimulation = true;
	
	
	class controlsBackground {
		class MainBackground: lhm_RscText
{
	idc = 1011;
	colorBackground[] = {0, 0, 0, 0.7};
	x = -0.202525;
	y = 0.00821548;
	w = 1.37652;
	h = 1.10673;
};
class MainHeader: lhm_RscText
{
	idc = 1012;
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
	x = -0.200758;
	y = -0.037845;
	w = 1.37273;
	h = 0.030101;
};
	};
	
	class controls {

	class CloseBTN: lhm_RscButtonMenu
{
	idc = 2400;
	text = "Close"; //--- ToDo: Localize;
	tooltip = "$STR_Global_Close";
	onButtonClick = "closeDialog 0;";
	x = -0.208965;
	y = 1.12862;
	w = 0.117677;
	h = 0.0461279;
};
class Combo_Patroulien: lhm_RscCombo
{
	idc = 2100;
	x = 0.838636;
	y = 1.13199;
	w = 0.2125;
	h = 0.04;
};
class BTN_einteilen: lhm_RscButtonMenu
{
	idc = 2401;
	//text = "Einteilen"; //--- ToDo: Localize;
	//onButtonClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 1.06275;
	y = 1.12673;
	w = 0.117803;
	h = 0.0448485;
};

class BTN_zuweisen: lhm_RscButtonMenu
{
	idc = 2799;
	text = "Zuweisen"; //--- ToDo: Localize;
	onButtonClick = "[] call lhm_fnc_cop_classification_assign;";
	x = 0.474747;
	y = 1.13131;
	w = 0.117803;
	h = 0.0448485;
};
class Combp_Dienst: lhm_RscCombo
{
	idc = 2101;
	x = 0.611111;
	y = 1.133;
	w = 0.2125;
	h = 0.04;
};	
	class Listbox_uneingeteilte_einheiten: lhm_RscListbox
{
	idc = 1500;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = -0.1875;
	y = 0.06;
	w = 0.225;
	h = 1.04;
};
class Listbox_Kavala: lhm_RscListbox
{
	idc = 1501;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 0.05;
	y = 0.06;
	w = 0.2125;
	h = 0.48;
};
class Listbox_BP_west: lhm_RscListbox
{
	idc = 1502;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 0.275;
	y = 0.06;
	w = 0.2125;
	h = 0.48;
};
class Listobx_BP_west_2: lhm_RscListbox
{
	idc = 1503;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 0.5;
	y = 0.06;
	w = 0.2125;
	h = 0.48;
};
class Listbox_BP_mitte: lhm_RscListbox
{
	idc = 1504;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 0.725;
	y = 0.06;
	w = 0.2125;
	h = 0.48;
};
class Listbox_BP_ueberall: lhm_RscListbox
{
	idc = 1505;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 0.95;
	y = 0.06;
	w = 0.2125;
	h = 0.48;
};
class Listbox_BP_east: lhm_RscListbox
{
	idc = 1506;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 0.05;
	y = 0.62;
	w = 0.2125;
	h = 0.48;
};
class Listbox_AP_1: lhm_RscListbox
{
	idc = 1507;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 0.275;
	y = 0.62;
	w = 0.2125;
	h = 0.48;
};
class Listbox_AP_2: lhm_RscListbox
{
	idc = 1508;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 0.5;
	y = 0.62;
	w = 0.2125;
	h = 0.48;
};
class Listbox_HWP: lhm_RscListbox
{
	idc = 1509;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 0.725;
	y = 0.62;
	w = 0.2125;
	h = 0.48;
};
class Listbox_sonstige_einheiten: lhm_RscListbox
{
	idc = 1510;
	sizeEx = 0.0330;
	onLBDblClick = "[] call lhm_fnc_cop_classification_organize;";
	x = 0.95;
	y = 0.62;
	w = 0.2125;
	h = 0.48;
};
class Kavala: lhm_RscText
{
	idc = 1000;
	text = "Kavala"; //--- ToDo: Localize;
	x = 0.0549243;
	y = 0.0250505;
	w = 0.201642;
	h = 0.0282155;
};
class BPwest: lhm_RscText
{
	idc = 1001;
	text = "BP-West"; //--- ToDo: Localize;
	x = 0.280303;
	y = 0.0252526;
	w = 0.201642;
	h = 0.0282155;
};
class BPwest2: lhm_RscText
{
	idc = 1002;
	text = "BP-West-2"; //--- ToDo: Localize;
	x = 0.50505;
	y = 0.0252526;
	w = 0.201642;
	h = 0.0282155;
};
class BPmitte: lhm_RscText
{
	idc = 1003;
	text = "BP-Mitte"; //--- ToDo: Localize;
	x = 0.729798;
	y = 0.0252525;
	w = 0.201642;
	h = 0.0282155;
};
class BPueberall: lhm_RscText
{
	idc = 1004;
	text = "BP-Ueberall"; //--- ToDo: Localize;
	x = 0.954546;
	y = 0.0252526;
	w = 0.201642;
	h = 0.0282155;
};
class BPeast: lhm_RscText
{
	idc = 1005;
	text = "BP-East"; //--- ToDo: Localize;
	x = 0.0555556;
	y = 0.584175;
	w = 0.201642;
	h = 0.0282155;
};
class AP1: lhm_RscText
{
	idc = 1006;
	text = "AP-1"; //--- ToDo: Localize;
	x = 0.280303;
	y = 0.584175;
	w = 0.201642;
	h = 0.0282155;
};
class AP2: lhm_RscText
{
	idc = 1007;
	text = "AP-2"; //--- ToDo: Localize;
	x = 0.505051;
	y = 0.584175;
	w = 0.201642;
	h = 0.0282155;
};
class HWP: lhm_RscText
{
	idc = 1008;
	text = "HWP"; //--- ToDo: Localize;
	x = 0.729798;
	y = 0.584175;
	w = 0.201642;
	h = 0.0282155;
};
class Sonstige: lhm_RscText
{
	idc = 1009;
	text = "Sonstige Einheiten"; //--- ToDo: Localize;
	x = 0.955808;
	y = 0.584175;
	w = 0.201642;
	h = 0.0282155;
};
class uneingeteile: lhm_RscText
{
	idc = 1010;
	text = "Nicht eingeteilte"; //--- ToDo: Localize;
	x = -0.183081;
	y = 0.0252525;
	w = 0.214268;
	h = 0.0282155;
};	

//class BTN_remove: lhm_RscButtonMenu
//{
	//idc = 2402;
	//text = "Entferne"; //--- ToDo: Localize;
	//x = 0.474747;
	//y = 1.13131;
	//w = 0.117803;
	//h = 0.0448485;
//};
	};
};