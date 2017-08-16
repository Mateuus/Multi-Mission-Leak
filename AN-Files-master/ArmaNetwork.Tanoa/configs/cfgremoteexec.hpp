#define F(NAME,TARGET) class NAME { \
	allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;
		/* Client only functions */
		F(life_fnc_quvucamaph,CLIENT)
		F(life_fnc_brusathusek,CLIENT)
		F(life_fnc_crepufefrugu,CLIENT)
		F(life_fnc_yaguthazest,CLIENT)
		F(life_fnc_nuphecast,CLIENT)
		F(life_fnc_vexadune,CLIENT)
		F(life_fnc_xaphetrapath,CLIENT)
		F(life_fnc_frexekespud,CLIENT)
		F(life_fnc_moveIn,CLIENT)
		F(life_fnc_copSearch,CLIENT)
		F(life_fnc_spafraprubu,CLIENT)
		F(life_fnc_clientGetKey,CLIENT)
		F(life_fnc_jugukupha,CLIENT)
		F(life_fnc_juweghygs,CLIENT)
		F(life_fnc_brafa,CLIENT)
		F(life_fnc_statr,CLIENT)

		/* Server only functions */
		F(bis_fnc_execvm,SERVER)

		/* Functions for everyone */
		F(life_fnc_brusathusek,ANYONE)
	};
	class Commands
	{
		mode=1;
		jip=0;
		F(setFuel,ANYONE)
		F(lock,ANYONE)
		F(addWeapon,ANYONE)
		F(addMagazine,ANYONE)
		F(addPrimaryWeaponItem,ANYONE)
		F(addHandgunItem,ANYONE)
	};
};
