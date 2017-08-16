_this enableSimulation false; 
_this allowDamage false;
_this addAction["<t color='#ADFF2F'>DAB</t>",life_fnc_atmMenu];
_this addAction["Marche",life_fnc_virt_menu,"cop"];
_this addAction["Uniformes",life_fnc_clothingMenu,"cop"];
_this addAction["Armes Gendarmerie",life_fnc_weaponShopMenu,"cop_gendarme",0,false,false,"",''];
_this addAction["Permis de conduire 500$",life_fnc_buyLicense,"cdriver",0,false,false,"",' !licop_cdriver && playerSide == west '];
_this addAction["Permis pilote 1500$",life_fnc_buyLicense,"cair",0,false,false,"",' !licop_cair && playerSide == west '];
_this addAction["Permis bateau 1000$",life_fnc_buyLicense,"cg",0,false,false,"",' !licop_cg && playerSide == west '];