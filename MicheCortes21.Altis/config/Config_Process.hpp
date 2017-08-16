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
        NoLicenseCost = 9000;
    };

    class diamond {
        MaterialsReq[] = {{"diamond_uncut",1}};
        MaterialsGive[] = {{"diamond_cut",1}};
        Text = "STR_Process_Diamond";
        //ScrollText = "Cut Diamonds";
        NoLicenseCost = 6000;
    };

    class heroin {
        MaterialsReq[] = {{"heroin_unprocessed",1}};
        MaterialsGive[] = {{"heroin_processed",1}};
        Text = "STR_Process_Heroin";
        //ScrollText = "Process Heroin";
        NoLicenseCost = 15000;
    };

    class copper {
        MaterialsReq[] = {{"copper_unrefined",1}};
        MaterialsGive[] = {{"copper_refined",1}};
        Text = "STR_Process_Copper";
        //ScrollText = "Refine Copper";
        NoLicenseCost = 2000;
    };
	
    class kakao {
        MaterialsReq[] = {{"kakao_unrefined",1}};
        MaterialsGive[] = {{"schokolade_refined",1}};
        Text = "STR_Process_Kakao";
        //ScrollText = "Refine Kakao";
        NoLicenseCost = 3000;
    };
	
    class muschel {
        MaterialsReq[] = {{"muschel_unrefined",1}};
        MaterialsGive[] = {{"perle_refined",1}};
        Text = "STR_Process_Muschel";
        //ScrollText = "Refine muschel";
        NoLicenseCost = 18000;
    };
	
    class holz {
        MaterialsReq[] = {{"holz_unrefined",1}};
        MaterialsGive[] = {{"holzkohle_refined",1}};
        Text = "STR_Process_Holz";
        //ScrollText = "Refine Holz";
        NoLicenseCost = 7000;
    };

    class iron {
        MaterialsReq[] = {{"iron_unrefined",1}};
        MaterialsGive[] = {{"iron_refined",1}};
        Text = "STR_Process_Iron";
        //ScrollText = "Refine Iron";
        NoLicenseCost = 2000;
    };
	
    class silber {
        MaterialsReq[] = {{"silber_unrefined",1}};
        MaterialsGive[] = {{"silber_refined",1}};
        Text = "STR_Process_Silber";
        //ScrollText = "Refine Silber";
        NoLicenseCost = 6900;
    };
	
    class tea {
        MaterialsReq[] = {{"tea_unrefined",1}};
        MaterialsGive[] = {{"tea_refined",1}};
        Text = "STR_Process_Tea";
        //ScrollText = "Refine Tea";
        NoLicenseCost = 5000;
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
        NoLicenseCost = 13000;
    };

    class cocaine {
        MaterialsReq[] = {{"cocaine_unprocessed",1}};
        MaterialsGive[] = {{"cocaine_processed",1}};
        Text = "STR_Process_Cocaine";
        //ScrollText = "Process Cocaine";
        NoLicenseCost = 15000;
    };

    class marijuana {
        MaterialsReq[] = {{"cannabis",1}};
        MaterialsGive[] = {{"marijuana",1}};
        Text = "STR_Process_Marijuana";
        //ScrollText = "Harvest Marijuana";
        NoLicenseCost = 15000;
    };
	
	class lsd {
        MaterialsReq[] = {{"lsd_unprocessed",1}};
        MaterialsGive[] = {{"lsd_processed",1}};
        Text = "STR_Process_Lsd";
        //ScrollText = "Process Frogs";
        NoLicenseCost = 999999;
    };

    class cement {
        MaterialsReq[] = {{"rock",1}};
        MaterialsGive[] = {{"cement",1}};
        Text = "STR_Process_Cement";
        //ScrollText = "Mix Cement";
        NoLicenseCost = 3900;
    };
};
