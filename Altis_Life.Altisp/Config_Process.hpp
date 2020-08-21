/*
*   class:
*       MaterialsReq (Needed to process) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       MaterialsGive (Returned items) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       Text (Progess Bar Text) = Localised String
*       NoLicenseCost (Cost to process w/o license) = Scalar
*
*   Example for multiprocess:
*
*   class Example {
*
*       MaterialsReq[] = {{"cocaine_processed",1},{"heroin_processed",1}};
*       MaterialsGive[] = {{"diamond_cut",1}};
*       Text = "STR_Process_Example";
*       //ScrollText = "Process Example";
*       NoLicenseCost = 4000;
*	};
*
*/

class ProcessAction {

	class oil {

        MaterialsReq[] = {{"oil_unprocessed",1}};
		MaterialsGive[] = {{"oil_processed",1}};
        Text = "STR_Process_Oil";
        //ScrollText = "Process Oil";
        NoLicenseCost = 10000;
	};
	
	class guma {

        MaterialsReq[] = {{"kauczuk",1}};
		MaterialsGive[] = {{"guma",2}};
        Text = "STR_Process_Kauczuk";
        //ScrollText = "Process Kauczuk";
        NoLicenseCost = 10000;
	};

	class diamond {

        MaterialsReq[] = {{"diamond_uncut",1}};
		MaterialsGive[] = {{"diamond_cut",1}};
        Text = "STR_Process_Diamond";
	 	//ScrollText = "Cut Diamonds";
        NoLicenseCost = 13000;
	};

	class heroin {

        MaterialsReq[] = {{"heroin_unprocessed",1}};
		MaterialsGive[] = {{"heroin_processed",1}};
        Text = "STR_Process_Heroin";
        //ScrollText = "Process Heroin";
        NoLicenseCost = 40000;
	};

	class copper {

        MaterialsReq[] = {{"copper_unrefined",1}};
		MaterialsGive[] = {{"copper_refined",1}};
        Text = "STR_Process_Copper";
        //ScrollText = "Refine Copper";
        NoLicenseCost = 7000;
	};

	class iron {

        MaterialsReq[] = {{"iron_unrefined",1}};
		MaterialsGive[] = {{"iron_refined",1}};
        Text = "STR_Process_Iron";
        //ScrollText = "Refine Iron";
        NoLicenseCost = 9000;
	};

	class sand {

        MaterialsReq[] = {{"sand",1}};
		MaterialsGive[] = {{"glass",1}};
        Text = "STR_Process_Sand";
        //ScrollText = "Melt Sand into Glass";
        NoLicenseCost = 8000;
	};

	class salt {

        MaterialsReq[] = {{"salt_unrefined",1}};
		MaterialsGive[] = {{"salt_refined",1}};
        Text = "STR_Process_Salt";
        //ScrollText = "Refine Salt";
        NoLicenseCost = 7500;
	};

	class cocaine {

        MaterialsReq[] = {{"cocaine_unprocessed",1}};
		MaterialsGive[] = {{"cocaine_processed",1}};
		Text = "STR_Process_Cocaine";
        //ScrollText = "Process Cocaine";
        NoLicenseCost = 55000;
	};

	class marijuana {

        MaterialsReq[] = {{"cannabis",1}};
		MaterialsGive[] = {{"marijuana",1}};
        Text = "STR_Process_Marijuana";
        //ScrollText = "Harvest Marijuana";
        NoLicenseCost = 35000;
	};

	class cement {

        MaterialsReq[] = {{"rock",1}};
		MaterialsGive[] = {{"cement",1}};
        Text = "STR_Process_Cement";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 7500;
	};
	
	class tobacco {
        MaterialsReq[] = {{"tobacco_unprocessed",1}};
        MaterialsGive[] = {{"tobacco_processed",1}};
        Text = "STR_Process_Tobacco";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
    };

	class mash {

        MaterialsReq[] = {{"waterBottle",1},{"apple",1}};
		MaterialsGive[] = {{"mash",1}};
        Text = "STR_Process_Mash";
        NoLicenseCost = 10000;
	};

	class beer {

        MaterialsReq[] = {{"yeast",1},{"hops",1}};
		MaterialsGive[] = {{"beer",1}};
        Text = "STR_Process_Beer";
        NoLicenseCost = 25000;
	};

	class whiskey {

        MaterialsReq[] = {{"yeast",1},{"rye",1}};
		MaterialsGive[] = {{"whiskey",1}};
        Text = "STR_Process_Whiskey";
        NoLicenseCost = 25000;
	};

	class moonshine {

        MaterialsReq[] = {{"yeast",1},{"mash",1}};
		MaterialsGive[] = {{"moonshine",1}};
        Text = "STR_Process_Moonshine";
        NoLicenseCost = 25000;
	};

	class bottler {

        MaterialsReq[] = {{"glass",1}};
		MaterialsGive[] = {{"bottles",1}};
        Text = "STR_Process_Bottler";
        NoLicenseCost = 10000;
	};

	class bottledbeer {

        MaterialsReq[] = {{"bottles",1},{"beer",1}};
		MaterialsGive[] = {{"bottledbeer",1}};
        Text = "STR_Process_Bottledbeer";
        NoLicenseCost = 25000;
	};

	class bottledwhiskey {

        MaterialsReq[] = {{"bottles",1},{"whiskey",1}};
		MaterialsGive[] = {{"bottledwhiskey",1}};
        Text = "STR_Process_BottleWhiskey";
        NoLicenseCost = 30000;
	};

	class bottledshine {

        MaterialsReq[] = {{"bottles",1},{"moonshine",1}};
		MaterialsGive[] = {{"bottledshine",1}};
        Text = "STR_Process_Bottledshine";
        NoLicenseCost = 25000;
	};
	// Uran
	class uranoc {

        MaterialsReq[] = {{"uranwy",1}};
		MaterialsGive[] = {{"uranoc",1}};
        Text = "STR_Process_uran_oc";
        NoLicenseCost = 75000;
	};
	class uranpr {

        MaterialsReq[] = {{"uranoc",1}};
		MaterialsGive[] = {{"uranpr",1}};
        Text = "STR_Process_uran_pr";
        NoLicenseCost = 75000;
	};
	class uranwz {

        MaterialsReq[] = {{"uranpr",1}};
		MaterialsGive[] = {{"uranwz",1}};
        Text = "STR_Process_uran_wz";
        NoLicenseCost = 75000;
	};
	class uranpre {

        MaterialsReq[] = {{"uranwz",1}};
		MaterialsGive[] = {{"uranpre",1}};
        Text = "STR_Process_uran_pre";
        NoLicenseCost = 75000;
	};
	class buran {

        MaterialsReq[] = {{"uranpr",1}};
		MaterialsGive[] = {{"buran",1}};
        Text = "STR_Process_buran";
        NoLicenseCost = 90000;
	};
	class s_pro {

        MaterialsReq[] = {{"s_ore",1}};
		MaterialsGive[] = {{"s_pro",1}};
        Text = "STR_Process_s_pro";
        NoLicenseCost = 15000;
	};
	class jewelery {

        MaterialsReq[] = {{"s_pro",1},{"diamond_cut",1}};
		MaterialsGive[] = {{"jewelery",1}};
        Text = "STR_Process_jewelery";
        NoLicenseCost = 35000;
	};

};
