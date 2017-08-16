class CtjFPq {
 idd = 1000;
 name= "CtjFPq";
 movingEnable = 0;
 enableSimulation = 1;
 onLoad = "[] spawn zero_fnc_ICCFKOQk";

 class controlsBackground {
 class hintergrund: aAX
 {
 idc = -1;
 text = "Resources\Textures\Icons\background.jpg";
 x = 0.215941 * safezoneW + safezoneX;
 y = 0.113221 * safezoneH + safezoneY;
 w = 0.566481 * safezoneW;
 h = 0.739284 * safezoneH;
 };
 class FrameUniform1: cKK
 {
 idc = 1801;
 x = 0.5 * safezoneW + safezoneX;
 y = 0.224944 * safezoneH + safezoneY;
 w = 0.263028 * safezoneW;
 h = 0.508304 * safezoneH;
 };
 class FrameUniform2: cKK
 {
 idc = 1802;
 x = 0.226658 * safezoneW + safezoneX;
 y = 0.224944 * safezoneH + safezoneY;
 w = 0.263028 * safezoneW;
 h = 0.506104 * safezoneH;
 };

 class FrameWeapon1: cKK
 {
 idc = 1803;
 x = 0.5 * safezoneW + safezoneX;
 y = 0.224944 * safezoneH + safezoneY;
 w = 0.263028 * safezoneW;
 h = 0.528107 * safezoneH;
 };
 class FrameWeapon2: cKK
 {
 idc = 1804;
 x = 0.226658 * safezoneW + safezoneX;
 y = 0.224944 * safezoneH + safezoneY;
 w = 0.263028 * safezoneW;
 h = 0.528107 * safezoneH;
 };
 class Titel: nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Schliessfach System";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class ButtonClose : MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0;";
 x = 0.763223 * safezoneW + safezoneX;
 y = 0.129926 * safezoneH + safezoneY;
 w = 0.00933829 * safezoneW;
 h = 0.0190177 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };
 };
 class controls {
 class uniformTab: MCHU
 {
 idc = 1002;
 text = "Uniform, Weste, Rucksack"; 
 tooltip = "Uniform, Weste, Rucksack";
 onButtonClick = "[] call zero_fnc_ICCFKOQk";
 sizeEx = ((0.1 * 0.05) * safezoneH);
 x = 0.252445 * safezoneW + safezoneX;
 y = 0.178 * safezoneH + safezoneY;
 w = 0.144407 * safezoneW;
 h = 0.0330067 * safezoneH;
 class Attributes {
 align = "center";
 };
 };
 class weaponTab: MCHU
 {
 idc = 1003;
 text = "Waffen, Aufsätze, Magazine"; 
 tooltip = "Waffen, Aufsätze, Magazine";
 onButtonClick = "[] call zero_fnc_bOCln";
 sizeEx = ((0.1 * 0.05) * safezoneH);
 x = 0.422639 * safezoneW + safezoneX;
 y = 0.178 * safezoneH + safezoneY;
 w = 0.144407 * safezoneW;
 h = 0.0330067 * safezoneH;
 class Attributes {
 align = "center";
 };
 };
 class itemTab: MCHU
 {
 idc = 1004;
 text = "Ausrüstung, Gegenstände"; 
 tooltip = "Ausrüstung, Gegenstände";
 onButtonClick = "[] call zero_fnc_prJpxT";
 sizeEx = ((0.1 * 0.05) * safezoneH);
 x = 0.592833 * safezoneW + safezoneX;
 y = 0.178 * safezoneH + safezoneY;
 w = 0.144407 * safezoneW;
 h = 0.0330067 * safezoneH;
 class Attributes {
 align = "center";
 };
 };
 class headgearList: ZaMJRapk
 {
 idc = 1500;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.231815 * safezoneW + safezoneX + 0.02;
 y = 0.268953 * safezoneH + safezoneY;
 w = 0.144407 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_SKNFk; true";
 };
 class headgearPlayer: ZaMJRapk
 {
 idc = 1501;
 sizeEx = ((0.18 * 0.55) * safezoneH);
 x = 0.396852 * safezoneW + safezoneX + 0.02;
 y = 0.268951 * safezoneH + safezoneY;
 w = 0.06 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_SKNFk; true";
 };
 class gogglesList: ZaMJRapk
 {
 idc = 1502;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.231815 * safezoneW + safezoneX + 0.02;
 y = 0.422982 * safezoneH + safezoneY;
 w = 0.144407 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_FrPaPO; true";
 };
 class gogglesPlayer: ZaMJRapk
 {
 idc = 1503;
 sizeEx = ((0.18 * 0.55) * safezoneH);
 x = 0.396852 * safezoneW + safezoneX + 0.02;
 y = 0.422982 * safezoneH + safezoneY;
 w = 0.06 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_FrPaPO; true";
 };
 class uniformList: ZaMJRapk
 {
 idc = 1504;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.510315 * safezoneW + safezoneX + 0.02;
 y = 0.268951 * safezoneH + safezoneY;
 w = 0.144407 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_OXroQQNEM; true";
 };
 class uniformPlayer: ZaMJRapk
 {
 idc = 1505;
 sizeEx = ((0.18 * 0.55) * safezoneH);
 x = 0.675352 * safezoneW + safezoneX + 0.02;
 y = 0.268951 * safezoneH + safezoneY;
 w = 0.06 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_OXroQQNEM; true";
 };
 class vestList: ZaMJRapk
 {
 idc = 1506;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.510315 * safezoneW + safezoneX + 0.02;
 y = 0.422982 * safezoneH + safezoneY;
 w = 0.144407 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_CQNCLsNLt; true";
 };
 class vestPlayer: ZaMJRapk
 {
 idc = 1507;
 sizeEx = ((0.18 * 0.55) * safezoneH);
 x = 0.675352 * safezoneW + safezoneX + 0.02;
 y = 0.422982 * safezoneH + safezoneY;
 w = 0.06 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_CQNCLsNLt; true";
 };
 class backpackList: ZaMJRapk
 {
 idc = 1508;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.510315 * safezoneW + safezoneX + 0.02;
 y = 0.577013 * safezoneH + safezoneY;
 w = 0.144407 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_tJp; true";
 };
 class backpackPlayer: ZaMJRapk
 {
 idc = 1509;
 sizeEx = ((0.18 * 0.55) * safezoneH);
 x = 0.675352 * safezoneW + safezoneX + 0.02;
 y = 0.577013 * safezoneH + safezoneY;
 w = 0.06 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_tJp; true";
 };
 class binoularList: ZaMJRapk
 {
 idc = 1510;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.231815 * safezoneW + safezoneX + 0.02;
 y = 0.577013 * safezoneH + safezoneY;
 w = 0.144407 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_tqKWWEepw; true";
 };
 class binocularPlayer: ZaMJRapk
 {
 idc = 1511;
 sizeEx = ((0.18 * 0.55) * safezoneH);
 x = 0.396852 * safezoneW + safezoneX + 0.02;
 y = 0.577013 * safezoneH + safezoneY;
 w = 0.06 * safezoneW;
 h = 0.110022 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_tqKWWEepw; true";
 };
 class primaryWeaponList: ZaMJRapk
 {
 idc = 1600;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.26276 * safezoneW + safezoneX;
 y = 0.246949 * safezoneH + safezoneY;
 w = 0.185666 * safezoneW;
 h = 0.0880179 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_ObXxdCrL; true";
 };
 class primaryWeaponPlayer: ZaMJRapk
 {
 idc = 1601;
 sizeEx = ((0.16 * 0.55) * safezoneH);
 x = 0.530944 * safezoneW + safezoneX;
 y = 0.246949 * safezoneH + safezoneY;
 w = 0.11 * safezoneW;
 h = 0.0880179 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_ObXxdCrL; true";
 };
 class primaryItemSilencer: ZaMJRapk
 {
 idc = 1602;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Schalldämpfer";
 x = 0.670194 * safezoneW + safezoneX;
 y = 0.235946 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'silencer'] call zero_fnc_JGF; true";
 };
 class primaryItemOptic: ZaMJRapk
 {
 idc = 1603;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Visier";
 x = 0.706296 * safezoneW + safezoneX;
 y = 0.235946 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'optic'] call zero_fnc_JGF; true";
 };
 class primaryItemPointer: ZaMJRapk
 {
 idc = 1604;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Pointer";
 x = 0.670194 * safezoneW + safezoneX;
 y = 0.30196 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'pointer'] call zero_fnc_JGF; true";
 };
 class primaryItemBipod: ZaMJRapk
 {
 idc = 1605;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Zweibein";
 x = 0.706296 * safezoneW + safezoneX;
 y = 0.30196 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'bipod'] call zero_fnc_JGF; true";
 };
 class secondaryWeaponList: ZaMJRapk
 {
 idc = 1606;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.26276 * safezoneW + safezoneX;
 y = 0.378975 * safezoneH + safezoneY;
 w = 0.185666 * safezoneW;
 h = 0.0880179 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_eEyhLL; true";
 };
 class secondaryWeaponPlayer: ZaMJRapk
 {
 idc = 1607;
 sizeEx = ((0.16 * 0.55) * safezoneH);
 x = 0.530944 * safezoneW + safezoneX;
 y = 0.378975 * safezoneH + safezoneY;
 w = 0.11 * safezoneW;
 h = 0.0880179 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_eEyhLL; true";
 };
 class secondaryItem1: ZaMJRapk
 {
 idc = 1608;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Schalldämpfer";
 x = 0.670194 * safezoneW + safezoneX;
 y = 0.367973 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'silencer'] call zero_fnc_AokrDNwds; true";
 };
 class secondaryItem2: ZaMJRapk
 {
 idc = 1609;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Visier";
 x = 0.670194 * safezoneW + safezoneX;
 y = 0.433987 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'pointer'] call zero_fnc_AokrDNwds; true";
 };
 class secondaryItem3: ZaMJRapk
 {
 idc = 1610;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Pointer";
 x = 0.706296 * safezoneW + safezoneX;
 y = 0.367973 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'optic'] call zero_fnc_AokrDNwds; true";
 };
 class secondaryItem4: ZaMJRapk
 {
 idc = 1611;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Zweibein";
 x = 0.706296 * safezoneW + safezoneX;
 y = 0.433987 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'bipod'] call zero_fnc_AokrDNwds; true";
 };
 class handgunWeaponList: ZaMJRapk
 {
 idc = 1612;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.26276 * safezoneW + safezoneX;
 y = 0.511002 * safezoneH + safezoneY;
 w = 0.185666 * safezoneW;
 h = 0.0880179 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_lwbjPlNfl; true";
 };
 class handgunWeaponPlayer: ZaMJRapk
 {
 idc = 1613;
 sizeEx = ((0.16 * 0.55) * safezoneH);
 x = 0.530944 * safezoneW + safezoneX;
 y = 0.511002 * safezoneH + safezoneY;
 w = 0.11 * safezoneW;
 h = 0.0880179 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_lwbjPlNfl; true";
 };
 class handungItem1: ZaMJRapk
 {
 idc = 1614;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Schalldämpfer";
 x = 0.670194 * safezoneW + safezoneX;
 y = 0.5 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'silencer'] call zero_fnc_LVDLOF; true";
 };
 class handungItem2: ZaMJRapk
 {
 idc = 1615;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Visier";
 x = 0.670194 * safezoneW + safezoneX;
 y = 0.566013 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'pointer'] call zero_fnc_LVDLOF; true";
 };
 class handungItem3: ZaMJRapk
 {
 idc = 1616;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Pointer";
 x = 0.706296 * safezoneW + safezoneX;
 y = 0.5 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'optic'] call zero_fnc_LVDLOF; true";
 };
 class handgunItem4: ZaMJRapk
 {
 idc = 1617;
 sizeEx = ((0.07 * 0.55) * safezoneH);
 tooltip = "Zweibein";
 x = 0.706296 * safezoneW + safezoneX;
 y = 0.566013 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.044009 * safezoneH;
 canDrag = 1;
 onLBDrop = "[_this,'bipod'] call zero_fnc_LVDLOF; true";
 };
 class magazineList: ZaMJRapk
 {
 idc = 1618;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.26276 * safezoneW + safezoneX;
 y = 0.643029 * safezoneH + safezoneY;
 w = 0.185666 * safezoneW;
 h = 0.0880179 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_QiZZdu; true";
 onLBSelChanged = "_this call zero_fnc_pOVyTlOA";
 onMouseButtonDblClick = "_this call zero_fnc_HkYX";
 };
 class magazinePlayer: ZaMJRapk
 {
 idc = 1619;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.530944 * safezoneW + safezoneX;
 y = 0.643029 * safezoneH + safezoneY;
 w = 0.185666 * safezoneW;
 h = 0.0880179 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_QiZZdu; true";
 onLBSelChanged = "_this call zero_fnc_pOVyTlOA";
 onMouseButtonDblClick = "_this call zero_fnc_HkYX";
 };
 class magazineLockerEdit: IkurrfNqo
 {
 idc = 1620;
 text = "0";
 x = 0.458741 * safezoneW + safezoneX;
 y = 0.665034 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.0330067 * safezoneH;
 };
 class magazinePlayerEdit: IkurrfNqo
 {
 idc = 1621;
 text = "0";
 x = 0.726926 * safezoneW + safezoneX;
 y = 0.665034 * safezoneH + safezoneY;
 w = 0.025787 * safezoneW;
 h = 0.0330067 * safezoneH;
 };

 
 class lockerItemList: ZaMJRapk
 {
 idc = 1700;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.26276 * safezoneW + safezoneX;
 y = 0.246949 * safezoneH + safezoneY;
 w = 0.190824 * safezoneW;
 h = 0.484098 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_yFOQzkbp; true";
 onMouseButtonDblClick = "_this call zero_fnc_tpgFD";
 };
 class playerItemList: ZaMJRapk
 {
 idc = 1701;
 sizeEx = ((0.35 * 0.05) * safezoneH);
 x = 0.536102 * safezoneW + safezoneX;
 y = 0.246949 * safezoneH + safezoneY;
 w = 0.190824 * safezoneW;
 h = 0.484098 * safezoneH;
 canDrag = 1;
 onLBDrop = "_this call zero_fnc_yFOQzkbp; true";
 onMouseButtonDblClick = "_this call zero_fnc_tpgFD";
 };
 };
};
