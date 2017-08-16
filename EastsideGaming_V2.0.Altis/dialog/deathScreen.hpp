class DeathScreen {
    idd = 7300;
    name = "Life_Death_Screen";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground { };

    class Controls {

        class RespawnBtn: Life_RscButtonMenu {
            idc = 7302;
            x = 0.9 * safezoneW + safezoneX;
            y = 0.015 * safezoneH + safezoneY;
            w = (9 / 40);
            h = (1 / 25);
            text = "Respawn";
            onButtonClick = "closeDialog 0; life_respawned = true; [] call life_fnc_spawnMenu;";
            colorBackground[] = {0.149,0.149,0.149,1};
            class Attributes {align = "center";};
        };
    };
};
