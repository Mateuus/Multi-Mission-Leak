 
 
 
 
 
 
 
private["_type"]; 
_type = [_this,0,"",[""]] call BIS_fnc_param; 
if(_type == "") exitWith {-1}; 
 
switch (_type) do 
{ 
case "Land_i_House_Small_01_V1_F": {[3,1]}; 
case "Land_i_House_Small_01_V2_F": {[3,1]}; 
case "Land_i_House_Small_01_V3_F": {[3,1]}; 
case "Land_i_House_Small_02_V1_F": {[4,2]}; 
case "Land_i_House_Small_02_V2_F": {[4,2]}; 
case "Land_i_House_Small_02_V3_F": {[4,2]}; 
case "Land_i_House_Small_03_V1_F": {[4,2]}; 
case "Land_i_House_Big_01_V1_F": {[0,5,4]}; 
case "Land_i_House_Big_01_V2_F": {[0,5,4]}; 
case "Land_i_House_Big_01_V3_F": {[0,5,4]}; 
case "Land_i_House_Big_02_V1_F": {[8,5,7]}; 
case "Land_i_House_Big_02_V2_F": {[8,5,7]}; 
case "Land_i_House_Big_02_V3_F": {[8,5,7]}; 
case "Land_i_Stone_HouseSmall_V1_F": {[1,4,3]}; 
case "Land_i_Stone_HouseSmall_V2_F": {[1,4,3]}; 
case "Land_i_Stone_HouseSmall_V3_F": {[1,4,3]}; 
case "Land_House_Small_01_F": {[4,2]}; 
case "Land_House_Small_02_F": {[4,5]}; 
case "Land_House_Small_03_F": {[4,2]}; 
case "Land_House_Small_04_F": {[4,2]}; 
case "Land_House_Small_05_F": {[0,2]}; 
case "Land_House_Small_06_F": {[4,2]}; 
case "Land_House_Big_01_F": {[0,5,4]}; 
case "Land_House_Big_02_F": {[0,5,4]}; 
case "Land_House_Big_03_F": {[1,5,4]}; 
case "Land_House_Big_04_F": {[3,13,4]}; 
case "Land_i_Shed_Ind_F": {[0,3]}; 
case "Land_HouseA"; 
case "Land_HouseA1"; 
case "Land_HouseB"; 
case "Land_HouseB1"; 
case "Land_HouseC_R": {[[5.1,9,0],[5.3,3.7,0],[-5,-2.9,0]]}; 
case "Land_HouseA1_L"; 
case "Land_HouseB1_L"; 
case "Land_HouseC1_L": {[[-3.9,8.9,0],[6.87,6.75,0],[6.4,-3.35,0]]}; 
case "Land_HouseDoubleAL": {[[6.44,-3.43,0],[-7.9,12,0],[7.2,7.0,3.16],[0.55,-3.43,3.16]]}; 
case "Land_HouseDoubleAL2": {[[6.25,-3,0],[-9.8,12.6,0],[7.1,7.8,3.16],[0.55,-3.43,3.16]]}; 
default {[1]}; 
};