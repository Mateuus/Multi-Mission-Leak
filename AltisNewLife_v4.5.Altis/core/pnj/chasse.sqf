_this enableSimulation false;
_this allowDamage false;
_this addAction["Marche",life_fnc_virt_menu,"chasse",0,false,false,"",' liciv_chasse'];
_this addAction["Magasin General",life_fnc_weaponShopMenu,"genstore",0,false,false,"",'']; 
_this addAction["Armurerie",life_fnc_weaponShopMenu,"gun",0,false,false,"",' liciv_gun'];
_this addAction["Permis de port d'arme",life_fnc_buyLicense,"gun",0,false,false,"",' !liciv_gun'];