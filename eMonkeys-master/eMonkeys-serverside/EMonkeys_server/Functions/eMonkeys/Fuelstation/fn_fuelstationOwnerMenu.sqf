/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Fuelstation Ownermenu 
*/ 
private["_fuelstationData","_dialog","_Btn1","_Btn2","_Btn3","_Btn4","_updatePrice","_id","_tankstellenname","_superpreis","_superpluspreis","_dieselpreis","_biodieselpreis","_reperaturpreis","_lackierpreis","_einkommen","_benzin_im_lager","_diesel_im_lager","_colourText","_textcolour","_colourText2","_textcolour2","_benzinvorratStatus","_dieselvorratStatus","_einkommenStatus","_tankstellennameStatus","_superpreisStatus","_superpluspreisStatus","_dieselpreisStatus","_biodieselpreisStatus","_reperaturpreisStatus","_lackierpreisStatus","_infoText"]; 
_fuelstationData = _this select 0; 
if(isNil{_fuelstationData}) exitWith {hint "Die Tankstelle gehört dir nicht!"}; 
disableSerialization; 
if(!(createDialog "fuelstation_ownerMenu")) exitWith {}; 
 
_dialog = findDisplay 9000; 
_Btn1 = _dialog displayCtrl 9002; //Tankstellennamen ändern 
_Btn2 = _dialog displayCtrl 9009; //Preise ändern 
_Btn3 = _dialog displayCtrl 9013; //Gewinn abheben 
_Btn4 = _dialog displayCtrl 9014; //Treibstoff anfordern 
 
_updatePrice = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "prices"  >> "updatePrice"); 
 
_id = _fuelstationData select 0; 
_tankstellenname = ""; 
if(_fuelstationData select 1 == "") then {_tankstellenname = _fuelstationData select 2;} else {_tankstellenname = _fuelstationData select 1;}; 
_superpreis = _fuelstationData select 3; 
_superpluspreis = _fuelstationData select 4; 
_dieselpreis = _fuelstationData select 5; 
_biodieselpreis = _fuelstationData select 6; 
_reperaturpreis = _fuelstationData select 7; 
_lackierpreis = _fuelstationData select 8; 
_einkommen = _fuelstationData select 9; 
_benzin_im_lager = _fuelstationData select 10; 
_diesel_im_lager = _fuelstationData select 11; 
 
_colourText = parseText "#cccccc"; //Hellgrau 
if(_benzin_im_lager >= 50)  then  
{ 
 _colourText = parseText "#cccccc"; 
} else { 
 _colourText = parseText "#CC0000"; 
}; 
_textcolour = _colourText; 
 
_colourText2 = parseText "#cccccc"; //Hellgrau 
if(_diesel_im_lager >= 50)  then  
{ 
 _colourText2 = parseText "#cccccc"; 
} else { 
 _colourText2 = parseText "#CC0000"; 
}; 
_textcolour2 = _colourText2; 
 
_benzinvorratStatus = _dialog displayCtrl 9010; 
_benzinvorratStatus ctrlSetStructuredText parseText format["<t size='0.8px'><t color='%2'>%1 Liter</t></t>",_benzin_im_lager,_textcolour]; 
 
_dieselvorratStatus = _dialog displayCtrl 9011; 
_dieselvorratStatus ctrlSetStructuredText parseText format["<t size='0.8px'><t color='%2'>%1 Liter</t></t>",_diesel_im_lager,_textcolour2]; 
 
_einkommenStatus = _dialog displayCtrl 9012; 
_einkommenStatus ctrlSetStructuredText parseText format["<t size='0.8px'><t color='#66FF00'>%1€</t></t>",[_einkommen] call EMonkeys_fnc_numberText]; 
 
if(!isNil "_tankstellenname") then  
{ 
 _tankstellennameStatus = _dialog displayCtrl 9001; 
 _tankstellennameStatus ctrlSetText format["%1",_tankstellenname]; 
}; 
 
_superpreisStatus = _dialog displayCtrl 9003; 
_superpreisStatus ctrlSetText format["%1",[_superpreis] call EMonkeys_fnc_numberText]; 
 
_superpluspreisStatus = _dialog displayCtrl 9004; 
_superpluspreisStatus ctrlSetText format["%1",[_superpluspreis] call EMonkeys_fnc_numberText]; 
 
_dieselpreisStatus = _dialog displayCtrl 9005; 
_dieselpreisStatus ctrlSetText format["%1",[_dieselpreis] call EMonkeys_fnc_numberText]; 
 
_biodieselpreisStatus = _dialog displayCtrl 9006; 
_biodieselpreisStatus ctrlSetText format["%1",[_biodieselpreis] call EMonkeys_fnc_numberText]; 
 
/* 
_reperaturpreisStatus = _dialog displayCtrl 9007; 
_reperaturpreisStatus ctrlSetText format["%1",[_reperaturpreis] call EMonkeys_fnc_numberText]; 
 
_lackierpreisStatus = _dialog displayCtrl 9008; 
_lackierpreisStatus ctrlSetText format["%1",[_lackierpreis] call EMonkeys_fnc_numberText]; 
*/ 
 
_infoText = _dialog displayCtrl 9015; 
_infoText ctrlSetText format["Preis und Namensänderungen kosten dich %1€.",[_updatePrice] call EMonkeys_fnc_numberText]; 
 
id = _id; 
einkommen = _einkommen; 
 
_Btn1 buttonSetAction "[0,player,id] spawn EMonkeys_fnc_updateFuelstation;"; 
_Btn2 buttonSetAction "[1,player,id] spawn EMonkeys_fnc_updateFuelstation;"; 
_Btn3 buttonSetAction "[2,player,id,einkommen] spawn EMonkeys_fnc_updateFuelstation;"; 
_Btn4 buttonSetAction "[3,player,id] spawn EMonkeys_fnc_updateFuelstation;";