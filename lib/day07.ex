defmodule Day07 do
  @moduledoc """
  --- Day 7: The Treachery of Whales ---
  A giant whale has decided your submarine is its next meal, and it's much faster than you are. There's nowhere to run!

  Suddenly, a swarm of crabs (each in its own tiny submarine - it's too deep for them otherwise) zooms in to rescue you! They seem to be preparing to blast a hole in the ocean floor; sensors indicate a massive underground cave system just beyond where they're aiming!

  The crab submarines all need to be aligned before they'll have enough power to blast a large enough hole for your submarine to get through. However, it doesn't look like they'll be aligned before the whale catches you! Maybe you can help?

  There's one major catch - crab submarines can only move horizontally.

  You quickly make a list of the horizontal position of each crab (your puzzle input). Crab submarines have limited fuel, so you need to find a way to make all of their horizontal positions match while requiring them to spend as little fuel as possible.

  For example, consider the following horizontal positions:

  16,1,2,0,4,2,7,1,2,14
  This means there's a crab with horizontal position 16, a crab with horizontal position 1, and so on.

  Each change of 1 step in horizontal position of a single crab costs 1 fuel. You could choose any horizontal position to align them all on, but the one that costs the least fuel is horizontal position 2:

  Move from 16 to 2: 14 fuel
  Move from 1 to 2: 1 fuel
  Move from 2 to 2: 0 fuel
  Move from 0 to 2: 2 fuel
  Move from 4 to 2: 2 fuel
  Move from 2 to 2: 0 fuel
  Move from 7 to 2: 5 fuel
  Move from 1 to 2: 1 fuel
  Move from 2 to 2: 0 fuel
  Move from 14 to 2: 12 fuel
  This costs a total of 37 fuel. This is the cheapest possible outcome; more expensive outcomes include aligning at position 1 (41 fuel), position 3 (39 fuel), or position 10 (71 fuel).

  Determine the horizontal position that the crabs can align to using the least fuel possible. How much fuel must they spend to align to that position?


  """

  @example_input "16,1,2,0,4,2,7,1,2,14"
  @input "1101,1,29,67,1102,0,1,65,1008,65,35,66,1005,66,28,1,67,65,20,4,0,1001,65,1,65,1106,0,8,99,35,67,101,99,105,32,110,39,101,115,116,32,112,97,115,32,117,110,101,32,105,110,116,99,111,100,101,32,112,114,111,103,114,97,109,10,88,86,21,110,697,179,570,202,519,715,1358,89,1133,31,22,244,1539,1133,675,944,427,811,129,35,19,862,680,142,148,672,925,73,549,229,1391,291,234,1422,70,1028,401,571,134,340,1164,19,61,940,498,395,136,1424,436,1001,579,382,775,688,7,771,263,1230,3,39,684,156,7,728,201,1228,1323,560,1697,65,62,424,753,527,98,61,396,566,236,330,1059,1038,362,363,709,95,70,5,211,374,76,1514,390,700,155,760,537,500,282,280,267,507,28,261,537,55,382,551,1011,1150,92,7,746,224,425,118,1621,1030,493,417,95,333,57,260,374,188,63,24,18,693,138,1136,62,6,358,242,999,75,1865,1467,463,100,1069,438,1215,244,245,485,90,317,793,66,709,104,78,354,529,422,318,742,908,1124,453,23,94,552,661,94,106,1200,227,653,19,1547,374,77,231,388,403,0,223,465,726,202,352,34,1059,524,531,163,1221,1215,967,192,64,1027,187,364,478,240,17,684,417,1037,1205,491,521,803,1811,363,261,511,50,613,836,3,815,302,137,17,1235,377,158,426,1208,1137,1276,728,27,133,263,116,109,163,1041,606,200,1939,272,240,806,469,923,1108,65,181,604,266,1527,323,410,15,238,539,40,515,93,296,204,1645,131,233,550,27,378,945,7,376,1621,219,692,1077,220,155,1321,269,396,127,291,206,387,1510,66,28,507,525,1331,235,471,643,1958,179,190,217,206,315,255,591,586,898,857,487,114,65,482,297,325,1234,495,175,712,1401,532,31,303,1543,820,850,1026,1364,434,1187,116,712,301,142,755,156,371,655,512,341,691,598,314,191,94,39,103,302,145,1297,236,947,288,6,107,325,505,334,1113,1430,837,289,552,140,585,68,242,953,561,1283,1148,783,11,33,126,361,700,1350,1101,87,286,19,859,376,5,349,95,1097,333,450,586,76,1088,35,674,575,372,173,360,349,230,1856,762,1263,57,894,314,45,147,372,581,739,26,346,421,821,785,720,33,367,39,198,1389,578,338,267,1397,737,2,465,22,362,223,276,571,406,1471,391,232,2,4,624,299,49,871,789,1143,33,656,49,34,467,301,737,42,398,1326,316,164,598,842,224,275,223,977,49,24,115,68,588,770,930,624,122,468,173,1308,1327,11,30,246,171,1774,18,361,1594,292,33,5,788,556,573,740,751,1282,4,1003,888,399,243,687,688,31,1136,474,6,138,640,174,1041,195,1148,564,471,1327,147,184,1226,466,419,446,59,67,457,1508,272,643,713,64,241,96,171,34,270,1274,1015,11,669,94,110,495,127,735,11,807,1238,257,286,529,302,554,375,366,4,105,318,781,280,39,315,499,27,254,349,324,90,161,632,413,192,242,1454,755,338,170,39,12,329,680,690,573,495,6,68,308,509,275,523,182,1443,340,289,1339,982,970,502,163,563,454,423,1513,633,835,1027,1017,1359,873,162,1334,710,412,319,35,190,24,155,189,633,422,109,1212,53,156,703,643,12,808,755,946,318,899,1672,191,85,149,33,650,1604,512,640,322,456,862,225,857,281,832,110,1399,1250,144,812,117,231,1433,647,293,845,501,516,1611,700,609,1649,1084,908,31,84,525,815,668,1331,19,830,733,276,545,1436,5,343,341,184,917,24,65,1604,0,21,54,302,732,34,5,1265,82,821,828,789,431,208,1024,810,1287,598,893,1858,410,385,71,186,553,480,87,160,185,88,19,231,452,351,22,37,993,608,54,276,594,885,128,218,123,350,214,216,939,74,892,129,965,492,111,391,236,153,389,1544,622,1229,751,1752,74,77,833,374,271,284,532,89,55,112,105,517,783,558,269,61,128,78,252,1208,982,1010,846,246,703,413,703,83,1128,499,501,1633,1088,506,281,106,186,62,860,855,1003,358,831,136,1239,426,327,341,1286,520,1281,27,1061,854,605,437,80,663,1229,803,49,363,1476,1299,60,97,681,421,1196,134,50,373,994,950,1115,335,13,330,105,188,873,500,1599,178,1392,1284,150,673,290,1064,545,272,650,561,602,31,305,1000,202,1306,990,701,949,289,190,145,110,143,906,778,392,609,697,533,390,162,715,425,1249,154,1260,3,801,205,1163,169,11,935,0,217,4,579,1,98,646,472,969,213,58,970,202,777,1177,648,801,31,51,91,192,396,783,65,371,51,520,144,633,136,10,681,126,49,50,438,501,814,80,19,665,104,258,421,274,588,73,433,79,797,608,307,841,595,1022,48,274,72,628,1119,195"

  def format_input(input) do
    input
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end

  def part01() do
    positions =
      @input
      |> format_input()
      |> Enum.sort()

    median_index =
      (length(positions) / 2)
      |> Float.ceil()
      |> trunc()

    median = Enum.at(positions, median_index - 1)

    Enum.reduce(positions, 0, fn position, acc ->
      acc + abs(position - median)
    end)
  end

  def part02() do
    positions =
      @input
      |> format_input()

    avg = Enum.sum(positions) / length(positions)

    # The answer will be in the mean
    floor(avg)..ceil(avg)
    |> Enum.map(fn i ->
      positions
      |> Enum.map(fn j ->
        avg = abs(j - i)
        avg * (avg + 1) / 2
      end)
      |> Enum.sum()
    end)
    |> Enum.min()
  end
end
