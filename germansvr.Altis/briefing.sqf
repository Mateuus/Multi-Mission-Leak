waitUntil {!isServer && !isNull player && player isEqualTo player};
if (player diarySubjectExists "controls") exitWith {};

player createDiarySubject ["credits","ALLE INFOS"];

/*  Example
    player createDiaryRecord ["", //Container
        [
            "", //Subsection
                "
TEXT HERE<br/><br/>
                "
        ]
    ];
*/

    player createDiaryRecord ["credits",
        [
            "Informationen",
                "
Unsere Webseite: NextGeneration-Life.de<br>
Unser TS: NextGeneration-Life.de<br>
<br>
                "
        ]
    ];