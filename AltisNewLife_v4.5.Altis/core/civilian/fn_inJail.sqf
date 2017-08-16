life_pandaPrison_backpack = backpack player;
life_pandaPrison_uniform = uniform player;
life_pandaPrison_headgear = headgear player;
life_pandaPrison_vest = vest player;
uiSleep 1;
removeUniform player;
removeBackpack player;
removeHeadgear player;
removeVest player;
player addUniform "U_MillerBody";
if(life_inv_donuts < 1) then
{
	life_inv_donuts = life_inv_donuts + 1;
};

if(life_inv_coffee < 1) then
{
	life_inv_coffee = life_inv_coffee + 1;
};