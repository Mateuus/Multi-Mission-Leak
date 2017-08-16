/*  
	Montrer son passeport   
@Author : Heimdall @AltisAurore.fr  
*/  

private["_target","_message"];  

_target = cursorTarget;  

if(playerSide != west) exitWith  
{  
    hint "Du bist kein Polizist , sondern eine unbekannte Spezies! :o";  
};  

if( isNull _target) then {_target = player;};  

if( !(_target isKindOf "Man") ) then {_target = player;};  

if( !(alive _target) ) then {_target = player;};  

  switch (call life_coplevel) do{
   case 1: { _rang = "Auszubildender Polizist"; };
   case 2: { _rang = "Deputy"; };
   case 3: { _rang = "Corporal"; };
   case 4: { _rang = "Sergeant"; };
   case 5: { _rang = "Lieutenant"; };
   case 6: { _rang = "Captain"; };
   case 7: { _rang = "Major"; };
   case 8: { _rang = "Assistant Sheriff"; };
   case 9: { _rang = "Sheriff"; };
   case 10: { _rang = "FBI-Leitung"; };
   default { _rank =  "Error";}; 
  };

_message = format["<img size='10' color='#FFFFFF' image='icons\cop.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1'>_rang der Polizei Altis</t>", name player];  

[player, _message] remoteExec ["life_fnc_passportCop",_target];