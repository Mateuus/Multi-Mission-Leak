/*
    Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Displays welcome information to the player
*/

if((DS_perkLevel < 5)&&(DS_donorLevel isEqualTo 5))then{DS_perkLevel = 5};
if((DS_perkLevel < 4)&&(DS_donorLevel isEqualTo 4))then{DS_perkLevel = 4};

//General information
_strings = [
    "The Darkside presents...",
    "The Darkside Life",
    "A RPG mission created by Huntah for The Darkside Games",
    "The server rules can be found on the map screen"
];

sleep 3;

{
    [format ["<t color='#286FDA' shadow='2' font='RobotoCondensed' size='1.2'>%1</t>",_x],-1,-1,4,1,0] spawn BIS_fnc_dynamicText;
    sleep 8;
} forEach _strings;

sleep 3;

//Server info
["<t color='#286FDA' shadow='2' font='RobotoCondensed' size='0.9' align='left'>Join our TeamSpeak at...<br/></t>
  <t color='#FFFFFF' shadow='2' font='RobotoCondensed' size='0.7' align='left'>ts.thedarksidegames.com:10004</t>",
[safezoneX + safezoneW - 2.4,0.70],[safezoneY + safezoneH - 0.8,0.7],4,1,0] spawn BIS_fnc_dynamicText;

sleep 8;

["<t color='#286FDA' shadow='2' font='RobotoCondensed' size='0.9' align='left'>Senior Server Admins are...<br/></t>
  <t color='#FFFFFF' shadow='2' font='RobotoCondensed' size='0.7' align='left'>Huntah, Mad Maxx, SCORPIOX, Bartender <br/>Nolegs and The Governor</t>",
[safezoneX + safezoneW - 2.4,0.70],[safezoneY + safezoneH - 0.8,0.7],4,1,0] spawn BIS_fnc_dynamicText;

sleep 8;

["<t color='#286FDA' shadow='2' font='RobotoCondensed' size='0.9' align='left'>Server Admins/Mods are...<br/></t>
  <t color='#FFFFFF' shadow='2' font='RobotoCondensed' size='0.7' align='left'>Fliqqs, ZrMz_x, Nectole, SunDragoness <br/>NinjaGlory, Gridlock, Lynxaa, Luke <br/>Mongoose, Syn, Karl, Pommie and Jimmy James</t>",
[safezoneX + safezoneW - 2.4,0.7],[safezoneY + safezoneH - 0.8,0.7],4,1,0] spawn BIS_fnc_dynamicText;