// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#define welcomeText 3200

10 cutrsc["WelcomeMessage", "PLAIN"];

disableSerialization;

_display = uiNamespace getVariable "WelcomeMessage";
_control = _display displayCtrl welcomeText;

private ["_teamrules", "_teamicon", "_teamcol"];




_message = "<t shadow=""1"" align=""center"" size=""2.3"" color=""#FF0000"">Willkommen bei<br/><t size=""6"" color=""#800000"">Division Wolf </t><br/><br/>
Da du Combatlog betrieben hast, haben wir dich Umgezogen.<br/><br/><br/><t align=""left"" size=""1.25"" color=""#00FF00"">
Wenn du tot bist musst du Respawnen oder dich Wiederbeleben lassen.<br/><br/>
Wärend du tot bist darfst du das Spiel nicht ausschalten. Ansonsten zählt es als Combatlog.<br/><br/>
Combatlog ist bei uns verboten und kann zu einem Ban führen.<br/><br/>
Wenn du kurz vor einem Serverrestart tot bist, und der Server restartet, kannst du nichts dafür!<br/><br/>
Teamspeak: ts.division-wolf.de</t></t>";
_control ctrlSetStructuredText (parseText _message);

sleep 20;

_control ctrlSetFade 1;
_control ctrlCommit 2;

waitUntil {ctrlCommitted _control};

_control ctrlShow false;
_control ctrlCommit 0;


