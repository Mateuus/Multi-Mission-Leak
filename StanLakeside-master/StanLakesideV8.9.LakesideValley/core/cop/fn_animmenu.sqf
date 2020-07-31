/*
Lakeside Help Menu
*/
if( !allowanims ) exitwith { ["Odczekaj kilka sekund zanim wykonasz kolejna animacje!", false] spawn doquickmsg;  };

if(vehicle player != player) exitwith {};

allowanims = false;
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

_Btn1 ctrlSetText "Poddaj sie";
_Btn1 buttonSetAction "[] spawn life_fnc_surrender; closeDialog 0;";

_Btn2 ctrlSetText "Karate";
_Btn2 buttonSetAction "player playmove ""AmovPercMstpSnonWnonDnon_exerciseKata"";  closeDialog 0;";

_Btn3 ctrlSetText "Pompki";
_Btn3 buttonSetAction "player playmove ""AmovPercMstpSnonWnonDnon_exercisePushup"";  closeDialog 0;";

_Btn4 ctrlSetText "Przysiady";
_Btn4 buttonSetAction "player playmove ""AmovPercMstpSnonWnonDnon_exercisekneeBendA"";  closeDialog 0;";

_Btn5 ctrlSetText "Naprzod";
_Btn5 buttonSetAction "player playaction ""CRPTHSForwardStandLowered""; closeDialog 0;";

_Btn6 ctrlSetText "Stac";
_Btn6 buttonSetAction "player playaction ""CRPTHSStopStandLowered""; closeDialog 0;";

_Btn7 ctrlSetText "Kryj";
_Btn7 buttonSetAction "player playaction ""CRPTHSCoverStandLowered""; closeDialog 0;";

_Btn8 ctrlSetText "Przegrupowac";
_Btn8 buttonSetAction "player playaction ""CRPTHSRegroupStandLowered""; closeDialog 0;";

_Btn9 ctrlSetText "Atakuj";
_Btn9 buttonSetAction "player playaction ""CRPTHSEngageStandLowered""; closeDialog 0;";

_Btn10 ctrlSetText "Wskaz";
_Btn10 buttonSetAction "player playaction ""CRPTHSPointStandLowered""; closeDialog 0;";

_Btn11 ctrlSetText "Stop";
_Btn11 buttonSetAction "player playaction ""CRPTHSHoldStandLowered""; closeDialog 0;";

_Btn12 ctrlSetText "Ostrzezenie";
_Btn12 buttonSetAction "player playaction ""CRPTHSWarningStandLowered""; closeDialog 0;";

_Btn13 ctrlSetText "Rzuc";
_Btn13 buttonSetAction "player playmove ""AmovPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon_gthEnd"";  closeDialog 0;";

_Btn14 ctrlSetText "Srodkowy palec";
_Btn14 buttonSetAction "player playActionNow ""gesturefinger""; closeDialog 0;";

_Btn15 ctrlSetText "Udawaj niezywego";
_Btn15 buttonSetAction "[] spawn fnc_playdead; closeDialog 0;";

fnc_playdead = {
	[player,"DeadState"] remoteExecCall ["life_fnc_animsync"];
	sleep 3;
	[player,""] remoteExecCall ["life_fnc_animsync"];
};

uisleep 15;

allowanims = true;