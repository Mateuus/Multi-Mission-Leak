params ["_owner"]; 
_gewinnsumme = round (((count lotto) * GJZHuPDR)* ((100 - wCrWgCLX) / 100)); 
_gewinnsummevor = round ((count lotto) * GJZHuPDR); 
_return = format [" 
  <t align='center' size='1' color='#EDF5F5'>Es befinden sich %1 Scheine im System</t> 
  <br/> 
  <t align='center' size='1' color='#EDF5F5'>Gesamtwert von %2</t> 
  <br/> 
  <t align='center' size='2' color='#DC143C'>Gewinnsumme %3</t> 
  <br/> 
  ",count lotto,[_gewinnsummevor] call zero_fnc_nAnP,[_gewinnsumme] call zero_fnc_nAnP]; 
[4,_return, "Zero-One Lotterie"] remoteExecCall ["zero_fnc_cpbpJzzAd",_owner]; 
