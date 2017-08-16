//Background
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4983];
_ctrl ctrlSetPosition [0.0101559 * safezoneW + safezoneX,0.269 * safezoneH + safezoneY,0.190781 * safezoneW,0.627 * safezoneH];
_ctrl ctrlSetBackgroundColor [0,0,0,0.3];
_ctrl ctrlCommit 0;

//Pic
_ctrl = (findDisplay 12) ctrlCreate ['RscPicture', 4984];
_ctrl ctrlSetPosition [0.159687 * safezoneW + safezoneX,0.258 * safezoneH + safezoneY,0.0464063 * safezoneW,0.077 * safezoneH];
_ctrl ctrlsetText "images\tablet\apps\save.paa";
_ctrl ctrlCommit 0;

//SlideInTitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4980];
_ctrl ctrlSetPosition [0.0101562 * safezoneW + safezoneX,0.247 * safezoneH + safezoneY,0.0979687 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Legende ausblenden";
_ctrl ctrlSetBackgroundColor [0,0,0,0.5];
_ctrl ctrlCommit 0;

//Title
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4985];
_ctrl ctrlSetPosition [0.0153119 * safezoneW + safezoneX,0.269 * safezoneH + safezoneY,0.149531 * safezoneW,0.055 * safezoneH];
_ctrl ctrlsetText "Ortsmarkierungen";
_ctrl ctrlSetScale 1.5;
_ctrl ctrlCommit 0;

//Legaltitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4986];
_ctrl ctrlSetPosition [0.0204687 * safezoneW + safezoneX,0.346 * safezoneH + safezoneY,0.0515625 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Legales";
_ctrl ctrlSetTextColor [0,1,0,0.8];
_ctrl ctrlCommit 0;

//Illegaltitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4987];
_ctrl ctrlSetPosition [0.113281 * safezoneW + safezoneX,0.346 * safezoneH + safezoneY,0.0515625 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Illegales";
_ctrl ctrlSetTextColor [1,0,0,0.8];
_ctrl ctrlCommit 0;

//geschaeftetitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4988];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.467 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Geschäfte:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//vehikelhändlertitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4989];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.5 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Fahrzeughändler & Garagen:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//lizenzämtertitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4990];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.533 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Lizenzämter:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//vehikelServicetitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4991];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.566 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Servicestationen:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//Infrastrukturtitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4992];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.599 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Infrastruktur:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//Müllinformationtitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4993];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.632 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Müllinformationen:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//notdienstetitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4994];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.665 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Notdienste:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//Waffenlädentitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4995];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.698 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Waffen & Jagdhändler:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//Rebelltitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4996];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.731 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Rebellengebiete:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//gruppierungtitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4997];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Gruppierungsgebiete:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//bankautomatentitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4998];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Bankautomaten:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//telefonzellentitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 4999];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.83 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Telefonzellen:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

//toilettentitle
_ctrl = (findDisplay 12) ctrlCreate ['RscText', 5000];
_ctrl ctrlSetPosition [0.0153125 * safezoneW + safezoneX,0.863 * safezoneH + safezoneY,0.180469 * safezoneW,0.022 * safezoneH];
_ctrl ctrlsetText "Toilettenhäuschen:";
_ctrl ctrlSetBackgroundColor [1,1,1,0.3];
_ctrl ctrlCommit 0;

	//----------------------------------------------------------------------

	//legaldropdown
_ctrl = (findDisplay 12) ctrlCreate ['RscCombo', 5001];
_ctrl ctrlSetPosition [0.0204687 * safezoneW + safezoneX,0.379 * safezoneH + safezoneY,0.0773437 * safezoneW,0.022 * safezoneH];
_ctrl lbAdd "Nichts anzeigen";
_ctrl lbAdd "Farmgebiete";
_ctrl lbAdd "Verarbeitungen";
_ctrl lbAdd "Händler";
_ctrl lbAdd "Alles anzeigen";
_ctrl lbSetCurSel 0;
_ctrl ctrlSetEventHandler ["LBSelChanged","[0,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//illegaldropdown
_ctrl = (findDisplay 12) ctrlCreate ['RscCombo', 5002];
_ctrl ctrlSetPosition [0.113281 * safezoneW + safezoneX,0.379 * safezoneH + safezoneY,0.0773437 * safezoneW,0.022 * safezoneH];
_ctrl lbAdd "Nichts anzeigen";
_ctrl lbAdd "Farmgebiete";
_ctrl lbAdd "Verarbeitungen";
_ctrl lbAdd "Händler";
_ctrl lbAdd "Alles anzeigen";
_ctrl lbSetCurSel 0;
if(playerside == west) then {_ctrl ctrlEnable false};
_ctrl ctrlSetEventHandler ["LBSelChanged","[1,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//geschaeftecheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5003];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.467 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 2);
_ctrl ctrlSetEventHandler ["CheckedChanged","[2,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//vehikelgaragecheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5004];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.5 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 3);
_ctrl ctrlSetEventHandler ["CheckedChanged","[3,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//lizenzcheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5005];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.533 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 4);
_ctrl ctrlSetEventHandler ["CheckedChanged","[4,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//vehikelservicecheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5006];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.566 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 5);
_ctrl ctrlSetEventHandler ["CheckedChanged","[5,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//infrastrukturcheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5007];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.599 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 6);
_ctrl ctrlSetEventHandler ["CheckedChanged","[6,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//muellcheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5008];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.632 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 7);
_ctrl ctrlSetEventHandler ["CheckedChanged","[7,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//notdienstecheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5009];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.665 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 8);
_ctrl ctrlSetEventHandler ["CheckedChanged","[8,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//waffencheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5010];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.698 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 9);
_ctrl ctrlSetEventHandler ["CheckedChanged","[9,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//rebellencheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5011];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.731 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 10);
_ctrl ctrlSetEventHandler ["CheckedChanged","[10,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//gruppierungscheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5012];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 11);
_ctrl ctrlSetEventHandler ["CheckedChanged","[11,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//bankautomatencheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5013];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 12);
_ctrl ctrlSetEventHandler ["CheckedChanged","[12,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//telefoncheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5014];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.83 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 13);
_ctrl ctrlSetEventHandler ["CheckedChanged","[13,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;

//toilettencheck
_ctrl = (findDisplay 12) ctrlCreate ['RscCheckbox', 5015];
_ctrl ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.863 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_ctrl cbSetChecked (life_legend select 14);
_ctrl ctrlSetEventHandler ["CheckedChanged","[14,(_this select 1)] call life_fnc_legend;"];
_ctrl ctrlCommit 0;


//buttonslidein
_ctrl = (findDisplay 12) ctrlCreate ['RscActiveText', -1];
_ctrl ctrlSetPosition [0.0101562 * safezoneW + safezoneX,0.247 * safezoneH + safezoneY,0.0979687 * safezoneW,0.022 * safezoneH];
_ctrl buttonSetAction "[15] call life_fnc_legend;";
_ctrl ctrlSetActiveColor [-1,-1,-1,0];
_ctrl ctrlSetBackgroundColor [-1,-1,-1,0];
_ctrl ctrlSetTextColor [-1,-1,-1,0];
_ctrl ctrlSetForegroundColor [-1,-1,-1,0];
_ctrl ctrlSetText "                                         ";
_ctrl ctrlCommit 0;

//savebutton
_ctrl = (findDisplay 12) ctrlCreate ['RscActiveText', 5017];
_ctrl ctrlSetPosition [0.164844 * safezoneW + safezoneX,0.269 * safezoneH + safezoneY,0.0360937 * safezoneW,0.055 * safezoneH];
_ctrl buttonSetAction "[16] call life_fnc_legend;";
_ctrl ctrlSetActiveColor [-1,-1,-1,0];
_ctrl ctrlSetBackgroundColor [-1,-1,-1,0];
_ctrl ctrlSetTextColor [-1,-1,-1,0];
_ctrl ctrlSetForegroundColor [-1,-1,-1,0];
_ctrl ctrlSetText "            ";
_ctrl ctrlSetTooltip "Legende speichern";
_ctrl ctrlCommit 0;