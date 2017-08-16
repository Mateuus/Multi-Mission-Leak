/* 
 File: fn_lottoAusspielung.sqf 
*/ 
//Auto Lotto Ausspielung 
private["_random","_ausspielzeit","_restzeit","_msg","_restzeit1"]; 
_random = random[(150*60),(180*60),(210*60)]; 
_ausspielzeit = (servertime + _random); 
uiSleep round(_random/2); 
_restzeit1 = (_ausspielzeit - servertime); 
_restzeit = ((_restzeit1/60)/60);//auf Stunden zu kommen 
_msg = format [" 
 <t align='center' size='1.5' color='#EDF5F5'>Die nächste Ziehung ist in</t><br/><br/> 
 <img size ='3' image='Resources\textures\icons\money.paa'/><br/> 
 <t align='center' size='2' color='#DC143C'>%1</t><br/><br/> 
 <t align='center' size='1' color='#EDF5F5'>Viel Glück Ihre Zero-One Lotterie</t><br/> 
 ",[_restzeit,"HH:MM:SS"] call bis_fnc_timeToString]; 
[4,_msg, "Zero-One Lotterie"] remoteExecCall ["zero_fnc_cpbpJzzAd",civilian]; 
[4,_msg, "Zero-One Lotterie"] remoteExecCall ["zero_fnc_cpbpJzzAd",east]; 
uisleep _restzeit1; 
[] spawn hc_fnc_lottoGewinn; 
lotto_auto_ausspielung = true; 
