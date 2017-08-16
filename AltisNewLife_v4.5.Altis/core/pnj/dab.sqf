_this enableSimulation false;
_this allowDamage false;
_this addAction["<t color='#ADFF2F'>DAB</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 2.5 '];
_this addAction["Fracturer",life_fnc_robATM,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 2.5 '];
_this addAction["<t color='#ADFF2F'>Remplir le DAB</t>",life_fnc_fullDAB,"",0,FALSE,FALSE,"",'brinks_inMission && vehicle player == player && player distance _target < 4 '];