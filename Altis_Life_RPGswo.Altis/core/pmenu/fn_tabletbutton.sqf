#include "..\..\macros.hpp"
/*

	file: fn_tabletbutton.sqf
	Author: Division Wolf (Sandmann / MarkusSR1984)
*/
private["_mode"];
_mode = param [0,"",[""]];
_side = param [1,civilian,[civilian]];

#define ctrl_wolftablet 505000
#define ctrl_grafik_1 505001
#define ctrl_button_1 506001
#define ctrl_grafik_2 505002
#define ctrl_button_2 506002
#define	ctrl_grafik_3 505003
#define	ctrl_button_3 506003
#define	ctrl_grafik_4 505004
#define	ctrl_button_4 506004
#define	ctrl_grafik_5 505005
#define	ctrl_button_5 506005
#define	ctrl_grafik_6 505006
#define	ctrl_button_6 506006
#define	ctrl_grafik_7 505007
#define	ctrl_button_7 506007
#define	ctrl_grafik_8 505008
#define	ctrl_button_8 506008
#define	ctrl_grafik_9 505009
#define	ctrl_button_9 506009
#define	ctrl_grafik_10 505010
#define	ctrl_button_10 506010
#define	ctrl_grafik_11 505011
#define	ctrl_button_11 506011
#define	ctrl_grafik_12 505012
#define	ctrl_button_12 506012
#define	ctrl_grafik_13 505013
#define	ctrl_button_13 506013
#define	ctrl_grafik_14 505014
#define	ctrl_button_14 506014
#define	ctrl_grafik_15 505015
#define	ctrl_button_15 506015
#define	ctrl_grafik_16 505016
#define	ctrl_button_16 506016
#define	ctrl_grafik_17 505017
#define	ctrl_button_17 506017
#define	ctrl_grafik_18 505018
#define	ctrl_button_18 506018
#define	ctrl_grafik_19 505019
#define	ctrl_button_19 506019
#define	ctrl_grafik_20 505020
#define	ctrl_button_20 506020
#define	ctrl_grafik_21 505021
#define	ctrl_button_21 506021
#define	ctrl_grafik_22 505022
#define	ctrl_button_22 506022
#define	ctrl_grafik_23 505023
#define	ctrl_button_23 506023
#define	ctrl_grafik_24 505024
#define	ctrl_button_24 506024
#define	ctrl_grafik_25 505025
#define	ctrl_button_25 506025

ctrlSetText[ctrl_wolftablet, ""];
ctrlSetText[ctrl_grafik_1, ""];
buttonSetAction [ctrl_button_1, ""];
ctrlSetText[ctrl_grafik_2, ""];
buttonSetAction [ctrl_button_2, ""];
ctrlSetText[ctrl_grafik_3, ""];
buttonSetAction [ctrl_button_3, ""];
ctrlSetText[ctrl_grafik_4, ""];
buttonSetAction [ctrl_button_4, ""];
ctrlSetText[ctrl_grafik_5, ""];
buttonSetAction [ctrl_button_5, ""];
ctrlSetText[ctrl_grafik_6, ""];
buttonSetAction [ctrl_button_6, ""];
ctrlSetText[ctrl_grafik_7, ""];
buttonSetAction [ctrl_button_7, ""];
ctrlSetText[ctrl_grafik_8, ""];
buttonSetAction [ctrl_button_8, ""];
ctrlSetText[ctrl_grafik_9, ""];
buttonSetAction [ctrl_button_9, ""];
ctrlSetText[ctrl_grafik_10, ""];
buttonSetAction [ctrl_button_10, ""];
ctrlSetText[ctrl_grafik_11, ""];
buttonSetAction [ctrl_button_11, ""];
ctrlSetText[ctrl_grafik_12, ""];
buttonSetAction [ctrl_button_12, ""];
ctrlSetText[ctrl_grafik_13, ""];
buttonSetAction [ctrl_button_13, ""];
ctrlSetText[ctrl_grafik_14, ""];
buttonSetAction [ctrl_button_14, ""];
ctrlSetText[ctrl_grafik_15, ""];
buttonSetAction [ctrl_button_15, ""];
ctrlSetText[ctrl_grafik_16, ""];
buttonSetAction [ctrl_button_16, ""];
ctrlSetText[ctrl_grafik_17, ""];
buttonSetAction [ctrl_button_17, ""];
ctrlSetText[ctrl_grafik_18, ""];
buttonSetAction [ctrl_button_18, ""];
ctrlSetText[ctrl_grafik_19, ""];
buttonSetAction [ctrl_button_19, ""];
ctrlSetText[ctrl_grafik_20, ""];
buttonSetAction [ctrl_button_20, ""];
ctrlSetText[ctrl_grafik_21, ""];
buttonSetAction [ctrl_button_21, ""];
ctrlSetText[ctrl_grafik_22, ""];
buttonSetAction [ctrl_button_22, ""];
ctrlSetText[ctrl_grafik_23, ""];
buttonSetAction [ctrl_button_23, ""];
ctrlSetText[ctrl_grafik_24, ""];
buttonSetAction [ctrl_button_24, ""];
ctrlSetText[ctrl_grafik_25, ""];
buttonSetAction [ctrl_button_25, ""];

switch (_mode) do
{
	case "main":
	{
		// Knöpfe und Bilder für alle

		ctrlSetText[ctrl_wolftablet, "textures\Wolflogo\wolftablet.paa"];

		ctrlSetText[ctrl_grafik_1, "textures\Wolflogo\Tablet\inventar.paa"];
		buttonSetAction [ctrl_button_1, "createDialog ""playerSettings""; [] call DWEV_fnc_p_updateMenu;"];

		ctrlSetText[ctrl_grafik_2, "textures\Wolflogo\Tablet\lizenzen.paa"];
		buttonSetAction [ctrl_button_2, "createDialog ""playerSettings_lizenzen""; [] call DWEV_fnc_p_updateMenu;"];

		ctrlSetText[ctrl_grafik_3, "textures\Wolflogo\Tablet\smartphone.paa"];
		buttonSetAction [ctrl_button_3, "createDialog ""DWEV_my_smartphone"";"];

		ctrlSetText[ctrl_grafik_4, "textures\Wolflogo\Tablet\schluessel.paa"];
		buttonSetAction [ctrl_button_4, "createDialog ""DWEV_key_management"";"];
//		buttonSetAction [ctrl_button_4, "if(player != vehicle player) then {hint ""Nur außerhalb eines Fahrzeugs nutzbar."";} else {createDialog ""DWEV_key_management"";};"];

		ctrlSetText[ctrl_grafik_5, "textures\Wolflogo\Tablet\einstellung.paa"];
		buttonSetAction [ctrl_button_5, "[] call DWEV_fnc_settingsMenu;"];

		ctrlSetText[ctrl_grafik_6, ""]; //Fahnungsliste Polizei // Gang zivilist
		buttonSetAction [ctrl_button_6, ""]; //Fahnungsliste Polizei // Gang zivilist

		ctrlSetText[ctrl_grafik_7, ""]; //Backupknopf Polizei
		buttonSetAction [ctrl_button_7, ""]; //Backupknopf Polizei

		ctrlSetText[ctrl_grafik_8, ""]; // Wantedplus Polizei
		buttonSetAction [ctrl_button_8, ""]; // Wantedplus Polizei

		ctrlSetText[ctrl_grafik_9, ""]; //Einsatzzentrale
		buttonSetAction [ctrl_button_9, ""]; //Einsatzzentrale

		ctrlSetText[ctrl_grafik_10, "textures\Wolflogo\Tablet\info.paa"];
		buttonSetAction [ctrl_button_10, "[] call DWEV_fnc_InfoLinks;"];

		ctrlSetText[ctrl_grafik_11, "textures\Wolflogo\Tablet\icon_lotto.paa"];
		buttonSetAction [ctrl_button_11, "[] call DWEV_fnc_openLotto;"];
		
		ctrlSetText[ctrl_grafik_12, "textures\Wolflogo\Tablet\Ausweis.paa"];
		buttonSetAction [ctrl_button_12, "[player] spawn DWEV_fnc_zeigePerso; closeDialog 0;"];
		ctrlEnable [ctrl_button_12,DWEV_persoReady];
		if(!DWEV_persoReady) then {
			((findDisplay 504999) displayCtrl ctrl_button_12) ctrlSetTooltip "Du musst zuerst einen Personalausweis beim Einwohnermeldeamt beantragen!";
		};
		
		ctrlSetText[ctrl_grafik_13, ""];
		buttonSetAction [ctrl_button_13, ""];

		ctrlSetText[ctrl_grafik_14, ""];
		buttonSetAction [ctrl_button_14, ""];

		ctrlSetText[ctrl_grafik_15, ""];
		buttonSetAction [ctrl_button_15, ""];

		ctrlSetText[ctrl_grafik_16, ""];
		buttonSetAction [ctrl_button_16, ""];

		ctrlSetText[ctrl_grafik_17, ""];
		buttonSetAction [ctrl_button_17, ""];

		ctrlSetText[ctrl_grafik_18, ""];
		buttonSetAction [ctrl_button_18, ""];

		ctrlSetText[ctrl_grafik_19, ""];
		buttonSetAction [ctrl_button_19, ""];

		ctrlSetText[ctrl_grafik_20, ""]; //Adminmenü
		buttonSetAction [ctrl_button_20, ""]; //Adminmenü

		ctrlSetText[ctrl_grafik_21, "textures\Wolflogo\Tablet\speichern.paa"];
		buttonSetAction [ctrl_button_21, "[] call SOCK_fnc_syncData;"];

		ctrlSetText[ctrl_grafik_22, "textures\Wolflogo\Tablet\bugreport.paa"];
		buttonSetAction [ctrl_button_22, "createDialog ""bugHunter"";"];

		ctrlSetText[ctrl_grafik_23, ""];
		buttonSetAction [ctrl_button_23, ""];

		ctrlSetText[ctrl_grafik_24, ""];
		buttonSetAction [ctrl_button_24, ""];

		ctrlSetText[ctrl_grafik_25, ""];
		buttonSetAction [ctrl_button_25, ""];

		if (_side == west) then
		{
			ctrlSetText[ctrl_grafik_6, "textures\Wolflogo\Tablet\fahndung.paa"];
			buttonSetAction [ctrl_button_6, "[] call DWEV_fnc_wantedMenu;"];

			ctrlSetText[ctrl_grafik_7, "textures\Wolflogo\Tablet\backup.paa"];
			buttonSetAction [ctrl_button_7, "[] call DWEV_fnc_callbackup;"];

			ctrlSetText[ctrl_grafik_9, "textures\Wolflogo\Tablet\fw_zentrale.paa"];
			buttonSetAction [ctrl_button_9, "[] call DWEV_fnc_fwzentral_init;"];

			if(__GETC__(DWEV_coplevel) > 2) then
			{
			ctrlSetText[ctrl_grafik_8, "textures\Wolflogo\Tablet\wantedplus.paa"];
			buttonSetAction [ctrl_button_8, "createDialog ""DWEV_wantedadd2"";"];
			};
		};

		if (_side == civilian) then
		{
			ctrlSetText[ctrl_grafik_6, "textures\Wolflogo\Tablet\gang.paa"];
			buttonSetAction [ctrl_button_6, "if(isNil ""DWEV_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""DWEV_Create_Gang_Diag"";} else {[] spawn DWEV_fnc_gangMenu;};};"];
		};

		if (_side == independent) then
		{
			ctrlSetText[ctrl_grafik_9, "textures\Wolflogo\Tablet\fw_zentrale.paa"];
			buttonSetAction [ctrl_button_9, "[] call DWEV_fnc_fwzentral_init;"];
		};

		if (_side == east) then
		{
		ctrlSetText[ctrl_grafik_6, "textures\Wolflogo\Tablet\backup.paa"];
		buttonSetAction [ctrl_button_6, "[] call DWEV_fnc_callbackup;"];

		ctrlSetText[ctrl_grafik_7, "textures\Wolflogo\Tablet\fahndung.paa"];
		buttonSetAction [ctrl_button_7, "[] call DWEV_fnc_wantedMenu;"];

		ctrlSetText[ctrl_grafik_9, "textures\Wolflogo\Tablet\fw_zentrale.paa"];
		buttonSetAction [ctrl_button_9, "[] call DWEV_fnc_fwzentral_init;"];

		};

		if(__GETC__(DWEV_adminlevel) > 1) then //Ab S
		{
		ctrlSetText[ctrl_grafik_20, "textures\Wolflogo\Tablet\admin.paa"];
		buttonSetAction [ctrl_button_20, "createDialog ""DWEV_admin_menu"";"];
		};

		if(__GETC__(DWEV_adminlevel) > 3 && !((side player) == west)) then
		{
		ctrlSetText[ctrl_grafik_7, "textures\Wolflogo\Tablet\fahndung.paa"];
		buttonSetAction [ctrl_button_7, "[] call DWEV_fnc_wantedMenu;"];

		ctrlSetText[ctrl_grafik_8, "textures\Wolflogo\Tablet\wantedplus.paa"];
		buttonSetAction [ctrl_button_8, "createDialog ""DWEV_wantedadd2"";"];

		//ctrlSetText[ctrl_grafik_9, "textures\Wolflogo\Tablet\fw_zentrale.paa"];
		//buttonSetAction [ctrl_button_9, "[] call DWEV_fnc_fwzentral_init;"];
		};
	};
};
