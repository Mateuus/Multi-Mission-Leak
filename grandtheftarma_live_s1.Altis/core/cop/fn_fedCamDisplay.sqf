/*
  Author: Bryan "Tonic" Boardwine
  
  Description:
  Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_fed_scam") then {
  life_fed_scam = "camera" camCreate [0,0,0];
  life_fed_scam camSetFov 0.5;
  life_fed_scam camCommit 0;
  "rendertarget0" setPiPEffect [0];
  life_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
  _laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
  case "neochori_front": {
    life_fed_scam camSetPos [12366.5,14407.9,8.17152];
    life_fed_scam camSetTarget [12357.6,14366.3,1.62453];
    life_fed_scam camCommit 0;
  };
  
  case "neochori_inside": {
    life_fed_scam camSetPos [12355.3,14366.2,3.39582];
    life_fed_scam camSetTarget [12353.1,14350.8,2.37973];
    life_fed_scam camCommit 0;
  };
  
  case "neochori_back": {
    life_fed_scam camSetPos [12311.1,14319.6,6.69341];
    life_fed_scam camSetTarget [12339,14353.8,2.19035];
    life_fed_scam camCommit 0;
  };
  
  case "neochori_vault": {
    life_fed_scam camSetPos [12346.2,14361.8,3.46254];
    life_fed_scam camSetTarget [12339.3,14366,2.01282];
    life_fed_scam camCommit 0;
  };
  
  case "mint_front": {
    life_fed_scam camSetPos [16082.8,17000.2,20.4854];
    life_fed_scam camSetTarget [16040.1,17030.2,3.06523];
    life_fed_scam camCommit 0;
  };
    
  case "mint_back": {
    life_fed_scam camSetPos [15898.8,17031,15.5118];
    life_fed_scam camSetTarget [15990.8,17043.3,4.32954];
    life_fed_scam camCommit 0;
  };
  
  case "mint_vault_1": {
    life_fed_scam camSetPos [16018.9,17034.7,2.76748];
    life_fed_scam camSetTarget [16022.2,17026.7,1.96292];
    life_fed_scam camCommit 0;
  };
  
  case "mint_vault_2": {
    life_fed_scam camSetPos [16001.8,17044.4,2.74875];
    life_fed_scam camSetTarget [16004.9,17037.5,1.60801];
    life_fed_scam camCommit 0;
  };
  
  case "mint_vault_3": {
    life_fed_scam camSetPos [16019.4,17049.6,2.73546];
    life_fed_scam camSetTarget [16016.2,17056.4,1.59712];
    life_fed_scam camCommit 0;
  };
  
  case "mint_vault_4": {
    life_fed_scam camSetPos [16033.6,17041,2.55064];
    life_fed_scam camSetTarget [16030.5,17047.7,1.59531];
    life_fed_scam camCommit 0;
  };
  
  case "mint_dome": {
    life_fed_scam camSetPos [16038.8,17039.1,9.70111];
    life_fed_scam camSetTarget [16018.5,17036.8,0.906106];
    life_fed_scam camCommit 0;
  };
  
  case "kavala_dealer": {
    life_fed_scam camSetPos [3604.7,10866.8,6.34502];
    life_fed_scam camSetTarget [3622.94,10853.6,1.7053];
    life_fed_scam camCommit 0;
  };
  
  case "kavala_square_1": {
    life_fed_scam camSetPos [3628.7,13144.2,13.3358];
    life_fed_scam camSetTarget [3648.66,13108.5,2.08342];
    life_fed_scam camCommit 0;
  };
  
  case "pyrgos_dealer": {
    life_fed_scam camSetPos [17878.6,18076.7,2.84396];
    life_fed_scam camSetTarget [17853,18075.1,1.909];
    life_fed_scam camCommit 0;
  };
  
  case "oil_rig": {
    life_fed_scam camSetPos [27773.6,14377.9,19.2221];
    life_fed_scam camSetTarget [27788.9,14393.6,8.00751];
    life_fed_scam camCommit 0;
  };
  
  case "off" :{
    life_fed_scam cameraEffect ["terminate", "back"];
    camDestroy life_fed_scam;
    _laptop setObjectTexture [0,""];
    life_fed_scam = nil;
  };
};