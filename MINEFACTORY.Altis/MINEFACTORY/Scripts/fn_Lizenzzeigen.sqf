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
   case 1: { _rang = "Anw�rter"; };
   case 2: { _rang = "Polizeimeister"; };
   case 3: { _rang = "Polizeiobermeister"; };
   case 4: { _rang = "Polizeihauptmeister"; };
   case 5: { _rang = "Polizeikommissar"; };
   case 6: { _rang = "Polizeioberkommissar"; };
   case 7: { _rang = "Polizeihauptkommissar"; };
   case 8: { _rang = "Polizeirat"; };
   case 9: { _rang = "Polizeioberrat"; };
   case 10: { _rang = "Polizeichef"; };
   default { _rank =  "Error";};
  };
  _marke = "marke_cop";
  _org = "Polizei Altis";
 };
 case independent:{
  switch (call life_mediclevel) do{
   case 1: { _rang = "Ersthelfer"; };
   case 2: { _rang = "Rettungshelfer"; };
   case 3: { _rang = "Rettungsanit�ter"; };
   case 4: { _rang = "Notfallsanit�ter"; };
   case 5: { _rang = "Notarzt"; }; 
   default { _rank =  "Error";};
  };
  _marke = "marke_ziv";
  _org = "Republik Altis";
 };
 case civilian:{
  if(playerSide == civilian)then{
   _rang = "Zivilist";
   _marke = "marke_ziv";
   _org = "Altis Insel Bewohner";
  }else{
   _rang = "Zivilist";
   _marke = "marke_ziv";
   _org = "Altis Insel Bewohner";
  };  
 };
};
_message = format["<img size='10' color='#FFFFFF' image='MINEFACTORY\icons\%1.paa'/><br/><br/><t size='2.5'>%2</t><br/><t size='1.8'>%3</t><br/><t size='1'>%4</t>",_marke, name player, _rang, _org];
[player, _message] remoteExec ["life_fnc_Lizenzsehen",_ziel];
