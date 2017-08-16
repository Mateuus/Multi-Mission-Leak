/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Switches the stance and shooting mode of a sharpshooter
*/

private["_stance"];

_stance = (_this select 3) select 0;

if(DS_coastGuard == 0)then{DS_coastGuardUniform = uniform player;DS_coastGuardVest = vest player;};

switch(_stance)do
	{
	case 0:
		{
		DS_coastGuard = 0;
		player forceAddUniform DS_coastGuardUniform;
		player addVest DS_coastGuardVest;
			{
				player addItemToUniform _x;
			}forEach DS_coastGuardUniformItems;
			{
				player addItemToVest _x;
			}forEach DS_coastGuardVestItems;
		DS_coastGuardAction = false;
		[] call DS_fnc_stamina;
		[] call DS_fnc_copUniform;
		};
	case 1:
		{
		DS_coastGuard = 1;
		DS_coastGuardUniformItems = uniformItems player;
		DS_coastGuardVestItems = vestItems player;
		removeUniform player;
		player forceAddUniform "U_B_Wetsuit";
		player addVest "V_RebreatherB";
			{
				player addItemToUniform _x;
			}forEach DS_coastGuardUniformItems;
		DS_coastGuardAction = true;
		};
	};