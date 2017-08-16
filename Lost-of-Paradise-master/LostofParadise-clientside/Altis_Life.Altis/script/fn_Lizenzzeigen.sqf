//Author: PierreAmyf ### Some edits by Lost of Paradise (Sebi, Oktas) 
if(isServer)exitWith{};
private["_ziel", "_rang", "_marke", "_org", "_message", "_rang"];


if(vehicle player != player )exitWith{};
_ziel = cursorTarget;
if(isNull _ziel) then {_ziel = player;};    
if(!(_ziel isKindOf "Man")) then {_ziel = player;};  
if(!(alive _ziel)) then {_ziel = player;};
if(player distance _ziel > 6) exitWith {hint parseText format ["<t color='#FFFF00'>Deine Arme sind viel zu kurz um den Ausweis zu zeigen! Geh näher ran.</t>"]}; // Nix mehr mit auf 500m Ausweis zeigen.


switch(playerSide)do{
 case west:{
  switch (call life_coplevel) do{
   case 1: { _rang = "Paradise Police Dept."; };
   case 2: { _rang = "Zoll"; };
   case 3: { _rang = "Paradise Police Dept."; };
   case 4: { _rang = "Paradise Police Dept."; };
   case 5: { _rang = "Paradise Police Dept."; };
   case 6: { _rang = "Paradise Police Dept."; };
   case 7: { _rang = "Paradise Police Dept."; };
   default { _rank =  "Error";};
  };
  _marke = "marke_cop";
  _org = "Polizei Altis";
 };
 case east:{
  switch (call life_adaclevel) do{
   case 1: { _rang = "ADAC Praktikant"; };
   case 2: { _rang = "ADAC Azubi"; };
   case 3: { _rang = "ADAC Geselle"; };
   case 4: { _rang = "ADAC Techniker"; };
   case 5: { _rang = "ADAC Meister"; };
   case 6: { _rang = "ADAC Co.Chef"; };
   case 7: { _rang = "ADAC Chef"; };
   case 8: { _rang = "Leitung"; };
  };
  _marke = "marke_ziv";
  _org = "ADAC Altis";
 };
 case independent:{
  switch (call life_mediclevel) do{
   case 1: { _rang = "Ersthelfer"; };
   case 2: { _rang = "Rettungshelfer"; };
   case 3: { _rang = "Rettungsanitäter"; };
   case 4: { _rang = "Notfallsanitäter"; };
   case 5: { _rang = "ARS"; };   
   case 6: { _rang = "Lehrrettungsassistent"; };  
   case 7: { _rang = "ÄrztlicherLeiter"; };   
   default { _rank =  "Error";};
  };
  _marke = "marke_medic";
  _org = "Altis Rescue Service";
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
_message = format["<img size='10' color='#FFFFFF' image='icons\%1.paa'/><br/><br/><t size='2.5' color='#F4FA58'>%2</t><br/><t size='1.8'>%3</t><br/><t size='1'>%4</t>",_marke, name player, _rang, _org];


[[player, _message],"life_fnc_Lizenzsehen",_ziel,false] spawn life_fnc_MP;