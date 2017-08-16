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
    class kupfer {
        MaterialsReq[] = {{"kupfererz",1}};
        MaterialsGive[] = {{"kupferbarren",1}};
        Text = "STR_Process_kupfer";
        NoLicenseCost = 2500;
    };

    class eisen {
        MaterialsReq[] = {{"eisenerz",1}};
        MaterialsGive[] = {{"eisenbarren",1}};
        Text = "STR_Process_eisen";
        NoLicenseCost = 2500;
    };

    class apfel {
        MaterialsReq[] = {{"apfel",1}};
        MaterialsGive[] = {{"apfelsaft",1}};
        Text = "STR_Process_apfel";
        NoLicenseCost = 1000;
    };

    class pfirsich {
        MaterialsReq[] = {{"pfirsich",1}};
        MaterialsGive[] = {{"pfirsichsaft",1}};
        Text = "STR_Process_pfirsich";
        NoLicenseCost = 1000;
    };

    class kirsche {
        MaterialsReq[] = {{"kirsche",1}};
        MaterialsGive[] = {{"kirschsaft",1}};
        Text = "STR_Process_kirsche";
        NoLicenseCost = 1000;
    };

    class banane {
        MaterialsReq[] = {{"banane",1}};
        MaterialsGive[] = {{"bananensaft",1}};
        Text = "STR_Process_banane";
        NoLicenseCost = 1000;
    };

    class hanf {
        MaterialsReq[] = {{"hanfpflanze",1}};
        MaterialsGive[] = {{"hanf",1}};
        Text = "STR_Process_hanf";
        NoLicenseCost = 12000;
    };

    class heroin {
        MaterialsReq[] = {{"heroin",1}};
        MaterialsGive[] = {{"heroinpulver",1}};
        Text = "STR_Process_heroin";
        NoLicenseCost = 12000;
    };

    class kokain {
        MaterialsReq[] = {{"kokainstrauch",1}};
        MaterialsGive[] = {{"kokainpulver",1}};
        Text = "STR_Process_Cocaine";
        NoLicenseCost = 12000;
    };

    class relikte {
        MaterialsReq[] = {{"relikte",1}};
        MaterialsGive[] = {{"reliktesauber",1}};
        Text = "STR_Process_relikte";
        NoLicenseCost = 12500;
    };

    class schildkroete {
        MaterialsReq[] = {{"schildkroeten",1}};
        MaterialsGive[] = {{"schildkroetenfleisch",1}};
        Text = "STR_Process_schildkroete";
        NoLicenseCost = 17500;
    };

    class fisch {
        MaterialsReq[] = {{"fisch",1}};
        MaterialsGive[] = {{"fischkonserve",1}};
        Text = "STR_Process_fisch";
        NoLicenseCost = 1750;
    };

    class holz {
        MaterialsReq[] = {{"holz",1}};
        MaterialsGive[] = {{"holzbrett",1}};
        Text = "STR_Process_holz";
        NoLicenseCost = 10050;
    };

    class glas {
        MaterialsReq[] = {{"sand",1}};
        MaterialsGive[] = {{"glas",1}};
        Text = "STR_Process_glas";
        NoLicenseCost = 15050;
    };

    class diamant {
        MaterialsReq[] = {{"diamantenerz",1}};
        MaterialsGive[] = {{"diamanten",1}};
        Text = "STR_Process_dia";
        NoLicenseCost = 15050;
    };

    class oel {
        MaterialsReq[] = {{"rohoel",1}};
        MaterialsGive[] = {{"benzin",1}};
        Text = "STR_Process_oel";
        NoLicenseCost = 11050;
    };

    class salz {
        MaterialsReq[] = {{"salzerz",1}};
        MaterialsGive[] = {{"salz",1}};
        Text = "STR_Process_salz";
        NoLicenseCost = 11050;
    };

    class zement {
        MaterialsReq[] = {{"stein",1}};
        MaterialsGive[] = {{"zement",1}};
        Text = "STR_Process_zement";
        NoLicenseCost = 7500;
    };

    class kiba {
        MaterialsReq[] = {{"kirschsaft",1}, {"bananensaft",1}};
        MaterialsGive[] = {{"kiba",1}};
        Text = "STR_Process_kiba";
        NoLicenseCost = 1250;
    };

    class kohle {
        MaterialsReq[] = {{"kohle",1}};
        MaterialsGive[] = {{"kohlebriketts",1}};
        Text = "STR_Process_kohle";
        NoLicenseCost = 4750;
    };

    class silber {
        MaterialsReq[] = {{"silbererz",1}};
        MaterialsGive[] = {{"silber",1}};
        Text = "STR_Process_silber";
        NoLicenseCost = 4750;
    };

    class moonshine {
        MaterialsReq[] = {{"gerste",1}, {"maische",1}};
        MaterialsGive[] = {{"moonshine",1}};
        Text = "STR_Process_moonshine";
        NoLicenseCost = 12500;
    };

    class bier {
        MaterialsReq[] = {{"hopfen",1}, {"maische",1}};
        MaterialsGive[] = {{"bier",1}};
        Text = "STR_Process_biere";
        NoLicenseCost = 10500;
    };

    class wein {
        MaterialsReq[] = {{"weintrauben",1}};
        MaterialsGive[] = {{"wein",1}};
        Text = "STR_Process_wein";
        NoLicenseCost = 2000;
    };

    class uran {
        MaterialsReq[] = {{"uranerz",1}};
        MaterialsGive[] = {{"plutonium",1}};
        Text = "STR_Process_uran";
        NoLicenseCost = 35000;
    };

    class pilz {
        MaterialsReq[] = {{"pilz",1}};
        MaterialsGive[] = {{"pilzpulver",1}};
        Text = "STR_Process_pilz";
        NoLicenseCost = 13500;
    };
};
