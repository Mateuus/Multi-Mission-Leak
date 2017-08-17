
[player] joinSilent (createGroup west);

hint parseText "<t color='#ff0000' size='1.4' shadow='2' align='center'>!!! Roleplay Warning !!!</t><br/><br/>A player has just removed you communication device and GPS, you can now only communicate with the nearby players using direct or vehicle chat!";

waitUntil {!(player getVariable ["tied", false])};

_grp = life_copGroup;
[player] joinSilent _grp;