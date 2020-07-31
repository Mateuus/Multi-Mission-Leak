/*
Lakeside Spray Menu
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Btn11 37460
#define Btn12 37461
#define Btn13 37462
#define Btn14 37463
#define Btn15 37464
#define Btn16 37465
#define Btn17 37466
#define Btn18 37467
#define Btn19 37468
#define Btn20 37469
#define Btn21 37470

#define Title 37401
closedialog 0; 

createDialog "pInteraction_Menu";

disableSerialization;
marker_on = false;
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Btn11 = _display displayCtrl Btn11;
_Btn12 = _display displayCtrl Btn12;
_Btn13 = _display displayCtrl Btn13;
_Btn14 = _display displayCtrl Btn14;
_Btn15 = _display displayCtrl Btn15;
_Btn16 = _display displayCtrl Btn16;
_Btn17 = _display displayCtrl Btn17;
_Btn18 = _display displayCtrl Btn18;
_Btn19 = _display displayCtrl Btn19;
_Btn20 = _display displayCtrl Btn20;
_Btn21 = _display displayCtrl Btn21;


_Btn1 ctrlSetText "Sky Blue";
_Btn1 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.3,0.5,1,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn2 ctrlSetText "Pink";
_Btn2 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(1,0.5,1,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn3 ctrlSetText "Purple";
_Btn3 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.65,0.5,1,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn4 ctrlSetText "Dark Blue";
_Btn4 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.25,0.25,1,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn5 ctrlSetText "Off Purple";
_Btn5 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.25,0.25,0.4,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn6 ctrlSetText "Green";
_Btn6 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.25,0.5,0.01,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn7 ctrlSetText "Dark Green";
_Btn7 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.05,0.3,0.01,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn8 ctrlSetText "Teal";
_Btn8 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.05,0.3,0.31,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn9 ctrlSetText "Off Red";
_Btn9 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.55,0.3,0.31,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn10 ctrlSetText "Hyper Red";
_Btn10 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.95,0.3,0.31,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn11 ctrlSetText "Red";
_Btn11 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.65,0.1,0.1,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn12 ctrlSetText "Off Orange";
_Btn12 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.95,0.7,0.51,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn13 ctrlSetText "Yellow";
_Btn13 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.95,0.9,0.1,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn14 ctrlSetText "Orange";
_Btn14 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.95,0.6,0.1,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn15 ctrlSetText "Off White";
_Btn15 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.81,0.91,0.91,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn16 ctrlSetText "Gray";
_Btn16 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.71,0.71,0.71,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn17 ctrlSetText "Dark Gray";
_Btn17 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.31,0.31,0.31,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn18 ctrlSetText "Dark Purple";
_Btn18 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.1,0.1,0.3,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn19 ctrlSetText "Lime";
_Btn19 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.6,1,0,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn20 ctrlSetText "Burgundy";
_Btn20 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(0.35,0.11,0.1,1.0,CO)""] spawn life_fnc_sprayCarFinish;";

_Btn21 ctrlSetText "Hot Pink";
_Btn21 buttonSetAction "closeDialog 0; [player,""#(argb,8,8,3)color(1,0,1,1,CO)""] spawn life_fnc_sprayCarFinish;";
