class tabletmenu
{
idd = 12198;
movingEnable = true;
enableSimulation = true;
duration = 500000;
onLoad = "uiNamespace setVariable [""tabletmenu"", _this select 0]; tabletmenuisopen = 1; [] call fnc_fadephone; ";
onunload = "tabletmenuisopen = 0;";
objects[] = { };
class controls {

class CTRL_PHONE_BG: RscStructuredText
{    
	idc = 7017;
	text = "";
	x = 0.320594 * safezoneW + safezoneX;
	y = 0.305 * safezoneH + safezoneY;
	w = 0.35585 * safezoneW;
	h = 0.3512 * safezoneH;
	ColorBackground[] = {1, 1, 1, 1};
}; 

class tabletbackground: RscPicture
{
	idc = 85441;
	text = "\CG_Client\textures\samsungbg2.paa";
	x = 0.288594 * safezoneW + safezoneX;
	y = 0.203 * safezoneH + safezoneY;
	w = 0.417656 * safezoneW;
	h = 0.561 * safezoneH;
};
class tabletframe: RscPicture
{
	idc = 85442;
	text = "\CG_Client\textures\samsungframe.paa";
	x = 0.288594 * safezoneW + safezoneX;
	y = 0.203 * safezoneH + safezoneY;
	w = 0.417656 * safezoneW;
	h = 0.561 * safezoneH;
};

class tablettime: RscStructuredText
{
	idc = 49284;
	text = "";
	x = 0.52 * safezoneW + safezoneX;
	y = 0.66 * safezoneH + safezoneY;
	w = 0.136562 * safezoneW;
	h = 0.0188889 * safezoneH;
};

//tablettext
class citynametext: RscStructuredText
{
	idc = 55210;
	text = "";
	x = 0.365626 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.170156 * safezoneW;
	h = 0.044 * safezoneH;
};
class Dateandyear: RscStructuredText
{
	idc = 55214;
	text = "";
	x = 0.365885 * safezoneW + safezoneX;
	y = 0.352 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
};
class weatherinfo: RscStructuredText
{
	idc = 55211;
	text = "";
	x = 0.364687 * safezoneW + safezoneX;
	y = 0.411556 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.022 * safezoneH;
};
class weathertype: RscStructuredText
{
	idc = 55212;
	text = "";
	x = 0.365625 * safezoneW + safezoneX;
	y = 0.384037 * safezoneH + safezoneY;
	w = 0.170156 * safezoneW;
	h = 0.033 * safezoneH;
};
class grade: RscStructuredText
{
	idc = 55213;
	text = "";
	x = 0.366145 * safezoneW + safezoneX;
	y = 0.435 * safezoneH + safezoneY;
	w = 0.170156 * safezoneW;
	h = 0.055 * safezoneH;
};
class returnbutton: RscButtonSilent
{
	idc = 43101;
	text = "";
	x = 0.322625 * safezoneW + safezoneX;
	y = 0.66126 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.022 * safezoneH;
};
// APPBUTTONS
// APPBUTTONS
class appbutton1: RscButtonSilent
{
	idc = 85700;
	text = "";
	x = 0.545 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; _selectedapp = 0; [_selectedapp] call fnc_tabletbuttonclick; ";
	onMouseEnter = "_onmouse = 1; _appnumber = 0; [_appnumber,_onmouse] call fnc_tabletbuttonenter;";
	onMouseExit = "_onmouse = 0; _appnumber = 0; [_appnumber,_onmouse] call fnc_tabletbuttonenter;";
};
class appbutton2: RscButtonSilent
{
	idc = 85701;
	text = "";
	x = 0.587 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; _selectedapp = 1; [_selectedapp] call fnc_tabletbuttonclick; ";
	onMouseEnter = "_onmouse = 1; _appnumber = 1; [_appnumber,_onmouse] call fnc_tabletbuttonenter;";
	onMouseExit = "_onmouse = 0; _appnumber = 1; [_appnumber,_onmouse] call fnc_tabletbuttonenter;";
};
class appbutton3: RscButtonSilent
{
	idc = 85702;
	text = "";
	x = 0.629 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; _selectedapp = 2; [_selectedapp] call fnc_tabletbuttonclick; ";
	onMouseEnter = "_onmouse = 1; _appnumber = 2; [_appnumber,_onmouse] call fnc_tabletbuttonenter;";
	onMouseExit = "_onmouse = 0; _appnumber = 2; [_appnumber,_onmouse] call fnc_tabletbuttonenter;";
};
class appbutton4: RscButtonSilent
{
	idc = 85703;
	text = "";
	x = 0.545 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; _selectedapp = 3; [_selectedapp] call fnc_tabletbuttonclick; ";
	onMouseEnter = "_onmouse = 1; _appnumber = 3; [_appnumber,_onmouse] call fnc_tabletbuttonenter;";
	onMouseExit = "_onmouse = 0; _appnumber = 3; [_appnumber,_onmouse] call fnc_tabletbuttonenter;";
};
class appbutton5: RscButtonSilent
{
	idc = 85704;
	text = "";
	x = 0.587 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; _selectedapp = 4; [_selectedapp] call fnc_tabletbuttonclick; ";
	onMouseEnter = "_onmouse = 1; _appnumber = 4; [_appnumber,_onmouse] call fnc_tabletbuttonenter;";
	onMouseExit = "_onmouse = 0; _appnumber = 4; [_appnumber,_onmouse] call fnc_tabletbuttonenter;";
};

class appbutton6: RscButtonSilent
{
	idc = 85705;
	text = "";
	x = 0.629 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; [] spawn fnc_trytaxi;";
};
class appbutton7: RscButtonSilent
{
	idc = 85706;
	text = "";
	x = 0.545 * safezoneW + safezoneX;
	y = 0.451 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; [] call life_fnc_helpMenu;";
};
class appbutton8: RscButtonSilent
{
	idc = 85707;
	text = "";
	x = 0.587 * safezoneW + safezoneX;
	y = 0.451 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; [] spawn life_fnc_animMenu;";
};
class appbutton9: RscButtonSilent
{
	idc = 85708;
	text = "";
	x = 0.629 * safezoneW + safezoneX;
	y = 0.451 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; [] spawn fnc_joinPaintball;";
};


class appbutton10: RscButtonSilent
{
	idc = 85709;
	text = "";
	x = 0.545 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; [] spawn life_fnc_race;";
};

class appbutton11: RscButtonSilent
{
	idc = 85710;
	text = "";
	x = 0.587 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; [] spawn life_fnc_race2;";
};













class appbutton12: RscButtonSilent
{
	idc = 85711;
	text = "";
	x = 0.326 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; [] spawn fnc_trycall;";
};

class appbutton13: RscButtonSilent
{
	idc = 85712;
	text = "";
	x = 0.369 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; [] spawn fnc_tryhangup;";
};

class appbutton14: RscButtonSilent
{
	idc = 85713;
	text = "";
	x = 0.412 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "closedialog 0; [] spawn fnc_phoneDisabled;";
};

class appbutton15: RscButtonSilent
{
	idc = 85714;
	text = "";
	x = 0.326 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "[] spawn fnc_iVol;";
};

class appbutton16: RscButtonSilent
{
	idc = 85715;
	text = "";
	x = 0.369 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "[] spawn fnc_dVol;";
};

class appbutton17: RscButtonSilent
{
	idc = 85716;
	text = "";
	x = 0.412 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "[] spawn fnc_speakermode;";
};

class appbutton18: RscButtonSilent
{
	idc = 85717;
	text = "";
	x = 0.326 * safezoneW + safezoneX;
	y = 0.451 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "[] spawn fnc_CurrentCallMenu;";
};

class appbutton19: RscButtonSilent
{
	idc = 85718;
	text = "";
	x = 0.369 * safezoneW + safezoneX;
	y = 0.451 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "[] spawn fnc_stereoRotation;";
};





class appbutton20: RscButtonSilent
{
	idc = 85719;
	text = "";
	x = 0.326 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "[] call fnc_ChangePolice;";
};

class appbutton21: RscButtonSilent
{
	idc = 85720;
	text = "";
	x = 0.369 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "[] call fnc_ChangeDoc;";
};

class appbutton22: RscButtonSilent
{
	idc = 85721;
	text = "";
	x = 0.412 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
	action = "[] call fnc_ChangeEMS;";
};




// APPICONPLACE
class app1: RscPicture
{
	idc = 85444;
	text = "";
	x = 0.545 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app2: RscPicture
{
	idc = 85446;
	text = "";
	x = 0.587 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app3: RscPicture
{
	idc = 85448;
	text = "";
	x = 0.629 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app4: RscPicture
{
	idc = 85450;
	text = "";
	x = 0.545 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app5: RscPicture
{
	idc = 85452;
	text = "";
	x = 0.587 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app6: RscPicture
{
	idc = 85454;
	text = "";
	x = 0.629 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app7: RscPicture
{
	idc = 85456;
	text = "";
	x = 0.545 * safezoneW + safezoneX;
	y = 0.451 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app8: RscPicture
{
	idc = 85458;
	text = "";
	x = 0.587 * safezoneW + safezoneX;
	y = 0.451 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app9: RscPicture
{
	idc = 85460;
	text = "";
	x = 0.629 * safezoneW + safezoneX;
	y = 0.451 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};

class app10: RscPicture
{
	idc = 85462;
	text = "";
	x = 0.545 * safezoneW + safezoneX;
	y = 0.520 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app11: RscPicture
{
	idc = 85464;
	text = "";
	x = 0.587 * safezoneW + safezoneX;
	y = 0.520 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};



//answer call
class app12: RscPicture
{
	idc = 85466;
	text = "";
	x = 0.326 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};

//end call
class app13: RscPicture
{
	idc = 85468;
	text = "";
	x = 0.369 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
//disable call
class app14: RscPicture
{
	idc = 85470;
	text = "";
	x = 0.412 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};

//answer call
class app15: RscPicture
{
	idc = 85472;
	text = "";
	x = 0.326 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};

//end call
class app16: RscPicture
{
	idc = 85474;
	text = "";
	x = 0.369 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
//disable call
class app17: RscPicture
{
	idc = 85476;
	text = "";
	x = 0.412 * safezoneW + safezoneX;
	y = 0.382 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};

class app18: RscPicture
{
	idc = 85478;
	text = "";
	x = 0.326 * safezoneW + safezoneX;
	y = 0.451 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app19: RscPicture
{
	idc = 85480;
	text = "";
	x = 0.369 * safezoneW + safezoneX;
	y = 0.451 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};


class app20: RscPicture
{
	idc = 85482;
	text = "";
	x = 0.326 * safezoneW + safezoneX;
	y = 0.520 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};

class app21: RscPicture
{
	idc = 85484;
	text = "";
	x = 0.369 * safezoneW + safezoneX;
	y = 0.520 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};
class app22: RscPicture
{
	idc = 85486;
	text = "";
	x = 0.412 * safezoneW + safezoneX;
	y = 0.520 * safezoneH + safezoneY;
	w = 0.041 * safezoneW;
	h = 0.066 * safezoneH;
};


};
};

class SyncMenu
{
idd = 12198;
movingEnable = true;
enableSimulation = true;
duration = 500000;
onLoad = "uiNamespace setVariable [""syncmenu"", _this select 0]; tabletmenuisopen = 1; [] spawn SOCK_fnc_syncData;";
onunload = "tabletmenuisopen = 0;";
objects[] = { };
class controls {
class background: RscPicture
{
	idc = 98294;
	text = "pics\other\syncmenu\Sync.paa";
	x = 0.288594 * safezoneW + safezoneX;
	y = 0.203 * safezoneH + safezoneY;
	w = 0.417656 * safezoneW;
	h = 0.561 * safezoneH;
};
class backbutton: RscButtonSilent
{
	idc = 51257;
	x = 0.452032 * safezoneW + safezoneX;
	y = 0.571444 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.033 * safezoneH;
	action = "closedialog 0; [] call fnc_opentablet;";
	colorBackground[] = {0.27,0.27,0.27,0.2};
};
};
};