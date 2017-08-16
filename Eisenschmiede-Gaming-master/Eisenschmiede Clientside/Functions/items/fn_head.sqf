 _HoHoHo = "RoadCone_F" createVehicle position player;
_HoHoHo attachTo [player, [-0.05,-0.05,0.4],"Head"];

_Fuss = "Land_Football_01_F" createVehicle position player; 
_Fuss attachTo [player, [-0.05,-0.05,0.66],"Head"];  

_texture =  "#(rgb,8,8,3)color(1,0,0,1)";
_HoHoHo setObjectTextureGlobal [0, _texture];
_HoHoHo setObjectTextureGlobal [1, _texture];
