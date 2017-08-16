/*
Description:
Starting the client
*/

player allowDamage false;
player enableSimulation false;

systemChat "::Server INIT:: Loading Client INIT 20%...";

waitUntil {!(isNull (findDisplay 46))};

systemChat "::Server INIT:: Loading Client INIT 50%...";

waitUntil{!isNull player};

systemChat "::Server INIT:: Loading Client INIT 70%...";

waitUntil{player == player};

systemChat "::Server INIT:: Loading Client INIT 80%...";

waitUntil{time > 0.1};

systemChat "::Server INIT:: Loading Client INIT 90%...";

waitUntil {!(isNull player)};

[player] remoteExec ["RPP_Client_init",2];

systemChat "::Server INIT:: Loading Client INIT 100%.";