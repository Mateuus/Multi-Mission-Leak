/* 
 File: fn_virt_shops.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Config for virtual shops. 
*/ 
private["_shop"]; 
_shop = _this select 0; 
if (isNil "LHM_Donator_Cop_Items") then { LHM_Donator_Cop_Items = [[],[]] }; 
_Donator_Cop_Items = LHM_Donator_Cop_Items select 0;  
_Donator_Sec_Items = LHM_Donator_Sec_Items select 0;  
switch (_shop) do 
{ 
 case "cop": {["Cop Item Shop",(_Donator_Cop_Items + [])]}; 
 case "sec": {["Cop Item Shop",(_Donator_Sec_Items + [])]}; 
};