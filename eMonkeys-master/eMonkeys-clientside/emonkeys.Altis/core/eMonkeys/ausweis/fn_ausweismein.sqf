/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
closeDialog 0;
disableSerialization;

if(count eM_ausweis == 0) exitWith { };

_plname = eM_ausweis select 1;//1608
_name = eM_ausweis select 2 select 0;//1601
_vorname = eM_ausweis select 2 select 1;//1600
_gebdatum = eM_ausweis select 2 select 2;//1602
_stadtsa = eM_ausweis select 2 select 3;//1604
_geschle = eM_ausweis select 2 select 4;//1603
_stadt = eM_ausweis select 2 select 5;//1605
_pass = eM_ausweis select 2 select 6;//1201
_playerid = eM_ausweis select 4;//1607
_erstelld = eM_ausweis select 3;//1606

1 cutRsc ["EMonkeys_ausweis","PLAIN"];

waitUntil {!isNull (uiNameSpace getVariable "EMonkeys_ausweis")};
_display = uiNameSpace getVariable "EMonkeys_ausweis";

///// passfoto
_passfoto = (_display displayCtrl 1201);
_passfoto ctrlSetText format["core\textures\misc\ausweis\%1.jpg",_pass];
///// passfoto

///// _name
_name1 = (_display displayCtrl 1601);
_name1 ctrlSetText format["%1",_name];
///// _name

/////_vorname
_vorname1 = (_display displayCtrl 1600);
_vorname1 ctrlSetText format["%1",_vorname];
/////_vorname

/////_gebdatum
_gebdatum1 = (_display displayCtrl 1602);
_gebdatum1 ctrlSetText format["%1",_gebdatum];
/////_gebdatum

/////_stadtsa
_stadtsa1 = (_display displayCtrl 1604);
_stadtsa1 ctrlSetText format["%1",_stadtsa];
/////_stadtsa

/////_geschle
_geschle1 = (_display displayCtrl 1603);
_geschle1 ctrlSetText format["%1",_geschle];
/////_geschle

/////_stadt
_stadt1 = (_display displayCtrl 1605);
_stadt1 ctrlSetText format["%1",_stadt];
/////_stadt

/////_playerid
_playerid1 = (_display displayCtrl 1607);
_playerid1 ctrlSetText format["%1",_playerid];
/////_playerid

/////_erstelld
_erstelld1 = (_display displayCtrl 1606);
_erstelld1 ctrlSetText format["%1",_erstelld];
/////_erstelld

/////_plname
_plname1 = (_display displayCtrl 1608);
_plname1 ctrlSetText format["%1",_plname];
/////_plname