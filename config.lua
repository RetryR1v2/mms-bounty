Config = {}

Config.BoardBlips = true
Config.BoardblipName = 'Auftragsbrett'  --- en = Boat Trader blip name
Config.PromptName = 'Auftragsbrett'
Config.CreateBountyTime = 10  -- Create New Bounty Every 60 Min
Config.MaxBountys = 20
Config.DistanceSpawnEnemys = 60  --- Enemys Spawn if you are 60 Meters Away or Closer

Config.BountyBoards = {
    {coords = vector3(-766.86, -1260.96, 43.56)},   --- Also the Location of Blip (Blackwater)  
    {coords = vector3(-272.43, 804.47, 119.34)},   --- Also the Location of Blip and Npc (Valentine) 
    {coords = vector3(1353.66, -1304.22, 76.86)},   --- Also the Location of Blip and Npc (Rhodes)
    {coords = vector3(1353.66, -1304.22, 76.86)},   --- Also the Location of Blip and Npc (SaintDenise)},
}

Config.Names = {  --- This will be the Target name in Bountyboard Name will pciked random out of this names list
    {name = 'Harry Dalton'},
    {name = 'John MacFeeny'},
    {name = 'Frank Walten'},
    {name = 'Jessy Jones'},
    {name = 'Frank Swain'},
    {name = 'Thomas Collin'},
    {name = 'Samuel Twight'},
    {name = 'Jackson Smith'},
    {name = 'Walter Oconner'},
    {name = 'Brain Grey'},
    {name = 'Harrison Tall'},
    {name = 'Saskia Tenner'},
    {name = 'Jessica Thomas'},
    {name = 'Clarissa White'},
    {name = 'Andy Right'},
    {name = 'Jack Powell'},
    {name = 'Adisson Newman'},
    {name = 'Hunter Black'},
    
}

-------------------------------- Reward System ----------------------------------
-- Easy
Config.MinEasyReward = 25
Config.MaxEasyReward = 50
-- Middle
Config.MinMiddleReward = 50
Config.MaxMiddleReward = 75
-- Hard
Config.MinHardReward = 75
Config.MaxHardReward = 100

------------------------------- Outlaw Model

Config.Model = 'CS_strawberryoutlaw_02'

---------------------------- Mission Settings

Config.EasyMissions = {
    { ---- Fort Wallace 1
    [1] = vector3(356.84, 1476.61, 179.78),   --- Every Number is 1 Enemy if you add more you need to Continue with [6] .. [7] ...
    [2] = vector3(365.62, 1477.32, 180.23),
    [3] = vector3(359.49, 1482.79, 180.01),
    [4] = vector3(349.97, 1481.97, 179.65),
    [5] = vector3(346.97, 1487.55, 179.6), 
    },
    { ---- Big Valley West Elizabeth
    [1] = vector3(-1571.82, -919.11, 84.43),
    [2] = vector3(-1571.14, -935.56, 84.15),
    [3] = vector3(-1582.69, -937.73, 83.83),
    [4] = vector3(-1593.46, -924.39, 84.52),
    [5] = vector3(-1585.89, -910.71, 84.39),
    },
    { ---- Burned City at River near Valentine
    [1] = vector3(-348.23, -138.2, 48.08),
    [2] = vector3(-360.49, -142.2, 47.58),
    [3] = vector3(-359.09, -127.43, 46.73),
    [4] = vector3(-360.12, -117.3, 47.56),
    [5] = vector3(-343.16, -125.53, 48.98),
    },
    { ---- Fort at Kamassa River
    [1] = vector3(2453.5, 280.63, 70.58),
    [2] = vector3(2449.16, 290.79, 70.32),
    [3] = vector3(2455.89, 294.35, 70.35),
    [4] = vector3(2461.6, 297.45, 70.37),
    [5] = vector3(2450.74, 301.39, 70.23),
    },
    { ---- Oh Creags Run
    [1] = vector3(1711.07, 1494.38, 146.35),
    [2] = vector3(1694.59, 1493.38, 145.56),
    [3] = vector3(1689.55, 1502.89, 146.0),
    [4] = vector3(1702.81, 1506.15, 147.17),
    [5] = vector3(1692.29, 1512.66, 146.79),
    },
    { ---- Ranookie Ridge
    [1] = vector3(2533.39, 794.97, 74.95),
    [2] = vector3(2543.59, 800.5, 76.36),
    [3] = vector3(2544.51, 811.66, 75.97),
    [4] = vector3(2550.99, 819.91, 75.61),
    [5] = vector3(2561.74, 813.96, 76.04),
    },
    { ---- Calliga Hall
    [1] = vector3(1841.03, -1241.41, 42.61),
    [2] = vector3(1833.35, -1231.74, 41.82),
    [3] = vector3(1819.7, -1240.36, 41.76),
    [4] = vector3(1822.38, -1252.68, 42.77),
    [5] = vector3(1839.51, -1250.09, 42.98),
    },
    { ---- Top of Little Creek River
    [1] = vector3(-2186.3, 683.08, 120.56),
    [2] = vector3(-2174.2, 691.0, 120.88),
    [3] = vector3(-2165.44, 700.6, 121.39),
    [4] = vector3(-2184.67, 706.4, 122.29),
    [5] = vector3(-2193.35, 701.67, 121.83),
    },
    { ---- Aurora Basin
    [1] = vector3(-2553.32, -1377.29, 150.06),
    [2] = vector3(-2564.24, -1370.49, 150.85),
    [3] = vector3(-2575.54, -1364.35, 150.82),
    [4] = vector3(-2580.32, -1370.3, 149.58),
    [5] = vector3(-2582.22, -1385.64, 149.24),
    },
    { ---- Mcfarleens Ranch
    [1] = vector3(-2378.32, -2392.69, 61.52),
    [2] = vector3(-2390.93, -2383.92, 61.15),
    [3] = vector3(-2403.87, -2385.93, 61.47),
    [4] = vector3(-2387.31, -2380.23, 61.2),
    [5] = vector3(-2383.61, -2370.98, 61.86),
    },
}

Config.MiddleMissions = {
    { ---- Fort Wallace 
    [1] = vector3(356.84, 1476.61, 179.78),
    [2] = vector3(365.62, 1477.32, 180.23),
    [3] = vector3(359.49, 1482.79, 180.01),
    [4] = vector3(349.97, 1481.97, 179.65),
    [5] = vector3(346.97, 1487.55, 179.6),
    [6] = vector3(356.04, 1486.82, 179.83),
    [7] = vector3(361.47, 1489.32, 180.58),
    },
    { ---- Big Valley West Elizabeth
    [1] = vector3(-1571.82, -919.11, 84.43),
    [2] = vector3(-1571.14, -935.56, 84.15),
    [3] = vector3(-1582.69, -937.73, 83.83),
    [4] = vector3(-1593.46, -924.39, 84.52),
    [5] = vector3(-1585.89, -910.71, 84.39),
    [6] = vector3(-1577.61, -902.2, 84.25),
    [7] = vector3(-1574.31, -912.29, 83.89),
    },
    { ---- Burned City at River near Valentine
    [1] = vector3(-348.23, -138.2, 48.08),
    [2] = vector3(-360.49, -142.2, 47.58),
    [3] = vector3(-359.09, -127.43, 46.73),
    [4] = vector3(-360.12, -117.3, 47.56),
    [5] = vector3(-343.16, -125.53, 48.98),
    [6] = vector3(-341.37, -137.51, 48.98),
    [7] = vector3(-352.35, -140.65, 47.81),
    },
    { ---- Fort at Kamassa River
    [1] = vector3(2453.5, 280.63, 70.58),
    [2] = vector3(2449.16, 290.79, 70.32),
    [3] = vector3(2455.89, 294.35, 70.35),
    [4] = vector3(2461.6, 297.45, 70.37),
    [5] = vector3(2450.74, 301.39, 70.23),
    [6] = vector3(2455.84, 295.25, 70.31),
    [7] = vector3(2453.74, 290.62, 70.4),
    },
    { ---- Oh Creags Run
    [1] = vector3(1711.07, 1494.38, 146.35),
    [2] = vector3(1694.59, 1493.38, 145.56),
    [3] = vector3(1689.55, 1502.89, 146.0),
    [4] = vector3(1702.81, 1506.15, 147.17),
    [5] = vector3(1692.29, 1512.66, 146.79),
    [6] = vector3(1699.9, 1519.17, 147.08),
    [7] = vector3(1710.68, 1512.56, 147.55),
    },
    { ---- Ranookie Ridge
    [1] = vector3(2533.39, 794.97, 74.95),
    [2] = vector3(2543.59, 800.5, 76.36),
    [3] = vector3(2544.51, 811.66, 75.97),
    [4] = vector3(2550.99, 819.91, 75.61),
    [5] = vector3(2561.74, 813.96, 76.04),
    [6] = vector3(2562.4, 788.02, 76.74),
    [7] = vector3(2548.78, 781.0, 75.52),
    },
    { ---- Calliga Hall
    [1] = vector3(1841.03, -1241.41, 42.61),
    [2] = vector3(1833.35, -1231.74, 41.82),
    [3] = vector3(1819.7, -1240.36, 41.76),
    [4] = vector3(1822.38, -1252.68, 42.77),
    [5] = vector3(1839.51, -1250.09, 42.98),
    [6] = vector3(1844.25, -1236.77, 42.59),
    [7] = vector3(1846.39, -1266.29, 43.29),
    },
    { ---- Top of Little Creek River
    [1] = vector3(-2186.3, 683.08, 120.56),
    [2] = vector3(-2174.2, 691.0, 120.88),
    [3] = vector3(-2165.44, 700.6, 121.39),
    [4] = vector3(-2184.67, 706.4, 122.29),
    [5] = vector3(-2193.35, 701.67, 121.83),
    [6] = vector3(-2199.03, 687.77, 121.2),
    [7] = vector3(-2203.22, 682.96, 120.89),
    },
    { ---- Aurora Basin
    [1] = vector3(-2553.32, -1377.29, 150.06),
    [2] = vector3(-2564.24, -1370.49, 150.85),
    [3] = vector3(-2575.54, -1364.35, 150.82),
    [4] = vector3(-2580.32, -1370.3, 149.58),
    [5] = vector3(-2582.22, -1385.64, 149.24),
    [6] = vector3(-2579.48, -1390.24, 146.07),
    [7] = vector3(-2577.01, -1400.92, 145.83),
    },
    { ---- Mcfarleens Ranch
    [1] = vector3(-2378.32, -2392.69, 61.52),
    [2] = vector3(-2390.93, -2383.92, 61.15),
    [3] = vector3(-2403.87, -2385.93, 61.47),
    [4] = vector3(-2387.31, -2380.23, 61.2),
    [5] = vector3(-2383.61, -2370.98, 61.86),
    [6] = vector3(-2379.05, -2362.02, 62.19),
    [7] = vector3(-2369.06, -2364.87, 62.18),
    },
}

Config.HardMissions = {
    { ---- Fort Wallace 
    [1] = vector3(356.84, 1476.61, 179.78),
    [2] = vector3(365.62, 1477.32, 180.23),
    [3] = vector3(359.49, 1482.79, 180.01),
    [4] = vector3(349.97, 1481.97, 179.65),
    [5] = vector3(346.97, 1487.55, 179.6),
    [6] = vector3(356.04, 1486.82, 179.83),
    [7] = vector3(361.47, 1489.32, 180.58),
    [8] = vector3(358.36, 1494.46, 180.23),
    [9] = vector3(350.5, 1496.71, 179.74),
    [10] = vector3(338.97, 1497.21, 181.17),
    },
    { ---- Big Valley West Elizabeth
    [1] = vector3(-1571.82, -919.11, 84.43),
    [2] = vector3(-1571.14, -935.56, 84.15),
    [3] = vector3(-1582.69, -937.73, 83.83),
    [4] = vector3(-1593.46, -924.39, 84.52),
    [5] = vector3(-1585.89, -910.71, 84.39),
    [6] = vector3(-1577.61, -902.2, 84.25),
    [7] = vector3(-1574.31, -912.29, 83.89),
    [8] = vector3(-1568.22, -925.3, 84.76),
    [9] = vector3(-1576.01, -925.93, 84.58),
    [10] = vector3(-1582.7, -920.2, 83.88),
    },
    { ---- Burned City at River near Valentine
    [1] = vector3(-348.23, -138.2, 48.08),
    [2] = vector3(-360.49, -142.2, 47.58),
    [3] = vector3(-359.09, -127.43, 46.73),
    [4] = vector3(-360.12, -117.3, 47.56),
    [5] = vector3(-343.16, -125.53, 48.98),
    [6] = vector3(-341.37, -137.51, 48.98),
    [7] = vector3(-352.35, -140.65, 47.81),
    [8] = vector3(-373.95, -140.01, 47.7),
    [9] = vector3(-381.22, -140.22, 48.41),
    [10] = vector3(-372.66, -111.98, 46.17),
    },
    { ---- Fort at Kamassa River
    [1] = vector3(2453.5, 280.63, 70.58),
    [2] = vector3(2449.16, 290.79, 70.32),
    [3] = vector3(2455.89, 294.35, 70.35),
    [4] = vector3(2461.6, 297.45, 70.37),
    [5] = vector3(2450.74, 301.39, 70.23),
    [6] = vector3(2455.84, 295.25, 70.31),
    [7] = vector3(2453.74, 290.62, 70.4),
    [8] = vector3(2444.98, 291.48, 70.35),
    [9] = vector3(2446.81, 279.93, 70.56),
    [10] = vector3(2460.31, 280.56, 71.02),
    },
    { ---- Oh Creags Run
    [1] = vector3(1711.07, 1494.38, 146.35),
    [2] = vector3(1694.59, 1493.38, 145.56),
    [3] = vector3(1689.55, 1502.89, 146.0),
    [4] = vector3(1702.81, 1506.15, 147.17),
    [5] = vector3(1692.29, 1512.66, 146.79),
    [6] = vector3(1699.9, 1519.17, 147.08),
    [7] = vector3(1710.68, 1512.56, 147.55),
    [8] = vector3(1705.06, 1525.17, 147.23),
    [9] = vector3(1712.61, 1505.18, 147.5),
    [10] = vector3(1692.58, 1502.51, 146.55),
    },
    { ---- Ranookie Ridge
    [1] = vector3(2533.39, 794.97, 74.95),
    [2] = vector3(2543.59, 800.5, 76.36),
    [3] = vector3(2544.51, 811.66, 75.97),
    [4] = vector3(2550.99, 819.91, 75.61),
    [5] = vector3(2561.74, 813.96, 76.04),
    [6] = vector3(2562.4, 788.02, 76.74),
    [7] = vector3(2548.78, 781.0, 75.52),
    [8] = vector3(2546.18, 786.44, 75.55),
    [9] = vector3(2551.48, 792.02, 76.14),
    [10] = vector3(2550.7, 803.93, 76.27),
    },
    { ---- Calliga Hall
    [1] = vector3(1841.03, -1241.41, 42.61),
    [2] = vector3(1833.35, -1231.74, 41.82),
    [3] = vector3(1819.7, -1240.36, 41.76),
    [4] = vector3(1822.38, -1252.68, 42.77),
    [5] = vector3(1839.51, -1250.09, 42.98),
    [6] = vector3(1844.25, -1236.77, 42.59),
    [7] = vector3(1846.39, -1266.29, 43.29),
    [8] = vector3(1830.46, -1265.42, 43.46),
    [9] = vector3(1824.67, -1251.38, 42.67),
    [10] = vector3(1819.76, -1235.71, 41.96),
    },
    { ---- Top of Little Creek River
    [1] = vector3(-2186.3, 683.08, 120.56),
    [2] = vector3(-2174.2, 691.0, 120.88),
    [3] = vector3(-2165.44, 700.6, 121.39),
    [4] = vector3(-2184.67, 706.4, 122.29),
    [5] = vector3(-2193.35, 701.67, 121.83),
    [6] = vector3(-2199.03, 687.77, 121.2),
    [7] = vector3(-2203.22, 682.96, 120.89),
    [8] = vector3(-2203.77, 672.65, 120.0),
    [9] = vector3(-2215.26, 690.1, 121.4),
    [10] = vector3(-2215.32, 709.1, 122.2),
    },
    { ---- Aurora Basin
    [1] = vector3(-2553.32, -1377.29, 150.06),
    [2] = vector3(-2564.24, -1370.49, 150.85),
    [3] = vector3(-2575.54, -1364.35, 150.82),
    [4] = vector3(-2580.32, -1370.3, 149.58),
    [5] = vector3(-2582.22, -1385.64, 149.24),
    [6] = vector3(-2579.48, -1390.24, 146.07),
    [7] = vector3(-2577.01, -1400.92, 145.83),
    [8] = vector3(-2569.69, -1396.82, 145.42),
    [9] = vector3(-2567.14, -1389.68, 146.42),
    [10] = vector3(-2574.17, -1383.01, 149.25),
    },
    { ---- Mcfarleens Ranch
    [1] = vector3(-2378.32, -2392.69, 61.52),
    [2] = vector3(-2390.93, -2383.92, 61.15),
    [3] = vector3(-2403.87, -2385.93, 61.47),
    [4] = vector3(-2387.31, -2380.23, 61.2),
    [5] = vector3(-2383.61, -2370.98, 61.86),
    [6] = vector3(-2379.05, -2362.02, 62.19),
    [7] = vector3(-2369.06, -2364.87, 62.18),
    [8] = vector3(-2358.14, -2371.04, 62.2),
    [9] = vector3(-2356.0, -2380.21, 62.17),
    [10] = vector3(-2362.46, -2389.14, 62.19),
    },
}

-----------------------------------------------------------------------------------------------------
----------------------------------Tanslations--------------------------------------------------------
-----------------------------------------------------------------------------------------------------
--DE
Config.Kill = 'Töte: '
Config.LabelDiff = ' Schwierigkeit: '
Config.LabelReward = ' Belohnung: '
Config.LabelAbort = 'Auftrag Abbrechen'
Config.BoardHeader = 'Auftragsbrett'
Config.CloseBoard = 'Auftragsbrett Schließen'
Config.GetBountyList = 'Aufträge'
Config.NoBountys = 'Aktuell keine Aufträge komme Später wieder'
Config.BackBounty = 'Zurück'
Config.Easy = 'Einfach'
Config.Middle = 'Mittel'
Config.Hard = 'Schwer'
Config.AlreadyHasMission = 'Du hast Bereits ein Auftrag gestartet'
Config.MissionBlip = 'Missions Gebiet'
Config.MissionStartet = 'Mission Gestartet gehe zum Missions Gebiet'
Config.MissionFailed = 'Mission Fehlgeschlagen'
Config.MissionSuccess = 'Mission Erfolgreich Abgeschlossen'
Config.EnemyRemain = 'Verbleibende Gegner: '
Config.KiledEnemys = 'Gegner Getötet: '
Config.RewardGet = 'Deine Belohnung ist: '
Config.NoActiveBounty = 'Keine Mission zum Abbrechen'
Config.ActiveMissionAborted = 'Aktuelle Mission Abgebrochen'