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
    class oil {
        MaterialsReq[] = {{"oil_unprocessed",1}};
        MaterialsGive[] = {{"oil_processed",1}};
        Text = "STR_Process_Oil";
        //ScrollText = "Process Oil";
        NoLicenseCost = 1200;
    };

    class diamond {
        MaterialsReq[] = {{"diamond_uncut",1}};
        MaterialsGive[] = {{"diamond_cut",1}};
        Text = "STR_Process_Diamond";
        //ScrollText = "Cut Diamonds";
        NoLicenseCost = 1350;
    };

    class heroin {
        MaterialsReq[] = {{"heroin_unprocessed",1}};
        MaterialsGive[] = {{"heroin_processed",1}};
        Text = "STR_Process_Heroin";
        //ScrollText = "Process Heroin";
        NoLicenseCost = 1750;
    };

    class copper {
        MaterialsReq[] = {{"copper_unrefined",1}};
        MaterialsGive[] = {{"copper_refined",1}};
        Text = "STR_Process_Copper";
        //ScrollText = "Refine Copper";
        NoLicenseCost = 750;
    };

    class iron {
        MaterialsReq[] = {{"iron_unrefined",1}};
        MaterialsGive[] = {{"iron_refined",1}};
        Text = "STR_Process_Iron";
        //ScrollText = "Refine Iron";
        NoLicenseCost = 1120;
    };

    class sand {
        MaterialsReq[] = {{"sand",1}};
        MaterialsGive[] = {{"glass",1}};
        Text = "STR_Process_Sand";
        //ScrollText = "Melt Sand into Glass";
        NoLicenseCost = 650;
    };

    class salt {
        MaterialsReq[] = {{"salt_unrefined",1}};
        MaterialsGive[] = {{"salt_refined",1}};
        Text = "STR_Process_Salt";
        //ScrollText = "Refine Salt";
        NoLicenseCost = 450;
    };

    class cocaine {
        MaterialsReq[] = {{"cocaine_unprocessed",1}};
        MaterialsGive[] = {{"cocaine_processed",1}};
        Text = "STR_Process_Cocaine";
        //ScrollText = "Process Cocaine";
        NoLicenseCost = 1500;
    };

    class marijuana {
        MaterialsReq[] = {{"cannabis",1}};
        MaterialsGive[] = {{"marijuana",1}};
        Text = "STR_Process_Marijuana";
        //ScrollText = "Harvest Marijuana";
        NoLicenseCost = 500;
    };

    class cement {
        MaterialsReq[] = {{"rock",1}};
        MaterialsGive[] = {{"cement",1}};
        Text = "STR_Process_Cement";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 350;
    };
    //Custom

	class rubber {
            MaterialsReq[] = {{"rubberU",1}};
            MaterialsGive[] = {{"rubber",1}};
            Text = "STR_Process_rubber";
            //ScrollText = "Mix Cement";
            NoLicenseCost = 5500;
	};

	class gunpowder {
            MaterialsReq[] = {{"sulfur",1}};
            MaterialsGive[] = {{"gunpowder",1}};
            Text = "STR_Process_gunpowder";
            //ScrollText = "Mix Cement";
            NoLicenseCost = 6500;
	};

	class C4 {
            MaterialsReq[] = {{"nitroamine",1}};
            MaterialsGive[] = {{"C4",1}};
            Text = "STR_Process_C4";
            //ScrollText = "Mix Cement";
            NoLicenseCost = 11500;
	};

	class steelplate {
            MaterialsReq[] = {{"steel",1}};
            MaterialsGive[] = {{"steelplate",1}};
            Text = "STR_Process_steelplate";
            //ScrollText = "Mix Cement";
            NoLicenseCost = 7500;
	};

	class cloth {
            MaterialsReq[] = {{"wool",1}};
            MaterialsGive[] = {{"cloth",1}};
            Text = "STR_Process_cloth";
            //ScrollText = "Mix Cement";
            NoLicenseCost = 11500;
	};

    class lumber {
        MaterialsReq[] = {{"lumber",1}};
        MaterialsGive[] = {{"timber",1}};
        Text = "STR_Processing_lumber";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 500;
    };

    class lsd {
        MaterialsReq[] = {{"mushrooms",1}};
        MaterialsGive[] = {{"LSD",1}};
        Text = "STR_Process_LSD";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 0;
    };

    class ruby {
        MaterialsReq[] = {{"rubyU",1}};
        MaterialsGive[] = {{"rubyC",1}};
        Text = "STR_Process_Ruby";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 0;
    };

    class uranium {
        MaterialsReq[] = {{"uraniumU",1}};
        MaterialsGive[] = {{"uranium",1}};
        Text = "STR_Process_uranium";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 0;
    };
};
