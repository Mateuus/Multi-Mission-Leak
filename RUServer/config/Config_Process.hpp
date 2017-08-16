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
    class tobaccoCigarU {
        MaterialsReq[] = {{"tobacco_leaf",1}}; //2
        MaterialsGive[] = {{"tobacco_rolled",1}};
        Text = "STR_Process_Tobacco";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
    };
    class tobaccoCigar {
        MaterialsReq[] = {{"tobacco_rolled",1}};
        MaterialsGive[] = {{"tobacco_cigar",1}};
        Text = "STR_Process_Tobacco";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
     };
     class tobaccoCigarretteU {
        MaterialsReq[] = {{"tobacco_leaf",1}};
        MaterialsGive[] = {{"tobacco_dried",1}};
        Text = "STR_Process_Tobacco";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
     };
     class tobaccoCigarretteP {
        MaterialsReq[] = {{"tobacco_dried",1}};
        MaterialsGive[] = {{"tobacco_crushed",1}};
        Text = "STR_Process_Tobacco";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
     };
     class tobaccoCigarrette {
        MaterialsReq[] = {{"tobacco_crushed",1}};
        MaterialsGive[] = {{"tobacco_cigarrette",2}};
        Text = "STR_Process_Tobacco";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
     };

     class uran_raw {
        MaterialsReq[] = {{"uran_raw",1}};
        MaterialsGive[] = {{"uran_filter",1}};
        Text = "STR_Process_UranRaw";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
     };
     class uran_filter {
        MaterialsReq[] = {{"uran_filter",1}};
        MaterialsGive[] = {{"uran_rein",1}};
        Text = "STR_Process_UranFilter";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
     };
     class uran_rein {
        MaterialsReq[] = {{"uran_rein",1}};
        MaterialsGive[] = {{"uran_pure",1}};
        Text = "STR_Process_UranRein";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
     };
     class uran_pure {
        MaterialsReq[] = {{"uran_pure",1}};
        MaterialsGive[] = {{"uran",1}};
        Text = "STR_Process_UranPure";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
     };

     //Animals
     class turtle {
        MaterialsReq[] = {{"turtle_raw",1}};
        MaterialsGive[] = {{"turtle_soup",1}};
        Text = "STR_Process_Turtle";
        //ScrollText = "Process Tobacco";
        NoLicenseCost = 1500; //optional price
     };
};
