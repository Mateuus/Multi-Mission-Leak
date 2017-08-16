/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
closeDialog 0;
disableSerialization;


if(count _this == 0) exitWith { };


_plname = _this select 1;//1608
_name = _this select 2 select 0;//1601

_vorname= _this select 2 select 1;//1600

_gebdatum=_this select 2 select 2;//1602

_stadtsa=_this select 2 select 3;//1604

_geschle=_this select 2 select 4;//1603

_stadt=_this select 2 select 5;//1605

_pass =_this select 2 select 6;//1201

_playerid=_this select 4;//1607

_erstelld=_this select 3;//1606

_licensetext = "Personalausweis";



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

/////_licensename
_lname1 = (_display displayCtrl 1609);
_lname1 ctrlSetText format["%1",_licensetext];
/////_licensename

