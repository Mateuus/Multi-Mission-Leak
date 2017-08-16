_this enableSimulation false;
_this allowDamage false;
_this addAction["Service Medical",life_fnc_healHospital,"heilen"];
_this addAction["Recuperer un rein",life_fnc_healkidney,""];
_this addAction["Verifier maladie sexuel",life_fnc_healHospital,"checken"];
_this addAction["Traiter maladie Sexuel",life_fnc_healHospital,"behandeln"];
_this addAction["Traiter addiction aux drogues",life_fnc_therapie];
_this setVariable["realname","Medecin d'urgence"];
_this setObjectTexture [0,"images\med\samu.paa"];
