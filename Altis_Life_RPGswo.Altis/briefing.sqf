waitUntil {sleep 1; !isNull player && player == player};
pIayer = player;
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["divisionwolf","Division Wolf"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","Allgemeine Regeln"];
player createDiarySubject ["roleplay","Roleplay Regeln"];
player createDiarySubject ["policerules","Polizei Regeln"];
player createDiarySubject ["safezones","Safe Zones"];
player createDiarySubject ["anfaenger","Anfängerschutz"];
player createDiarySubject ["illegalitems","Illegale Aktivitäten"];
player createDiarySubject ["lotto","Lotto"];
player createDiarySubject ["newjobs","Berufe und Verarbeitungswege"];
player createDiarySubject ["spawnpass","Spawnpässe"];
player createDiarySubject ["pvpzone","PvP Zone"];
player createDiarySubject ["sonstiges","Sonstige Informationen"];
player createDiarySubject ["streaming","Streaming / Youtube"];
player createDiarySubject ["controls","Tastenkürzel"];
player createDiarySubject ["musicaddon","Music Addon"];
player createDiarySubject ["premium","PREMIUM"];
player createDiarySubject ["playerindex","Playerindex"];


#include "briefing\Changelog.sqf";
#include "briefing\Vip.sqf";
#include "briefing\Sicherheitsdienst.sqf";
#include "briefing\Serverinfo.sqf";
#include "briefing\Anfaenger.sqf";
#include "briefing\Streaming.sqf";
#include "briefing\Regeln.sqf";
#include "briefing\spawnpass.sqf";
#include "briefing\tanken.sqf";
#include "briefing\Tasten.sqf";
#include "briefing\Sonstiges.sqf";
#include "briefing\Music.sqf";	
#include "briefing\Playerindex.sqf";
#include "briefing\lotto.sqf";
#include "briefing\PvPZone.sqf";



switch (worldName) do
{
	case "Altis":
	{
		#include "briefing\AltisBerufe.sqf";
	};
	case "Tanoa":
	{
		#include "briefing\TanoaBerufe.sqf";
	};
	case "Stratis":{};
};



