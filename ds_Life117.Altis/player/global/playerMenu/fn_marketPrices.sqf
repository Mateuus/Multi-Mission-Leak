/*
	File: fn_marketPrices.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Displays a hint with market price stats
*/

private ["_bread","_wood","_imgWood","_imgWeed","_imgHeroin","_imgcocaine","_imgoil","_imgcopper","_imgiron","_imgsalt","_imgglass","_imgdiamond","_imgcement","_imglegalrelic","_imgillegalrelic","_meth","_imgmeth"];

if(playerside == west) exitwith {hint "Police can not check this, check drug prices at a drug dealer"};//How did that even happen

_weed = (DS_sellArray select 28);
_heroin = (DS_sellArray select 27);
_cocaine = (DS_sellArray select 29);
_oil = (DS_sellArray select 50);
_copper = (DS_sellArray select 52);
_iron = (DS_sellArray select 55);
_salt = (DS_sellArray select 54);
_glass = (DS_sellArray select 56);
_diamond = (DS_sellArray select 51);
_cement = (DS_sellArray select 53);
_legalrelic = (DS_sellArray select 57);
_illegalrelic = (DS_sellArray select 34);
_meth = (DS_sellArray select 39);
_wood = (DS_sellArray select 75);
_bread = (DS_sellArray select 113);

if((illegalItems select 2) == 0) then {_imgWeed = "extras\icons\mup.jpg";}else{if((illegalItems select 2) == 1) then {_imgWeed = "extras\icons\mdown.jpg";}else{_imgWeed = "extras\icons\mballance.jpg";};};
if((illegalItems select 1) == 0) then {_imgHeroin = "extras\icons\mup.jpg";}else{if((illegalItems select 1) == 1) then {_imgHeroin = "extras\icons\mdown.jpg";}else{_imgHeroin = "extras\icons\mballance.jpg";};};
if((illegalItems select 0) == 0) then {_imgcocaine = "extras\icons\mup.jpg";}else{if((illegalItems select 0) == 1) then {_imgcocaine = "extras\icons\mdown.jpg";}else{_imgcocaine = "extras\icons\mballance.jpg";};};
if((legalItems select 6) == 0) then {_imgoil = "extras\icons\mup.jpg";}else{if((legalItems select 6) == 1) then {_imgoil = "extras\icons\mdown.jpg";}else{_imgoil = "extras\icons\mballance.jpg";};};
if((legalItems select 0) == 0) then {_imgcopper = "extras\icons\mup.jpg";}else{if((legalItems select 0) == 1)then{_imgcopper = "extras\icons\mdown.jpg";}else{_imgcopper = "extras\icons\mballance.jpg";};};
if((legalItems select 1) == 0) then {_imgiron = "extras\icons\mup.jpg";}else{if((legalItems select 1) == 1) then{_imgiron = "extras\icons\mdown.jpg";}else{_imgiron = "extras\icons\mballance.jpg";};};
if((legalItems select 2) == 0) then {_imgsalt = "extras\icons\mup.jpg";}else{if((legalItems select 2) == 1) then {_imgsalt = "extras\icons\mdown.jpg";}else{_imgsalt = "extras\icons\mballance.jpg";};};
if((legalItems select 3) == 0) then {_imgglass = "extras\icons\mup.jpg";}else{if((legalItems select 3) == 1) then {_imgglass = "extras\icons\mdown.jpg";}else{_imgglass = "extras\icons\mballance.jpg";};};
if((legalItems select 4) == 0) then {_imgdiamond = "extras\icons\mup.jpg";}else{if((legalItems select 4) == 1)then{_imgdiamond = "extras\icons\mdown.jpg";}else{_imgdiamond = "extras\icons\mballance.jpg";};};
if((legalItems select 5) == 0) then {_imgcement = "extras\icons\mup.jpg";}else{if((legalItems select 5) == 1)then{_imgcement = "extras\icons\mdown.jpg";}else{_imgcement = "extras\icons\mballance.jpg";};};
if((legalItems select 7) == 0) then {_imglegalrelic = "extras\icons\mup.jpg";}else{if((legalItems select 7) == 1) then {_imglegalrelic = "extras\icons\mdown.jpg";}else{_imglegalrelic = "extras\icons\mballance.jpg";};};
if((legalItems select 8) == 0) then {_imgwood = "extras\icons\mup.jpg";}else{if((legalItems select 8) == 1) then {_imgwood = "extras\icons\mdown.jpg";}else{_imgwood = "extras\icons\mballance.jpg";};};
if((illegalItems select 3) == 0) then {_imgillegalrelic = "extras\icons\mup.jpg";}else{if((illegalItems select 3) == 1)then{_imgillegalrelic = "extras\icons\mdown.jpg";}else{_imgillegalrelic = "extras\icons\mballance.jpg";};};
if((illegalItems select 4) == 0) then {_imgmeth = "extras\icons\mup.jpg";}else{if((illegalItems select 4) == 1)then{_imgmeth = "extras\icons\mdown.jpg";}else{_imgmeth = "extras\icons\mballance.jpg";};};

//-------Title Information---------

_str = parseText format ["<t color='#4CCF00' size='2'>Market Information</t><br/><br/>
<t color='#FFFF00'>Prices</t><br/>
<t color='#FFFF00'><t align='left'>| Trend |</t><t align='right'>| Current |</t></t><br/>
-------Crystal Meth-------<br/>
<t align='left'><img image= '%37' /></t><t color='#FFFF00'><t align='right'>$%39  </t></t><br/>
----------Weed---------<br/>
<t align='left'><img image= '%1' /></t><t color='#FFFF00'><t align='right'>$%3   </t></t><br/>
---------Heroin--------<br/>
<t align='left'><img image= '%4' /></t><t color='#FFFF00'><t align='right'>$%6   </t></t><br/>
---------Cocaine--------<br/>
<t align='left'><img image= '%7' /></t><t color='#FFFF00'><t align='right'>$%9   </t></t><br/>
-----Illegal Relics-----<br/>
<t align='left'><img image= '%10' /></t><t color='#FFFF00'><t align='right'>$%12   </t></t><br/>
------legal Relics------<br/>
<t align='left'><img image= '%13' /></t><t color='#FFFF00'><t align='right'>$%15  </t></t><br/>
-----------Oil----------<br/>
<t align='left'><img image= '%16' /></t><t color='#FFFF00'><t align='right'>$%18  </t></t><br/>
---------Copper---------<br/>
<t align='left'><img image= '%19' /></t><t color='#FFFF00'><t align='right'>$%21  </t></t><br/>
----------Iron----------<br/>
<t align='left'><img image= '%22' /></t><t color='#FFFF00'><t align='right'>$%24  </t></t><br/>
----------Salt----------<br/>
<t align='left'><img image= '%25' /></t><t color='#FFFF00'><t align='right'>$%27  </t></t><br/>
----------Glass---------<br/>
<t align='left'><img image= '%28' /></t><t color='#FFFF00'><t align='right'>$%30  </t></t><br/>
---------Diamond--------<br/>
<t align='left'><img image= '%31' /></t><t color='#FFFF00'><t align='right'>$%33  </t></t><br/>
----------Cement--------<br/>
<t align='left'><img image= '%34' /></t><t color='#FFFF00'><t align='right'>$%36  </t></t><br/>
----------Lumber--------<br/>
<t align='left'><img image= '%42' /></t><t color='#FFFF00'><t align='right'>$%41  </t></t><br/>
-----------Bread--------<br/>
<t color='#FFFF00'><t align='right'>$%43  </t></t><br/><br/><br/>
---Money in Police Bank--<br/>
<t color='#FFFF00'>$%40</t><br/>
"





,_imgWeed,
_weed,
_weed,
_imgHeroin,
_weed,
_heroin,
_imgcocaine,
_weed,
_cocaine,
_imgillegalrelic,
_weed,
_illegalrelic,
_imglegalrelic,
_weed,
_legalrelic,
_imgoil,
_weed,
_oil,
_imgcopper,
_weed,
_copper,
_imgiron,
_weed,
_iron,
_imgsalt,
_weed,
_salt,
_imgglass,
_weed,
_glass,
_imgdiamond,
_weed,
_diamond,
_imgcement,
_weed,
_cement,
_imgmeth,
_weed,
_meth,
[DS_policebank] call DS_fnc_numberText,
_wood,
_imgWood,
_bread
];




hint _str;
