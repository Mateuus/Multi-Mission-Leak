/*
    File: fn_gagged.sqf
    Author: Lowheartrate & Panda
*/
private["_gagger"];
_gagger = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
hint format["You have been gagged by %1.", _gagger getVariable["realname",_gagger]];
titleText ["You have a gag over your mouth, you can no longer talk!", "PLAIN"];
enableRadio false;
1 enableChannel false; //-- Side Chat
3 enableChannel false; //-- Group Chat
4 enableChannel false; //-- Vehicle Chat
5 enableChannel false; //-- Direct Chat
waitUntil{!(player getVariable ["gagged",false]) OR !(player getVariable ["tied",false])};
hint format["The gag was removed, you can again speak!"];
titleText ["You're not gagged", "PLAIN"];
enableRadio true;
1 enableChannel true; //-- Side Chat
3 enableChannel true; //-- Group Chat
4 enableChannel true; //-- Vehicle Chat
5 enableChannel true; //-- Direct Chat