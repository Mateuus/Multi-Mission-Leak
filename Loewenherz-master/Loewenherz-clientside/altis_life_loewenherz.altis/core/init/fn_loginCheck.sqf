
/*
    Author: H4SHK3KS,Blackd0g
    File: fn_loginCheck.sqf

    Description:
    Strips the player name for chars that are not allowed


*/
if(!(language in ["English","German"])) exitWith {
    cutText[format[localize "STR_INIT_loginFailedLanguage",language],"BLACK FADED"];
    0 cutFadeOut 9999999;
    false;
};
true;