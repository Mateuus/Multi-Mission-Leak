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
*       MaterialsReq[] = {{"cocaine_processed",1},{"heroin_processed",1}};
*       MaterialsGive[] = {{"diamond_cut",1}};
*       Text = "STR_Process_Example";
*       //ScrollText = "Process Example";
*       NoLicenseCost = 4000;
*   };
*/

class ProcessAction {
    class oilfill {
        MaterialsReq[] = {{"emptyoil",1}};
        MaterialsGive[] = {{"oilu",1}};
        Text = "STR_Process_oilbarrel";
        //ScrollText = "Process Oil";

    };

    class oil {
        MaterialsReq[] = {{"oilu",1}};
        MaterialsGive[] = {{"oilp",1}};
        Text = "STR_Process_Oil";
        //ScrollText = "Process Oil";
		NoLicenseCost = 800000;

    };

    class diamond {
        MaterialsReq[] = {{"diamond_uncut",1}};
        MaterialsGive[] = {{"diamond_cut",1}};
        Text = "STR_Process_Diamond";
        //ScrollText = "Cut Diamonds";
        NoLicenseCost = 50000;
    };

    class heroin {
        MaterialsReq[] = {{"heroin_unprocessed",1}};
        MaterialsGive[] = {{"heroin_processed",1}};
        Text = "STR_Process_Heroin";
        //ScrollText = "Process Heroin";
        NoLicenseCost = 150000;
    };
	
	class platinum {
        MaterialsReq[] = {{"platinum_unrefined",1}};
		MaterialsGive[] = {{"platinum_processed",1}};
        Text = "STR_Process_Platinum";
        //ScrollText = "Refine Platinum";
        NoLicenseCost = 30000;
	};

    class copper {
        MaterialsReq[] = {{"copper_unrefined",1}};
        MaterialsGive[] = {{"copper_refined",1}};
        Text = "STR_Process_Copper";
        //ScrollText = "Refine Copper";
        NoLicenseCost = 5000;
    };

    class iron {
        MaterialsReq[] = {{"iron_unrefined",1}};
        MaterialsGive[] = {{"iron_refined",1}};
        Text = "STR_Process_Iron";
        //ScrollText = "Refine Iron";
        NoLicenseCost = 9000;
    };
	
    class rice {
        MaterialsReq[] = {{"riceu",1}};
        MaterialsGive[] = {{"ricep",1}};
        Text = "STR_Process_rice";
        //ScrollText = "Refine Iron";
        NoLicenseCost = 2500;
    };
	
    class silver {
        MaterialsReq[] = {{"silveru",1}};
        MaterialsGive[] = {{"silverp",1}};
        Text = "STR_Process_silver";
        //ScrollText = "Refine Iron";
        NoLicenseCost = 7000;
    };
	
    class LSD {
        MaterialsReq[] = {{"LSDu",1}};
        MaterialsGive[] = {{"LSDp",1}};
        Text = "STR_Process_LSD";
        //ScrollText = "Refine Iron";
        NoLicenseCost = 50000;
    };

    class sand {
        MaterialsReq[] = {{"sand",1}};
        MaterialsGive[] = {{"glass",1}};
        Text = "STR_Process_Sand";
        //ScrollText = "Melt Sand into Glass";
        NoLicenseCost = 1500;
    };

    class salt {
        MaterialsReq[] = {{"salt_unrefined",1}};
        MaterialsGive[] = {{"salt_refined",1}};
        Text = "STR_Process_Salt";
        //ScrollText = "Refine Salt";
        NoLicenseCost = 1500;
    };

    class cocaine {
        MaterialsReq[] = {{"cocaine_unprocessed",1}};
        MaterialsGive[] = {{"cocaine_processed",1}};
        Text = "STR_Process_Cocaine";
        //ScrollText = "Process Cocaine";
        NoLicenseCost = 50000;
    };
	
    class uranium1 {
        MaterialsReq[] = {{"uranium1",1}};
        MaterialsGive[] = {{"uranium2",1}};
        Text = "STR_Process_uranium1";
		//ScrollText = "Process Uranium";
		NoLicenseCost = 3000000;
    };
	
    class uranium2 {
        MaterialsReq[] = {{"uranium2",1}};
        MaterialsGive[] = {{"uranium3",1}};
        Text = "STR_Process_uranium2";
        //ScrollText = "Process Uranium";
    };
	
    class uranium3 {
        MaterialsReq[] = {{"uranium3",1}};
        MaterialsGive[] = {{"uranium4",1}};
        Text = "STR_Process_uranium3";
        //ScrollText = "Process Uranium";
    };
	
    class uranium4 {
        MaterialsReq[] = {{"uranium4",1}};
        MaterialsGive[] = {{"uranium5",1}};
        Text = "STR_Process_uranium4";
        //ScrollText = "Process Uranium";
    };

    class meth {
        MaterialsReq[] = {{"methu",1}};
        MaterialsGive[] = {{"methp",1}};
        Text = "STR_Process_meth";
        //ScrollText = "Cook Meth";
        NoLicenseCost = 50000;
    };
	
    class tabaco {
        MaterialsReq[] = {{"tabacou",1}};
        MaterialsGive[] = {{"tabacop",1}};
        Text = "STR_Process_tabaco";
        //ScrollText = "Harvest Marijuana";
        NoLicenseCost = 30000;
    };
	
    class marijuana {
        MaterialsReq[] = {{"cannabis",1}};
        MaterialsGive[] = {{"marijuana",1}};
        Text = "STR_Process_Marijuana";
        //ScrollText = "Harvest Marijuana";
        NoLicenseCost = 10000;
    };

    class cement {
        MaterialsReq[] = {{"rock",1}};
        MaterialsGive[] = {{"cement",1}};
        Text = "STR_Process_Cement";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 1000;
    };
	
	class ruby {
        MaterialsReq[] = {{"ruby_raw",1}};
        MaterialsGive[] = {{"ruby_refined",1}};
        Text = "STR_Process_Ruby";
        ScrollText = "Refine Ruby";
        NoLicenseCost = 5000;
    };
	
	class apple {
		MaterialsReq[] = {{"apple",10}};
		MaterialsGive[] = {{"apple_cider",1}};
		Text = "STR_Process_Apple";
		ScrollText = "Apple Process";
		NoLicenseCost = 400;
	};
};
