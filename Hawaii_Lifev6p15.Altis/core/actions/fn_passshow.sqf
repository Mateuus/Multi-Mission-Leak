//Author: PierreAmyf
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
   case 1: { _rang = "Recruit";};
   case 2: { _rang = "Officer";};
   case 3: { _rang = "Detective";};
   case 4: { _rang = "Sergeant";};
   case 5: { _rang = "Lieutenant";};
   case 6: { _rang = "Captain";};
   case 7: { _rang = "Major";};
   case 8: { _rang = "Chief";};
   default { _rank = "Error";};
  };
  _marke = "marke_cop.paa";
  _org = "Polizei Hawaii";
	_message = format["
	<img size='10' color='#FFFFFF' image='textures\marke\%1'/><br/><br/>
	<t size='2.5'>%2</t><br/>
	<t size='1.8'>%3</t><br/>
	<t size='1'>%4</t><br/>",_marke, name player, _rang, _org];
 };
 case independent:{
  switch (call life_mediclevel) do{
   case 1: { _rang = "Lehrling";};
   case 2: { _rang = "Rettungsassistent";};
   case 3: { _rang = "Rettungsspezialist";};
   case 4: { _rang = "Notfalltechniker";};
   case 5: { _rang = "Servicezentrale";};
   case 6: { _rang = "Einsatzleiter";};
   case 7: { _rang = "Notfallzentrale";};
   case 8: { _rang = (localize "STR_Medic_Name");};
   case 9: { _rang = "stv. Leitung";};
   case 10: { _rang = "Leitung";};
   default { _rank = "Error";};
  };
  _marke = "marke_thw.paa";
  _org = "THW Hawaii";
	_message = format["
	<img size='10' color='#FFFFFF' image='textures\marke\%1'/><br/><br/>
	<t size='2.5'>%2</t><br/>
	<t size='1.8'>%3</t><br/>
	<t size='1'>%4</t><br/>",_marke, name player, _rang, _org];
 };
 case civilian:{
  if(playerSide == civilian)then{
   _rang = "Zivilist";
   _marke = "marke_ziv.paa";
   _org = "Republik Hawaii";
	_message = format["
	<img size='10' color='#FFFFFF' image='textures\marke\%1'/><br/><br/>
	<t size='2.5'>%2</t><br/>
	<t size='1.8'>%3</t><br/>
	<t size='1'>%4</t><br/>
	<t size='1.8'>Gang: %5</t><br/>",_marke, name player, _rang, _org, (group player) getVariable "gang_name"];
  }else{
   _rang = "Zivilist";
   _marke = "marke_abi.paa";
   _org = "Republik Hawaii";
	_message = format["
	<img size='10' color='#FFFFFF' image='textures\marke\%1'/><br/><br/>
	<t size='2.5'>%2</t><br/>
	<t size='1.8'>%3</t><br/>
	<t size='1'>%4</t><br/>",_marke, name player, _rang, _org];
  };  
 };
};

[player, _message] remoteExecCall ["life_fnc_passview",_ziel];