_this enableSimulation false; 
_this allowDamage false; 
_this setObjectTexture [0, "images\panneaux\bazar.jpg"];
_this addAction["<t color='#ADFF2F'>DAB</t>",life_fnc_atmMenu];
_this addAction["Magasin General",life_fnc_weaponShopMenu,"genstore",0,false,false,"",'']; 
_this addAction["Marche",life_fnc_virt_menu,"market"]; 
_this addAction["Vetements",life_fnc_clothingMenu,"bruce"];