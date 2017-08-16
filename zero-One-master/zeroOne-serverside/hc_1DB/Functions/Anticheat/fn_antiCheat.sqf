/* 
 Author: Nokman 
 Does things ... edited by arkensor 
*/ 
private["_del","_num"]; 
 
[] spawn { 
 while {true} do { 
  waitUntil{(markerText "life_mpPacket_send") != ""}; 
  deleteMarker "life_mpPacket_send"; 
 }; 
}; 
