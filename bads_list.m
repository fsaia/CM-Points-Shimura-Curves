// bads_list: list of pairs (D,N) for which X_0^D(N) is not found guaranteed to have a 
// sporadic CM point just based on the Frey-Faltings type check with the discriminant 
// of smallest absolute value satisfying the (D,N) Heeger hypothesis.

bads_list := [
    [ 6, 1 ],
    [ 10, 1 ],
    [ 14, 1 ],
    [ 15, 1 ],
    [ 21, 1 ],
    [ 22, 1 ],
    [ 26, 1 ],
    [ 33, 1 ],
    [ 34, 1 ],
    [ 35, 1 ],
    [ 38, 1 ],
    [ 39, 1 ],
    [ 46, 1 ],
    [ 51, 1 ],
    [ 55, 1 ],
    [ 57, 1 ],
    [ 58, 1 ],
    [ 62, 1 ],
    [ 65, 1 ],
    [ 69, 1 ],
    [ 74, 1 ],
    [ 77, 1 ],
    [ 82, 1 ],
    [ 85, 1 ],
    [ 86, 1 ],
    [ 87, 1 ],
    [ 91, 1 ],
    [ 93, 1 ],
    [ 94, 1 ],
    [ 95, 1 ],
    [ 106, 1 ],
    [ 111, 1 ],
    [ 115, 1 ],
    [ 118, 1 ],
    [ 119, 1 ],
    [ 122, 1 ],
    [ 123, 1 ],
    [ 129, 1 ],
    [ 133, 1 ],
    [ 134, 1 ],
    [ 141, 1 ],
    [ 142, 1 ],
    [ 143, 1 ],
    [ 145, 1 ],
    [ 146, 1 ],
    [ 155, 1 ],
    [ 158, 1 ],
    [ 159, 1 ],
    [ 161, 1 ],
    [ 166, 1 ],
    [ 177, 1 ],
    [ 178, 1 ],
    [ 183, 1 ],
    [ 185, 1 ],
    [ 187, 1 ],
    [ 194, 1 ],
    [ 201, 1 ],
    [ 202, 1 ],
    [ 203, 1 ],
    [ 205, 1 ],
    [ 206, 1 ],
    [ 209, 1 ],
    [ 210, 1 ],
    [ 213, 1 ],
    [ 214, 1 ],
    [ 215, 1 ],
    [ 217, 1 ],
    [ 218, 1 ],
    [ 219, 1 ],
    [ 221, 1 ],
    [ 226, 1 ],
    [ 235, 1 ],
    [ 237, 1 ],
    [ 247, 1 ],
    [ 249, 1 ],
    [ 253, 1 ],
    [ 254, 1 ],
    [ 259, 1 ],
    [ 262, 1 ],
    [ 265, 1 ],
    [ 267, 1 ],
    [ 274, 1 ],
    [ 278, 1 ],
    [ 287, 1 ],
    [ 291, 1 ],
    [ 295, 1 ],
    [ 298, 1 ],
    [ 299, 1 ],
    [ 301, 1 ],
    [ 302, 1 ],
    [ 303, 1 ],
    [ 305, 1 ],
    [ 309, 1 ],
    [ 314, 1 ],
    [ 319, 1 ],
    [ 321, 1 ],
    [ 323, 1 ],
    [ 326, 1 ],
    [ 327, 1 ],
    [ 329, 1 ],
    [ 330, 1 ],
    [ 334, 1 ],
    [ 335, 1 ],
    [ 339, 1 ],
    [ 341, 1 ],
    [ 346, 1 ],
    [ 355, 1 ],
    [ 358, 1 ],
    [ 362, 1 ],
    [ 365, 1 ],
    [ 371, 1 ],
    [ 377, 1 ],
    [ 381, 1 ],
    [ 382, 1 ],
    [ 386, 1 ],
    [ 390, 1 ],
    [ 391, 1 ],
    [ 393, 1 ],
    [ 394, 1 ],
    [ 395, 1 ],
    [ 398, 1 ],
    [ 403, 1 ],
    [ 407, 1 ],
    [ 411, 1 ],
    [ 413, 1 ],
    [ 415, 1 ],
    [ 417, 1 ],
    [ 422, 1 ],
    [ 427, 1 ],
    [ 437, 1 ],
    [ 445, 1 ],
    [ 446, 1 ],
    [ 447, 1 ],
    [ 451, 1 ],
    [ 453, 1 ],
    [ 454, 1 ],
    [ 458, 1 ],
    [ 462, 1 ],
    [ 466, 1 ],
    [ 469, 1 ],
    [ 471, 1 ],
    [ 473, 1 ],
    [ 478, 1 ],
    [ 481, 1 ],
    [ 482, 1 ],
    [ 485, 1 ],
    [ 489, 1 ],
    [ 493, 1 ],
    [ 497, 1 ],
    [ 501, 1 ],
    [ 502, 1 ],
    [ 505, 1 ],
    [ 510, 1 ],
    [ 511, 1 ],
    [ 514, 1 ],
    [ 515, 1 ],
    [ 517, 1 ],
    [ 519, 1 ],
    [ 526, 1 ],
    [ 535, 1 ],
    [ 537, 1 ],
    [ 538, 1 ],
    [ 542, 1 ],
    [ 543, 1 ],
    [ 545, 1 ],
    [ 546, 1 ],
    [ 554, 1 ],
    [ 562, 1 ],
    [ 565, 1 ],
    [ 566, 1 ],
    [ 570, 1 ],
    [ 573, 1 ],
    [ 579, 1 ],
    [ 586, 1 ],
    [ 591, 1 ],
    [ 597, 1 ],
    [ 614, 1 ],
    [ 622, 1 ],
    [ 626, 1 ],
    [ 633, 1 ],
    [ 634, 1 ],
    [ 662, 1 ],
    [ 669, 1 ],
    [ 674, 1 ],
    [ 681, 1 ],
    [ 687, 1 ],
    [ 690, 1 ],
    [ 694, 1 ],
    [ 698, 1 ],
    [ 706, 1 ],
    [ 714, 1 ],
    [ 718, 1 ],
    [ 734, 1 ],
    [ 746, 1 ],
    [ 758, 1 ],
    [ 766, 1 ],
    [ 770, 1 ],
    [ 778, 1 ],
    [ 781, 1 ],
    [ 794, 1 ],
    [ 798, 1 ],
    [ 802, 1 ],
    [ 818, 1 ],
    [ 838, 1 ],
    [ 842, 1 ],
    [ 858, 1 ],
    [ 862, 1 ],
    [ 866, 1 ],
    [ 870, 1 ],
    [ 878, 1 ],
    [ 886, 1 ],
    [ 898, 1 ],
    [ 901, 1 ],
    [ 910, 1 ],
    [ 913, 1 ],
    [ 914, 1 ],
    [ 930, 1 ],
    [ 943, 1 ],
    [ 966, 1 ],
    [ 1077, 1 ],
    [ 1110, 1 ],
    [ 1122, 1 ],
    [ 1190, 1 ],
    [ 1218, 1 ],
    [ 1230, 1 ],
    [ 1254, 1 ],
    [ 1290, 1 ],
    [ 1302, 1 ],
    [ 1326, 1 ],
    [ 1330, 1 ],
    [ 1410, 1 ],
    [ 1418, 1 ],
    [ 1482, 1 ],
    [ 1518, 1 ],
    [ 1554, 1 ],
    [ 1590, 1 ],
    [ 1974, 1 ],
    [ 2490, 1 ]
];