/* 
 File: fn_managesc.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 User management of whether or not they want to be on a sidechat for their side. 
*/ 
private["_unit","_bool","_side"]; 
_unit = param [0,ObjNull,[ObjNull]]; 
_bool = param [1,false,[false]]; 
_side = param [2,civilian,[west]]; 
 
if(isNull _unit) exitWith {}; 
 
switch (_side) do 
{ 
 case west: 
 { 
  if(_bool) then 
  { 
   lhm_radio_west radioChannelAdd [_unit]; 
  } 
   else 
  { 
   lhm_radio_west radioChannelRemove [_unit]; 
  }; 
 }; 
  
 case civilian: 
 { 
  if(_bool) then 
  { 
   lhm_radio_civ radioChannelAdd [_unit]; 
  } 
   else 
  { 
   lhm_radio_civ radioChannelRemove [_unit]; 
  }; 
 }; 
  
 case independent: 
 { 
  if(_bool) then 
  { 
   lhm_radio_indep radioChannelAdd [_unit]; 
  } 
   else 
  { 
   lhm_radio_indep radioChannelRemove [_unit]; 
  }; 
 }; 
  
 case east: 
 { 
  if(_bool) then 
  { 
   lhm_radio_east radioChannelAdd [_unit]; 
  } 
   else 
  { 
   lhm_radio_east radioChannelRemove [_unit]; 
  }; 
 }; 
};