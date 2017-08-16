switch (true) do
{

    case (["2Xp",Servername] call BIS_fnc_inString):{ ES_xp_multiplikator = 2; };
    case (["3Xp",Servername] call BIS_fnc_inString):{ ES_xp_multiplikator = 3; };
    case (["4Xp",Servername] call BIS_fnc_inString):{ ES_xp_multiplikator = 4; };

    default { ES_xp_multiplikator = 1; };
};

ES_NachrichtDialog = false;
ES_NachrichtFarbe = "#00CC00";
ES_Nachricht = "Eisenschmiede Altis Life Gewinnspiel!";
ES_NachrichtLink = "http://eisenschmiede-gaming.de/gewinnspiel/index.php";

InfoColor = "FFFFFF";

switch (worldName) do
{

	case "Altis":{ InfoText = "www.Eisenschmiede-Gaming.de"; CurrentMode = "Altis"; };
	case "Stratis":{ InfoText = "www.Eisenschmiede-Gaming.de"; CurrentMode = "Stratis"; };
	case "Tanoa":{ InfoText = "www.Tanoa-Life.de"; CurrentMode = "Tanoa"; };
	case "VR":{ InfoText = "www.Eisenschmiede-Gaming.de"; CurrentMode = "VR"; };

	default { InfoText = "www.Eisenschmiede-Gaming.de"; CurrentMode = "default"; };
};

MaverickistAn = false;
MaverickWhistList = ["76561198083647822","",""];

VerboteneWaffen = ["MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F"];
VerboteneUniformen = ["U_VirtualMan_F","U_I_Protagonist_VR"];
VerboteneWesten = ["V_PlateCarrierIAGL_oli","V_PlateCarrierSpec_mtp","V_PlateCarrierGL_mtp","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_rgr"];

ES_ATMhacked = 0;

save_veh_virtualItems = false;
save_playerStats = true;

clothing_box = false;
clothing_noTP = false;
fuel_cost = 100;

FBIOnlySkin = ["76561198126717434","76561198221513832"];
SWATOnlySkin = ["76561198221513832"];

KeinSeilFeuerwehr = true;

publicVariable "MaverickistAn";
publicVariable "MaverickWhistList";
publicVariable "VerboteneWaffen";
publicVariable "VerboteneUniformen";
publicVariable "VerboteneWesten";
publicVariable "ES_NachrichtDialog";
publicVariable "ES_NachrichtFarbe";
publicVariable "ES_Nachricht";
publicVariable "ES_NachrichtLink";
publicVariable "InfoColor";
publicVariable "InfoText";
publicVariable "ES_ATMhacked";
publicVariable "save_veh_virtualItems";
publicVariable "save_playerStats";
publicVariable "clothing_box";
publicVariable "clothing_noTP";
publicVariable "fuel_cost";
publicVariable "FBIOnlySkin";
publicVariable "SWATOnlySkin";
publicVariable "KeinSeilFeuerwehr";
publicVariable "ES_xp_multiplikator";
publicVariable "CurrentMode";