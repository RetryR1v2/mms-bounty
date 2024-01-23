Config = {}

Config.BoardBlips = true
Config.BoardblipName = 'Auftragsbrett'  --- en = Boat Trader blip name
Config.PromptName = 'Auftragsbrett'
Config.CreateBountyTime = 10  -- Create New Bounty Every 60 Min
Config.MaxBountys = 20
Config.DistanceSpawnEnemys = 60  --- Enemys Spawn if you are 60 Meters Away or Closer

Config.Jobs= {
    {
        JobName = 'police',
    },
    {
        JobName = 'sheriff',
    },
    {
        JobName = 'marshall',
    },
}


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

Config.HeistMissionsActive = true
Config.LockpickItem = 'lockpick'
Config.HeistRewardMin = 75
Config.HeistRewardMax = 100
Config.CopModel = 'CS_VALSHERIFF'
Config.LuckyItemsActive = true

Config.LuckyItems = {
    {
        LuckyItem = 'diamond'
    },
    {
        LuckyItem = 'emerald'
    },
    {
        LuckyItem = 'goldring'
    },
}

Config.HeistMissions = {
    {
    Tresor = vector3(1287.43, -1314.5, 77.04), --- Bank Rhodes
    TresorHeading = 47.92,
    Cops = {
            [1] = vector3(1288.51, -1299.28, 77.04),   --- Every Number is 1 Enemy if you add more you need to Continue with [6] .. [7] ...
            [2] = vector3(1297.46, -1302.83, 77.04),
            [3] = vector3(1298.28, -1308.47, 76.58),
            [4] = vector3(1280.97, -1319.98, 76.79),
            [5] = vector3(1272.17, -1307.52, 76.31),
            [6] = vector3(1278.51, -1292.22, 76.2),
            [7] = vector3(1293.31, -1289.12, 76.27),
        }
    },
    {
        Tresor = vector3(2831.46, -1311.19, 46.76),  -- SaintDenise General Store
        TresorHeading = 134.31,
        Cops = {
            [1] = vector3(2840.36, -1317.86, 46.37),   --- Every Number is 1 Enemy if you add more you need to Continue with [6] .. [7] ...
            [2] = vector3(2848.98, -1297.99, 46.35),
            [3] = vector3(2835.49, -1285.94, 46.73),
            [4] = vector3(2818.26, -1286.68, 46.81),
            [5] = vector3(2787.8, -1328.13, 46.25),
            [6] = vector3(2799.38, -1350.14, 46.71),
            [7] = vector3(2827.45, -1362.81, 45.69),
        }
    },
    {
        Tresor = vector3(1004.85, -1769.28, 51.99),  -- Braithworth Mannor 
        TresorHeading = 0.58,
        Cops = {
            [1] = vector3(1006.43, -1758.26, 47.61),   --- Every Number is 1 Enemy if you add more you need to Continue with [6] .. [7] ...
            [2] = vector3(1024.88, -1751.56, 46.55),
            [3] = vector3(1045.28, -1776.02, 46.91),
            [4] = vector3(1032.48, -1804.76, 46.61),
            [5] = vector3(1010.62, -1812.11, 46.62),
            [6] = vector3(987.93, -1805.18, 46.11),
            [7] = vector3(973.76, -1777.19, 46.83),
        }
    },
    {
        Tresor = vector3(-878.3, -1326.91, 43.97),  -- Post Office Blackwater
        TresorHeading = 177.48,
        Cops = {
            [1] = vector3(-859.99, -1311.79, 43.05),   --- Every Number is 1 Enemy if you add more you need to Continue with [6] .. [7] ...
            [2] = vector3(-824.6, -1308.44, 43.58),
            [3] = vector3(-811.02, -1343.19, 43.67),
            [4] = vector3(-827.26, -1349.12, 43.62),
            [5] = vector3(-845.38, -1375.08, 43.42),
            [6] = vector3(-862.84, -1384.75, 43.57),
            [7] = vector3(-883.22, -1389.3, 44.23),
        }
    },
    {
        Tresor = vector3(-1795.34, -385.43, 160.33),  -- Strawberry General Store
        TresorHeading = 325.04,
        Cops = {
            [1] = vector3(-1820.23, -378.53, 161.71),   --- Every Number is 1 Enemy if you add more you need to Continue with [6] .. [7] ...
            [2] = vector3(-1811.33, -360.42, 162.1),
            [3] = vector3(-1771.7, -363.73, 160.19),
            [4] = vector3(-1771.55, -409.57, 155.18),
            [5] = vector3(-1795.27, -423.85, 156.1),
            [6] = vector3(-1781.08, -427.73, 155.0),
            [7] = vector3(-1767.03, -411.28, 155.01),
        }
    },
    {
        Tresor = vector3(2949.5, 1321.19, 44.82),  -- Annesburg Gun Store
        TresorHeading = 78.73,
        Cops = {
            [1] = vector3(2912.18, 1343.48, 48.12),   --- Every Number is 1 Enemy if you add more you need to Continue with [6] .. [7] ...
            [2] = vector3(2898.15, 1336.21, 50.22),
            [3] = vector3(2889.58, 1331.97, 54.49),
            [4] = vector3(2897.19, 1320.62, 48.08),
            [5] = vector3(2906.77, 1305.38, 45.3),
            [6] = vector3(2909.68, 1287.52, 44.27),
            [7] = vector3(2917.44, 1279.36, 44.47),
        }
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
Config.HeistBlip = 'Gebiet des Raubes'
Config.MissionStartet = 'Mission Gestartet gehe zum Missions Gebiet'
Config.MissionFailed = 'Mission Fehlgeschlagen'
Config.MissionSuccess = 'Mission Erfolgreich Abgeschlossen'
Config.EnemyRemain = 'Verbleibende Gegner: '
Config.KiledEnemys = 'Gegner Getötet: '
Config.RewardGet = 'Deine Belohnung ist: '
Config.NoActiveBounty = 'Keine Mission zum Abbrechen'
Config.ActiveMissionAborted = 'Aktuelle Mission Abgebrochen'
Config.StartHeist = 'Starte einen Raub'
Config.TresorPromptName = 'Tresor'
Config.PickThatTresor = 'Tresor Knacken'
Config.MissingLockpick = 'Du hast keinen Dietrich'
Config.LockpickingSuccess = 'Tresor erfolgreich Aufgebrochen Renn Weg oder Kämpfe'
Config.LockpickingFailed = 'Tresor Knacken Fehlgeschlagen Probiers nochmal'
Config.YouAreEscaped = 'Du bist Entkommen'
Config.HeistRewardGet = 'Raub Erfolgreich du Bekommst: '
Config.YouKilledAllCops = 'Du hast deine Verfolger getötet Hau ab!'
Config.YouDied = 'Du bist am Tatort Gestorben mal sehen wer dich zuerst Findet Sheriffs oder deine Freunde'
Config.NoActiveHeist = 'Kein Aktiven Raub'
Config.ActiveHeistAborted = 'Aktiven Raub Abgebrochen'
Config.LabelAbortHeist = 'Raub Abbrechen'
Config.AlreadyHeistActive = 'Du begehst bereits einen Raub'
Config.HeistStartetSuccessfully = 'Raub Gestartet schau auf der Karte wo du hin Musst!'
Config.HeistRewardGetItem = 'Du hast Glück in dem Tresor war Außerdem noch: '
Config.SheriffAddMission = 'Kopfgeld Aussetzen'
Config.Firstname = 'Vorname: '
Config.Lastname = 'Nachname: '
Config.Reason = 'Grund: '
Config.Reward = 'Belohnung: '
Config.AddBounty = 'Kopfgeld Aussetzen'
Config.SheriffBountySet = 'Kopfgeld Ausgesetzt'
Config.GetSheriffBountyList = 'Sheriff Aufträge'
Config.SheriffBountyDelete = 'Kopfgeld Löschen ?'
Config.SheriffBountyDeleteReally = 'Willst du das  Kopfgeld \n Wirklich Löschen ?'
Config.Yes = 'Ja'
Config.No = 'Nein'
Config.SheriffBountyDelted = 'Kopfgeld Gelöscht'