 
 
 
 
 
private["_muellC","_staedte","_distMeter","_farbeSet"]; 
_muellC = (_this select 0); 
_staedte =  
[ 
["",""],["Kavala",(_muellC select 0)],["Panochori",(_muellC select 1)],["Zaros",(_muellC select 2)], 
["Gravia",(_muellC select 3)],["Athira",(_muellC select 4)],["Pyrgos",(_muellC select 5)], 
["Paros",(_muellC select 6)],["Sofia",(_muellC select 7)],["Feres",(_muellC select 8)], 
["Kore",(_muellC select 9)],["Neri",(_muellC select 10)],["Agios Dionysios",(_muellC select 11)], 
["Poliakko",(_muellC select 12)],["Chalkeia",(_muellC select 13)],["Negades",(_muellC select 14)], 
["Syrta",(_muellC select 15)],["Dorida",(_muellC select 16)],["Abdera",(_muellC select 17)], 
["Molos",(_muellC select 18)] 
]; 
_distMeter = 
[ 
["",""],["50 Meter",[50],1000],["100 Meter",[100],900],["150 Meter",[150],800],["200 Meter",[200],700],["250 Meter",[250],600] 
]; 
_farbeSet = 
[ 
["",""],["Rot","ColorRed",200],["Grau","ColorGrey",10],["Gruen","ColorGreen",400], 
["Blau","ColorBlue",150],["Weiss","ColorWhite",270],["Pink","ColorPink",120], 
["Gelb","ColorYellow",300],["Orange","ColorOrange",200] 
]; 
 
muellSetContainers = [_staedte,_distMeter,_farbeSet]; 
publicvariable "muellSetContainers";