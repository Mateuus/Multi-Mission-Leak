[] spawn 
{ 
while{true} do  
{ 
if(schranke_pyrgos_1 getVariable ["gate",true]) then {schranke_pyrgos_1 animate ["Door_1_rot",0]}; 
if(schranke_pyrgos_2 getVariable ["gate",true]) then {schranke_pyrgos_2 animate ["Door_1_rot",0]}; 
if(schranke_kavala_1 getVariable ["gate",true]) then {schranke_kavala_1 animate ["Door_1_rot",0]}; 
if(schranke_kavala_2 getVariable ["gate",true]) then {schranke_kavala_2 animate ["Door_1_rot",0]}; 
if(schranke_vikos_1 getVariable ["gate",true]) then {schranke_vikos_1 animate ["Door_1_rot",0]}; 
if(schranke_vikos_2 getVariable ["gate",true]) then {schranke_vikos_2 animate ["Door_1_rot",0]}; 
if(schranke_insel_1 getVariable ["gate",true]) then {schranke_insel_1 animate ["Door_1_rot",0]}; 
if(schranke_insel_2 getVariable ["gate",true]) then {schranke_insel_2 animate ["Door_1_rot",0]}; 
if(parkplatz_kavala_1 getVariable ["gate",true]) then {parkplatz_kavala_1 animate ["Door_1_rot",0]}; 
if(parkplatz_kavala_2 getVariable ["gate",true]) then {parkplatz_kavala_2 animate ["Door_1_rot",0]}; 
if(adac_schranke_1 getVariable ["gate",true]) then {adac_schranke_1 animate ["Door_1_rot",0]}; 
if(adac_schranke_2 getVariable ["gate",true]) then {adac_schranke_2 animate ["Door_1_rot",0]}; 
sleep 0.1; 
}; 
};