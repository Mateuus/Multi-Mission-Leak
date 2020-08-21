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
   case 1: { _rang = "Kadet"; };
   case 2: { _rang = "Posterunkowy"; };
   case 3: { _rang = "Sierżant"; };
   case 4: { _rang = "St.Sierżant"; };
   case 5: { _rang = "Sierżant Szt."; };
   case 6: { _rang = "Aspirant"; };
   case 7: { _rang = "St.Aspirant"; };
   case 8: { _rang = "Komisarz"; };
   case 9: { _rang = "Nadkomisarz"; };
   case 10: { _rang = "Inspektor"; };
   case 11: { _rang = "Nadinspektor"; };
   case 12: { _rang = "Gen.Inspektor"; };
   default { _rank =  "Error";};
  };
  _marke = "marke_cop";
  _org = "Policja Altis";
 };
 case east:{
  switch (call life_adaclevel) do{
   case 1: { _rang = "-"; };
   case 2: { _rang = "--"; };
   case 3: { _rang = "---"; };
   case 4: { _rang = "----"; };
   case 5: { _rang = "-----"; };
   case 6: { _rang = "------"; };
   case 7: { _rang = "-------"; };
   case 8: { _rang = "--------"; };
  };
  _marke = "marke_ziv";
  _org = "Mechanicy Altis";
 };
 case independent:{
  switch (call life_mediclevel) do{
   case 1: { _rang = "Mł.Ratownik"; };
   case 2: { _rang = "Ratownik"; };
   case 3: { _rang = "St.Ratownik"; };
   case 4: { _rang = "Lekarz"; };
   case 5: { _rang = "Zastepca Ordynatora"; };
   case 6: { _rang = "Ordynator"; };
   case 7: { _rang = "Ordynator"; };
   default { _rank =  "Error";};
  };
  _marke = "marke_ziv";
  _org = "Republika Altis";
 };
 case civilian:{
  if(playerSide == civilian)then{
   _rang = "Cywil";
   _marke = "marke_ziv";
   _org = "Republika Altis";
  }else{
   _rang = "Cywil";
   _marke = "marke_abi";
   _org = "Republika Altis";
  };
 };
};
_message = format["<img size='10' color='#FFFFFF' image='icons\%1.paa'/><br/><br/><t size='2.5'>%2</t><br/><t size='1.8'>%3</t><br/><t size='1'>%4</t>",_marke, name player, _rang, _org];
[player,_message]remoteExec["life_fnc_Lizenzsehen",_ziel,false];