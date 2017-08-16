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
   case 1: { _rang = "Cadet";};
   case 2: { _rang = "Officer";};
   case 3: { _rang = "Trooper";};
   case 4: { _rang = "State Trooper";};
   case 5: { _rang = "Sergeant";};
   case 6: { _rang = "Staff Sergeant";};
   case 7: { _rang = "Lieutenant";};
   case 8: { _rang = "1st Lieutenant";};
   case 9: { _rang = "Captain";};
   case 10: { _rang = "Inspector";};
   case 11: { _rang = "Deputy Chief";};
   case 12: { _rang = "Chief o. Police";};
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
   case 1: { _rang = (localize "STR_Medic_Name1");};
   case 2: { _rang = (localize "STR_Medic_Name2");};
   case 3: { _rang = (localize "STR_Medic_Name3");};
   case 4: { _rang = (localize "STR_Medic_Name4");};
   case 5: { _rang = (localize "STR_Medic_Name5");};
   case 6: { _rang = (localize "STR_Medic_Name6");};
   case 7: { _rang = (localize "STR_Medic_Name7");};
   case 8: { _rang = (localize "STR_Medic_Name8");};
   case 9: { _rang = (localize "STR_Medic_Name9");};
   case 10: { _rang = (localize "STR_Medic_Name10");};
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
  if(playerSide isEqualTo civilian)then{
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