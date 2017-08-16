if(isServer)exitWith{};
private["_ziel", "_rang", "_marke", "_org", "_message"];
if(vehicle player != player )exitWith{};
_ziel = cursorTarget;
if(isNull _ziel) then {_ziel = player;};    
if(!(_ziel isKindOf "Man")) then {_ziel = player;};  
if(!(alive _ziel)) then {_ziel = player;};     
switch(playerSide)do{
 case west:{
  switch (call life_coplevel) do{
	case 1: { _rang = "Polizei Praktikant"; };
	case 2: { _rang = "Polizei Anwaerter"; };
	case 3: { _rang = "Polizei Wachtmeister"; };
	case 4: { _rang = "Polizei Kommissar"; };
	case 5: { _rang = "Polizei Oberkommissar"; };
	case 6: { _rang = "Polizei Hauptkommisar"; };
	case 7: { _rang = "Bundespolizist"; };
	case 8: { _rang = "Polizei Chef stv."; };
	case 9: { _rang = "Polizei Chef"; };
	default { _rank =  "Error";};
  };
  _marke = "marke_cop";
  _org = "Polizei Altis";
 };
 case independent:{
  switch (call life_mediclevel) do{
	case 1: { _rang = "Mitarbeiter auf Probe"; };
	case 2: { _rang = "Mitarbeiter in Ausbildung"; };
	case 3: { _rang = "Mitarbeiter in Anstellung"; };
	case 4: { _rang = "Mitarbeiter mit ADA-Lizenz"; };
	case 5: { _rang = "Mitarbeiter fuer Logistik"; };
    case 6: { _rang = "MTD Abteilungsleiter"; };
	case 7: { _rang = "MTD Geschaeftsleitung"; };
	default {_rank =  "Error";};
  };
  _marke = "marke_mtd";
  _org = "MTD Altis";
 };
 case civilian:{
  if(playerSide == civilian)then{
   _rang = "Zivilist";
   _marke = "marke_ziv";
   _org = "Republik Altis";
  }else{
   _rang = "Zivilist";
   _marke = "marke_abi";
   _org = "Republik Altis";
  };  
 };
};
_message = format["<img size='10' color='#FFFFFF' image='icons\ausweis\%1.paa'/><br/><br/><t size='2.5'>%2</t><br/><t size='1.8'>%3</t><br/><t size='1'>%4</t>",_marke, name player, _rang, _org];
[player, _message] remoteExec ["life_fnc_Lizenzsehen",_ziel];
