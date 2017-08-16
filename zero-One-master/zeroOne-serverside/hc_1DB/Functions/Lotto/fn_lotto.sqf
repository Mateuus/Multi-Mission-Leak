params ["_uid","_owner","_switch","_hcsendre","_profilname"]; 
if (!isnil "lotto_auto_ausspielung") exitwith {[true] remoteExec ["zero_fnc_CDaUyuOVN",_owner];}; 
switch (_switch) do { 
 case "abfrage" : { 
  _anzahl = ({_x == _uid} count lotto); 
  [lotto_maximum,_anzahl] remoteExec ["zero_fnc_CDaUyuOVN",_owner]; 
 }; 
 case "eintrag" : { 
  for "" from 1 to _owner do { 
   lotto pushback _uid; 
  }; 
  _anzahl = ({_x == _uid} count lotto); 
  private _send = format ["Sie besitzen nun %1 %2, Viel Glück",_anzahl,switch (true) do { case (_anzahl == 1) : {"Lottoschein"}; default {"Lottoscheine"};}]; 
  [5,_send, "Zero-One Lotterie"] remoteExecCall ["zero_fnc_cpbpJzzAd",_hcsendre]; 
  profilenamespace setVariable ["lotto",lotto]; 
  zo_log = format ["LOTTO KAUF: Loskauf Spieler:%1 Lose:%2",_profilname,_anzahl]; 
  publicvariableserver "zo_log"; 
  zo_log = nil; 
 }; 
}; 
