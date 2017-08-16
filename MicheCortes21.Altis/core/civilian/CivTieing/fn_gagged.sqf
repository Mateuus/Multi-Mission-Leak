/*
    File: fn_gagged.sqf
    Author: Lowheartrate & Panda
*/
private["_gagger"];
_gagger = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
hint format["Du wurdest geknebelt von %1.", _gagger getVariable["realname",_gagger]];
titleText ["Du hast einen Knebel im Mund, du kannst jetzt nicht mehr sprechen!", "PLAIN"];
enableRadio false;
5 enableChannel false;
3 enableChannel false;
4 enableChannel false;
waitUntil{!(player getVariable ["gagged",false]) OR !(player getVariable ["tied",false])};
hint format["Der Knebel wurde entfernt, du kannst jetzt wieder sprechen!"];
titleText ["Du bist nicht geknebelt", "PLAIN"];
enableRadio true;
5 enableChannel true;
3 enableChannel true;
4 enableChannel true;