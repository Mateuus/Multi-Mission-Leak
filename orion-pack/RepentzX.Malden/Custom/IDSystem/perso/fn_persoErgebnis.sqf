params [
	["_data",[],[[]]],
	"_name", "_alter", "_sex", "_bltg", "_stra", "_handynr", "_email", "_cm", "_kg", "_t", "_m",
	"_j", "_plz", "_hsnr", "_wohnort", "_bildID", "_bildName","_staat","_staatArr","_erlaubeMehrereNamen"
];
if(_data isEqualTo []) exitWith {0 cutText ["Fehler: Personalausweis muss angelegt werden","BLACK FADED"]; 0 cutFadeOut 9999999; [] call fvs_fnc_persoNeu};
if((count _data) < 16 || (count _data) > 16 || !(_data isEqualType [])) exitWith {
	_uid = (getplayerUID player);
	_side = side player;
	[_uid,_side,player] remoteExec ["DB_fnc_persoErrorFix",2];
};
_erlaubeMehrereNamen = switch (playerSide) do {
	case west: {getNumber(missionConfigFile >> "Personalausweis" >> "erlaubeMehrereNamen_west")};
	case independent: {getNumber(missionConfigFile >> "Personalausweis" >> "erlaubeMehrereNamen_indep")};
	case east: {getNumber(missionConfigFile >> "Personalausweis" >> "erlaubeMehrereNamen_east")};
	case civilian: {getNumber(missionConfigFile >> "Personalausweis" >> "erlaubeMehrereNamen_civ")};
	default {diag_log "#Perso-Fehler# Unbekannte Seite"; 0};
};
if(!((_data select 0) isEqualTo profileName) && (_erlaubeMehrereNamen isEqualTo 0)) exitWith {
	[(_data select 0)] spawn {
		[
			format["You tried with a different profile name (%1) But also; '%2' is deposited for the ID card!",profileName, _this select 0],
			"Identity card - Incorrect name - Case-sensitive (case sensitive)",
			"Roger that",
			false
		] call BIS_fnc_guiMessage;
		endMission "falschprof";
	};
};
if(!(_data isEqualTypeArray ["","","","","","","","","","","","","","","",""]) || !(_data isEqualType [])) exitWith {diag_log format["Error in the ID card, Array: %1",_data];endMission "fformatprof";};
_name = _data select 0;
_alter = _data select 1;
_sex = _data select 2;
_bltg = _data select 3;
_stra = _data select 4;
_handynr = _data select 5;
_email = _data select 6;
_cm = _data select 7;
_kg = _data select 8;
_t = _data select 9;
_m = _data select 10;
_j = _data select 11;
_plz = _data select 12;
_hsnr = _data select 13;
_wohnort = getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> _plz >> "name");
_bildID = _data select 14;
_staat = (parseNumber (_data select 15));
_staatArr = getArray(missionConfigFile >> "Personalausweis" >> "staatsbuergerschaften");
if (_staat > (count _staatArr) || (count _staatArr < 0)) then {
	_data set [15,["UNDEFINIERTER STAAT","#(argb,8,8,3)color(0.5,1,0.3,1)"]]; diag_log format["Personal Error: No value in the Citizenship array found with index '%1/%2' => %3",_staat, count _staatArr, _staatArr];
} else {
	_data set[15,(_staatArr select _staat)];
};
diag_log format["Personalausweis: %1",_data];
_bildName = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> _bildID >> "name");
hint parseText format["Your ID Card...<br/><br/><t align='left'>Name: %1<br/>Street: %2 %3<br/>ZIP / City: %4 %5<br/><br/>Email: %6<br/>Phone: 0%7<br/>Height: %8cm<br/>Weight: %9kg<br/>Age %10<br/>Date of birth: %11 %12 %13<br/>blood type: %14<br/><br/>Phot: %15 %16<br/><br/><t underline='true'>Nationality:</t><br/>%17</t>",_name,_stra,_hsnr,_plz,_wohnort,_email,_handynr,_cm,_kg,_alter,_t,_m,_j,_bltg,_bildID,_bildName,((_data select 15) select 0)];
player setVariable ["personaltext",_data,true];
if (getNumber(missionConfigFile >> "Personalausweis" >> "persoNeu_wann") isEqualTo 1) then {0 cutText ["","BLACK IN"];};
fvs_persoReady = true;