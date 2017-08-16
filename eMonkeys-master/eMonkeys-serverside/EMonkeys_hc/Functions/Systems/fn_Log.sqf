/* 
 Author:Christian "Cifon" Runggas 
 E-mail: me@cifon.de 
 The usage of this file is restricted to E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Master Logfile 
*/ 
switch (_this select 0) do  
{ 
 case 0:  
 { 
  "Cifons_Logsystem" callExtension format ["vehiclelog@%1", _this select 1]; 
 }; 
  
 case 1:  
 { 
  "Cifons_Logsystem" callExtension format ["iitemlog@%1", _this select 1]; 
 }; 
  
 case 2:  
 { 
  "Cifons_Logsystem" callExtension format ["zitemlog@%1", _this select 1]; 
 }; 
  
 case 3:  
 { 
  "Cifons_Logsystem" callExtension format ["house@%1", _this select 1]; 
 }; 
  
 case 4:  
 { 
  "Cifons_Logsystem" callExtension format ["moneylog@%1", _this select 1]; 
 }; 
  
 case 5:  
 { 
  "Cifons_Logsystem" callExtension format ["interactlog@%1", _this select 1]; 
 }; 
  
 case 6:  
 { 
  "Cifons_Logsystem" callExtension format ["fuelstationlog@%1", _this select 1]; 
 }; 
  
 case 7:  
 { 
  "Cifons_Logsystem" callExtension format ["dblog@%1", _this select 1]; 
 }; 
  
 case 8:  
 { 
  "Cifons_Logsystem" callExtension format ["chatlog@%1", _this select 1]; 
 }; 
  
 case 9:  
 { 
  "Cifons_Logsystem" callExtension format ["functionlog@%1", _this select 1]; 
 }; 
  
 case 10:  
 { 
  "Cifons_Logsystem" callExtension format ["cleaninglog@%1", _this select 1]; 
 }; 
}; 
/* 
switch (_this select 0) do  
{ 
 case 0:  
 {///atmlog 
 "Cifons_Logsystem" callExtension format ["atmlog@%1", _this select 1]; 
 
 }; 
 case 1:  
 {///vehiclelog 
 "Cifons_Logsystem" callExtension format ["vehiclelog@%1", _this select 1]; 
 
 }; 
 case 2:  
 {///mpexeclog 
 "Cifons_Logsystem" callExtension format ["mpexeclog@%1", _this select 1]; 
 
 }; 
 case 3:  
 {///dblog 
 "Cifons_Logsystem" callExtension format ["dblog@%1", _this select 1]; 
 
 }; 
 case 4:  
 {///chatlog 
 "Cifons_Logsystem" callExtension format ["chatlog@%1", _this select 1]; 
 
 }; 
  
 case 5:  
 {///Z-Item System 
 "Cifons_Logsystem" callExtension format ["zitemslog@%1", _this select 1]; 
 
 }; 
  
 case 6:  
 {///I-Item System 
 "Cifons_Logsystem" callExtension format ["iitemslog@%1", _this select 1]; 
 
 }; 
 case 7:  
 {///Tankstellen System 
 "Cifons_Logsystem" callExtension format ["fuelstationlog@%1", _this select 1]; 
 
 }; 
}; 
*/ 
 
