/*
	Zeigt den Ausweis
*/
disableSerialization;
"esg_ausweis" cutRsc ["esg_ausweis","PLAIN"];
_ui = uiNamespace getVariable "esg_ausweis";
_daten = _this select 0;
_rank = (_this select 1) getVariable ["rankaus","Bürger"];
_name = _ui displayCtrl 1000;
_name ctrlsetText format ["%1",_daten select 0];
_anschrift = _ui displayCtrl 1001;
_anschrift ctrlsetText format ["%1, %2 %3",_daten select 8, _daten select 9, _daten select 10];
_date = _ui displayCtrl 1002;
_date ctrlsetText format ["%1.%2.%3",_daten select 3, _daten select 4, _daten select 5];
_staat = _ui displayCtrl 1003;
_staat ctrlsetText format ["%1",_daten select 2];
_ort = _ui displayCtrl 1004;
_ort ctrlsetText format ["%1, %2",_daten select 6,_daten select 7];
_rankctrl = _ui displayCtrl 1005;
_rankctrl ctrlsetText format ["%1",_rank];
if(!((_this select 1) in ESG_Bekannte))then {
	ESG_Bekannte pushback (_this select 1);
};
sleep 8;
"esg_ausweis" cutFadeOut 1;