/*
	fn_darktrader.sqf
	Author: G00golplexian
	
	Description: Halloweeen, wooouh....
*/

if!([false,"quest3",1] call life_fnc_handleinv) exitWith {hint "Du benötigst erst den dritten Hinweis um diese Quest entschlüsseln zu können!"};
if(loadbackpack player > 0.8) exitWith {hint "Du kannst nicht so viel tragen!"};
if(backpack player == "") then {player addbackpack "B_TacticalPack_ocamo"};

quest_halloween = true;
erfolg_halloween = true;
["erfolg_halloween"] spawn life_fnc_erfolgerhalten;

["Verflucht"] call life_fnc_zustand;

titleText["Wwww..Wie hast du mich gefffffffunden?","PLAIN DOWN"];
sleep 5;
titleFadeOut 2;
titleText["Dassss ist unmöööööglich!","PLAIN DOWN"];
sleep 5;
titleFadeOut 2;
titleText["Ooookaayy hier nimmmmm!","PLAIN DOWN"];
sleep 5;
titleFadeOut 2;
titleText["Duuuuu bist verflucht! Bring diessssseee Leichenteile des ertrunkenen Mädchens zu Voodoopriester Gölsahn Schiniagski","PLAIN DOWN"];
sleep 7;
titleFadeOut 2;

[true,"darkorb",1] call life_fnc_handleinv;
[true,"darkuni",1] call life_fnc_handleinv;
[true,"skelett",1] call life_fnc_handleinv;

life_beatgeld = life_beatgeld + 100000;
life_exp = life_exp + 10000;
[] spawn life_fnc_exptolevel;

sleep 1;

[[["Quest 4:","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
["Der Außerirdische","<t align = 'center' shadow = '1' size = '0.7' color='#ff1000'>%1</t><br/>"],
["Ein Außerirdischer ist auf der Insel gestrandet, er hat mir unheimliche Dinge zugesteckt! Was ist das?! Ein Skelett? Ich sollte besser die Leichenteile des ertrunkenen Mädchens zu Gölsahn dem Voodoopriester bringen.","<t align = 'center' shadow = '1' size = '0.5'>%1</t>"]]] spawn BIS_fnc_typeText;