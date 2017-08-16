params ["_owner","_listegewinner","_msg"]; 
_listegewinner = profilenamespace getVariable ["Lottogewinner",[]]; 
// select 0 Name; select 1 Gewinnsumme; 
reverse _listegewinner; 
_msg = format [" 
  <t align='center' size='1.5' color='#EDF5F5'>Die letzen Gewinner der Zero-One Lotterie</t> 
  <br/><t align='center' size='1.5' color='#EDF5F5'>sind</t> 
  <br/> 
  "]; 
{ 
 _msg = format ["%1 
  <br/><t align='left' size='1.5' color='#DC143C'>%2</t><t align='right' size='1.5' color='#DC143C'>%3</t>" 
  ,_msg,_x select 0,[_x select 1] call zero_fnc_nAnP]; 
}foreach _listegewinner; 
[4,_msg, "Zero-One Lotterie"] remoteExecCall ["zero_fnc_cpbpJzzAd",_owner]; 
