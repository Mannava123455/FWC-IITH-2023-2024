`timescale 1ns / 1ps
module polar_encoder (
  input wire [199:0] message,  // Input message
  output wire [1023:0] encoded   // Output encoded message
);
reg [9:0]Q[1023:0];
reg [1023:0]encoded_reg;
//integer K=200;
integer i;
//integer N=1024;  
always@(*)
begin
  // 0  1  2  4  8  16  3  5  9  6  17  10  18  12  20  24  7  11  19  13  14  21  26  25  22  28  15  23  27  29  30  31
  Q[0]=10'd0;
Q[1]=10'd1;
  Q[2]=10'd2;
  Q[3]=10'd4;
  Q[4]=10'd8;
  Q[5]=10'd16;
  Q[6]=10'd32;
  Q[7]=10'd3;
  Q[8]=10'd5;
  Q[9]=10'd64;
  Q[10]=10'd9;
  Q[11]=10'd6;
  Q[12]=10'd17;
  Q[13]=10'd10;
  Q[14]=10'd18;
  Q[15]=10'd128;
  Q[16]=10'd12;
  Q[17]=10'd33;
  Q[18]=10'd65;
  Q[19]=10'd20;
  Q[20]=10'd256;
  Q[21]=10'd34;
  Q[22]=10'd24;
  Q[23]=10'd36;
  Q[24]=10'd7;
  Q[25]=10'd129;
  Q[26]=10'd66;
  Q[27]=10'd512;
  Q[28]=10'd11;
  Q[29]=10'd40;
  Q[30]=10'd68;
  Q[31]=10'd130;
  Q[32]=10'd19;
  Q[33]=10'd13;
  Q[34]=10'd48;
  Q[35]=10'd14;
  Q[36]=10'd72;
  Q[37]=10'd257;
  Q[38]=10'd21;
  Q[39]=10'd132;
  Q[40]=10'd35;
  Q[41]=10'd258;
  Q[42]=10'd26;
  Q[43]=10'd513;
  Q[44]=10'd80;
  Q[45]=10'd37;
  Q[46]=10'd25;
  Q[47]=10'd22;
  Q[48]=10'd136;
  Q[49]=10'd260;
  Q[50]=10'd264;
  Q[51]=10'd38;
  Q[52]=10'd514;
  Q[53]=10'd96;
  Q[54]=10'd67;
  Q[55]=10'd41;
  Q[56]=10'd144;
  Q[57]=10'd28;
  Q[58]=10'd69;
  Q[59]=10'd42;
  Q[60]=10'd516;
  Q[61]=10'd49;
  Q[62]=10'd74;
  Q[63]=10'd272;
  Q[64]=10'd160;
  Q[65]=10'd520;
  Q[66]=10'd288;
  Q[67]=10'd528;
  Q[68]=10'd192;
  Q[69]=10'd544;
  Q[70]=10'd70;
  Q[71]=10'd44;
  Q[72]=10'd131;
  Q[73]=10'd81;
  Q[74]=10'd50;
  Q[75]=10'd73;
  Q[76]=10'd15;
  Q[77]=10'd320;
  Q[78]=10'd133;
  Q[79]=10'd52;
  Q[80]=10'd23;
  Q[81]=10'd134;
  Q[82]=10'd384;
  Q[83]=10'd76;
  Q[84]=10'd137;
  Q[85]=10'd82;
  Q[86]=10'd56;
  Q[87]=10'd27;
  Q[88]=10'd97;
  Q[89]=10'd39;
  Q[90]=10'd259;
  Q[91]=10'd84;
  Q[92]=10'd138;
  Q[93]=10'd145;
  Q[94]=10'd261;
  Q[95]=10'd29;
  Q[96]=10'd43;
  Q[97]=10'd98;
  Q[98]=10'd515;
  Q[99]=10'd88;
  Q[100]=10'd140;
  Q[101]=10'd30;
  Q[102]=10'd146;
  Q[103]=10'd71;
  Q[104]=10'd262;
  Q[105]=10'd265;
  Q[106]=10'd161;
  Q[107]=10'd576;
  Q[108]=10'd45;
  Q[109]=10'd100;
  Q[110]=10'd640;
  Q[111]=10'd51;
  Q[112]=10'd148;
  Q[113]=10'd46;
  Q[114]=10'd75;
  Q[115]=10'd266;
  Q[116]=10'd273;
  Q[117]=10'd517;
  Q[118]=10'd104;
  Q[119]=10'd162;
  Q[120]=10'd53;
  Q[121]=10'd193;
  Q[122]=10'd152;
  Q[123]=10'd77;
  Q[124]=10'd164;
  Q[125]=10'd768;
  Q[126]=10'd268;
  Q[127]=10'd274;
  Q[128]=10'd518;
  Q[129]=10'd54;
  Q[130]=10'd83;
  Q[131]=10'd57;
  Q[132]=10'd521;
  Q[133]=10'd112;
  Q[134]=10'd135;
  Q[135]=10'd78;
  Q[136]=10'd289;
  Q[137]=10'd194;
  Q[138]=10'd85;
  Q[139]=10'd276;
  Q[140]=10'd522;
  Q[141]=10'd58;
  Q[142]=10'd168;
  Q[143]=10'd139;
  Q[144]=10'd99;
  Q[145]=10'd86;
  Q[146]=10'd60;
  Q[147]=10'd280;
  Q[148]=10'd89;
  Q[149]=10'd290;
  Q[150]=10'd529;
  Q[151]=10'd524;
  Q[152]=10'd196;
  Q[153]=10'd141;
  Q[154]=10'd101;
  Q[155]=10'd147;
  Q[156]=10'd176;
  Q[157]=10'd142;
  Q[158]=10'd530;
  Q[159]=10'd321;
  Q[160]=10'd31;
  Q[161]=10'd200;
  Q[162]=10'd90;
  Q[163]=10'd545;
  Q[164]=10'd292;
  Q[165]=10'd322;
  Q[166]=10'd532;
  Q[167]=10'd263;
  Q[168]=10'd149;
  Q[169]=10'd102;
  Q[170]=10'd105;
  Q[171]=10'd304;
  Q[172]=10'd296;
  Q[173]=10'd163;
  Q[174]=10'd92;
  Q[175]=10'd47;
  Q[176]=10'd267;
  Q[177]=10'd385;
  Q[178]=10'd546;
  Q[179]=10'd324;
  Q[180]=10'd208;
  Q[181]=10'd386;
  Q[182]=10'd150;
  Q[183]=10'd153;
  Q[184]=10'd165;
  Q[185]=10'd106;
  Q[186]=10'd55;
  Q[187]=10'd328;
  Q[188]=10'd536;
  Q[189]=10'd577;
  Q[190]=10'd548;
  Q[191]=10'd113;
  Q[192]=10'd154;
  Q[193]=10'd79;
  Q[194]=10'd269;
  Q[195]=10'd108;
  Q[196]=10'd578;
  Q[197]=10'd224;
  Q[198]=10'd166;
  Q[199]=10'd519;
  Q[200]=10'd552;
  Q[201]=10'd195;
  Q[202]=10'd270;
  Q[203]=10'd641;
  Q[204]=10'd523;
  Q[205]=10'd275;
  Q[206]=10'd580;
  Q[207]=10'd291;
  Q[208]=10'd59;
  Q[209]=10'd169;
  Q[210]=10'd560;
  Q[211]=10'd114;
  Q[212]=10'd277;
  Q[213]=10'd156;
  Q[214]=10'd87;
  Q[215]=10'd197;
  Q[216]=10'd116;
  Q[217]=10'd170;
  Q[218]=10'd61;
  Q[219]=10'd531;
  Q[220]=10'd525;
  Q[221]=10'd642;
  Q[222]=10'd281;
  Q[223]=10'd278;
  Q[224]=10'd526;
  Q[225]=10'd177;
  Q[226]=10'd293;
  Q[227]=10'd388;
  Q[228]=10'd91;
  Q[229]=10'd584;
  Q[230]=10'd769;
  Q[231]=10'd198;
  Q[232]=10'd172;
  Q[233]=10'd120;
  Q[234]=10'd201;
  Q[235]=10'd336;
  Q[236]=10'd62;
  Q[237]=10'd282;
  Q[238]=10'd143;
  Q[239]=10'd103;
  Q[240]=10'd178;
  Q[241]=10'd294;
  Q[242]=10'd93;
  Q[243]=10'd644;
  Q[244]=10'd202;
  Q[245]=10'd592;
  Q[246]=10'd323;
  Q[247]=10'd392;
  Q[248]=10'd297;
  Q[249]=10'd770;
  Q[250]=10'd107;
  Q[251]=10'd180;
  Q[252]=10'd151;
  Q[253]=10'd209;
  Q[254]=10'd284;
  Q[255]=10'd648;
  Q[256]=10'd94;
  Q[257]=10'd204;
  Q[258]=10'd298;
  Q[259]=10'd400;
  Q[260]=10'd608;
  Q[261]=10'd352;
  Q[262]=10'd325;
  Q[263]=10'd533;
  Q[264]=10'd155;
  Q[265]=10'd210;
  Q[266]=10'd305;
  Q[267]=10'd547;
  Q[268]=10'd300;
  Q[269]=10'd109;
  Q[270]=10'd184;
  Q[271]=10'd534;
  Q[272]=10'd537;
  Q[273]=10'd115;
  Q[274]=10'd167;
  Q[275]=10'd225;
  Q[276]=10'd326;
  Q[277]=10'd306;
  Q[278]=10'd772;
  Q[279]=10'd157;
  Q[280]=10'd656;
  Q[281]=10'd329;
  Q[282]=10'd110;
  Q[283]=10'd117;
  Q[284]=10'd212;
  Q[285]=10'd171;
  Q[286]=10'd776;
  Q[287]=10'd330;
  Q[288]=10'd226;
  Q[289]=10'd549;
  Q[290]=10'd538;
  Q[291]=10'd387;
  Q[292]=10'd308;
  Q[293]=10'd216;
  Q[294]=10'd416;
  Q[295]=10'd271;
  Q[296]=10'd279;
  Q[297]=10'd158;
  Q[298]=10'd337;
  Q[299]=10'd550;
  Q[300]=10'd672;
  Q[301]=10'd118;
  Q[302]=10'd332;
  Q[303]=10'd579;
  Q[304]=10'd540;
  Q[305]=10'd389;
  Q[306]=10'd173;
  Q[307]=10'd121;
  Q[308]=10'd553;
  Q[309]=10'd199;
  Q[310]=10'd784;
  Q[311]=10'd179;
  Q[312]=10'd228;
  Q[313]=10'd338;
  Q[314]=10'd312;
  Q[315]=10'd704;
  Q[316]=10'd390;
  Q[317]=10'd174;
  Q[318]=10'd554;
  Q[319]=10'd581;
  Q[320]=10'd393;
  Q[321]=10'd283;
  Q[322]=10'd122;
  Q[323]=10'd448;
  Q[324]=10'd353;
  Q[325]=10'd561;
  Q[326]=10'd203;
  Q[327]=10'd63;
  Q[328]=10'd340;
  Q[329]=10'd394;
  Q[330]=10'd527;
  Q[331]=10'd582;
  Q[332]=10'd556;
  Q[333]=10'd181;
  Q[334]=10'd295;
  Q[335]=10'd285;
  Q[336]=10'd232;
  Q[337]=10'd124;
  Q[338]=10'd205;
  Q[339]=10'd182;
  Q[340]=10'd643;
  Q[341]=10'd562;
  Q[342]=10'd286;
  Q[343]=10'd585;
  Q[344]=10'd299;
  Q[345]=10'd354;
  Q[346]=10'd211;
  Q[347]=10'd401;
  Q[348]=10'd185;
  Q[349]=10'd396;
  Q[350]=10'd344;
  Q[351]=10'd586;
  Q[352]=10'd645;
  Q[353]=10'd593;
  Q[354]=10'd535;
  Q[355]=10'd240;
  Q[356]=10'd206;
  Q[357]=10'd95;
  Q[358]=10'd327;
  Q[359]=10'd564;
  Q[360]=10'd800;
  Q[361]=10'd402;
  Q[362]=10'd356;
  Q[363]=10'd307;
  Q[364]=10'd301;
  Q[365]=10'd417;
  Q[366]=10'd213;
  Q[367]=10'd568;
  Q[368]=10'd832;
  Q[369]=10'd588;
  Q[370]=10'd186;
  Q[371]=10'd646;
  Q[372]=10'd404;
  Q[373]=10'd227;
  Q[374]=10'd896;
  Q[375]=10'd594;
  Q[376]=10'd418;
  Q[377]=10'd302;
  Q[378]=10'd649;
  Q[379]=10'd771;
  Q[380]=10'd360;
  Q[381]=10'd539;
  Q[382]=10'd111;
  Q[383]=10'd331;
  Q[384]=10'd214;
  Q[385]=10'd309;
  Q[386]=10'd188;
  Q[387]=10'd449;
  Q[388]=10'd217;
  Q[389]=10'd408;
  Q[390]=10'd609;
  Q[391]=10'd596;
  Q[392]=10'd551;
  Q[393]=10'd650;
  Q[394]=10'd229;
  Q[395]=10'd159;
  Q[396]=10'd420;
  Q[397]=10'd310;
  Q[398]=10'd541;
  Q[399]=10'd773;
  Q[400]=10'd610;
  Q[401]=10'd657;
  Q[402]=10'd333;
  Q[403]=10'd119;
  Q[404]=10'd600;
  Q[405]=10'd339;
  Q[406]=10'd218;
  Q[407]=10'd368;
  Q[408]=10'd652;
  Q[409]=10'd230;
  Q[410]=10'd391;
  Q[411]=10'd313;
  Q[412]=10'd450;
  Q[413]=10'd542;
  Q[414]=10'd334;
  Q[415]=10'd233;
  Q[416]=10'd555;
  Q[417]=10'd774;
  Q[418]=10'd175;
  Q[419]=10'd123;
  Q[420]=10'd658;
  Q[421]=10'd612;
  Q[422]=10'd341;
  Q[423]=10'd777;
  Q[424]=10'd220;
  Q[425]=10'd314;
  Q[426]=10'd424;
  Q[427]=10'd395;
  Q[428]=10'd673;
  Q[429]=10'd583;
  Q[430]=10'd355;
  Q[431]=10'd287;
  Q[432]=10'd183;
  Q[433]=10'd234;
  Q[434]=10'd125;
  Q[435]=10'd557;
  Q[436]=10'd660;
  Q[437]=10'd616;
  Q[438]=10'd342;
  Q[439]=10'd316;
  Q[440]=10'd241;
  Q[441]=10'd778;
  Q[442]=10'd563;
  Q[443]=10'd345;
  Q[444]=10'd452;
  Q[445]=10'd397;
  Q[446]=10'd403;
  Q[447]=10'd207;
  Q[448]=10'd674;
  Q[449]=10'd558;
  Q[450]=10'd785;
  Q[451]=10'd432;
  Q[452]=10'd357;
  Q[453]=10'd187;
  Q[454]=10'd236;
  Q[455]=10'd664;
  Q[456]=10'd624;
  Q[457]=10'd587;
  Q[458]=10'd780;
  Q[459]=10'd705;
  Q[460]=10'd126;
  Q[461]=10'd242;
  Q[462]=10'd565;
  Q[463]=10'd398;
  Q[464]=10'd346;
  Q[465]=10'd456;
  Q[466]=10'd358;
  Q[467]=10'd405;
  Q[468]=10'd303;
  Q[469]=10'd569;
  Q[470]=10'd244;
  Q[471]=10'd595;
  Q[472]=10'd189;
  Q[473]=10'd566;
  Q[474]=10'd676;
  Q[475]=10'd361;
  Q[476]=10'd706;
  Q[477]=10'd589;
  Q[478]=10'd215;
  Q[479]=10'd786;
  Q[480]=10'd647;
  Q[481]=10'd348;
  Q[482]=10'd419;
  Q[483]=10'd406;
  Q[484]=10'd464;
  Q[485]=10'd680;
  Q[486]=10'd801;
  Q[487]=10'd362;
  Q[488]=10'd590;
  Q[489]=10'd409;
  Q[490]=10'd570;
  Q[491]=10'd788;
  Q[492]=10'd597;
  Q[493]=10'd572;
  Q[494]=10'd219;
  Q[495]=10'd311;
  Q[496]=10'd708;
  Q[497]=10'd598;
  Q[498]=10'd601;
  Q[499]=10'd651;
  Q[500]=10'd421;
  Q[501]=10'd792;
  Q[502]=10'd802;
  Q[503]=10'd611;
  Q[504]=10'd602;
  Q[505]=10'd410;
  Q[506]=10'd231;
  Q[507]=10'd688;
  Q[508]=10'd653;
  Q[509]=10'd248;
  Q[510]=10'd369;
  Q[511]=10'd190;
  Q[512]=10'd364;
  Q[513]=10'd654;
  Q[514]=10'd659;
  Q[515]=10'd335;
  Q[516]=10'd480;
  Q[517]=10'd315;
  Q[518]=10'd221;
  Q[519]=10'd370;
  Q[520]=10'd613;
  Q[521]=10'd422;
  Q[522]=10'd425;
  Q[523]=10'd451;
  Q[524]=10'd614;
  Q[525]=10'd543;
  Q[526]=10'd235;
  Q[527]=10'd412;
  Q[528]=10'd343;
  Q[529]=10'd372;
  Q[530]=10'd775;
  Q[531]=10'd317;
  Q[532]=10'd222;
  Q[533]=10'd426;
  Q[534]=10'd453;
  Q[535]=10'd237;
  Q[536]=10'd559;
  Q[537]=10'd833;
  Q[538]=10'd804;
  Q[539]=10'd712;
  Q[540]=10'd834;
  Q[541]=10'd661;
  Q[542]=10'd808;
  Q[543]=10'd779;
  Q[544]=10'd617;
  Q[545]=10'd604;
  Q[546]=10'd433;
  Q[547]=10'd720;
  Q[548]=10'd816;
  Q[549]=10'd836;
  Q[550]=10'd347;
  Q[551]=10'd897;
  Q[552]=10'd243;
  Q[553]=10'd662;
  Q[554]=10'd454;
  Q[555]=10'd318;
  Q[556]=10'd675;
  Q[557]=10'd618;
  Q[558]=10'd898;
  Q[559]=10'd781;
  Q[560]=10'd376;
  Q[561]=10'd428;
  Q[562]=10'd665;
  Q[563]=10'd736;
  Q[564]=10'd567;
  Q[565]=10'd840;
  Q[566]=10'd625;
  Q[567]=10'd238;
  Q[568]=10'd359;
  Q[569]=10'd457;
  Q[570]=10'd399;
  Q[571]=10'd787;
  Q[572]=10'd591;
  Q[573]=10'd678;
  Q[574]=10'd434;
  Q[575]=10'd677;
  Q[576]=10'd349;
  Q[577]=10'd245;
  Q[578]=10'd458;
  Q[579]=10'd666;
  Q[580]=10'd620;
  Q[581]=10'd363;
  Q[582]=10'd127;
  Q[583]=10'd191;
  Q[584]=10'd782;
  Q[585]=10'd407;
  Q[586]=10'd436;
  Q[587]=10'd626;
  Q[588]=10'd571;
  Q[589]=10'd465;
  Q[590]=10'd681;
  Q[591]=10'd246;
  Q[592]=10'd707;
  Q[593]=10'd350;
  Q[594]=10'd599;
  Q[595]=10'd668;
  Q[596]=10'd790;
  Q[597]=10'd460;
  Q[598]=10'd249;
  Q[599]=10'd682;
  Q[600]=10'd573;
  Q[601]=10'd411;
  Q[602]=10'd803;
  Q[603]=10'd789;
  Q[604]=10'd709;
  Q[605]=10'd365;
  Q[606]=10'd440;
  Q[607]=10'd628;
  Q[608]=10'd689;
  Q[609]=10'd374;
  Q[610]=10'd423;
  Q[611]=10'd466;
  Q[612]=10'd793;
  Q[613]=10'd250;
  Q[614]=10'd371;
  Q[615]=10'd481;
  Q[616]=10'd574;
  Q[617]=10'd413;
  Q[618]=10'd603;
  Q[619]=10'd366;
  Q[620]=10'd468;
  Q[621]=10'd655;
  Q[622]=10'd900;
  Q[623]=10'd805;
  Q[624]=10'd615;
  Q[625]=10'd684;
  Q[626]=10'd710;
  Q[627]=10'd429;
  Q[628]=10'd794;
  Q[629]=10'd252;
  Q[630]=10'd373;
  Q[631]=10'd605;
  Q[632]=10'd848;
  Q[633]=10'd690;
  Q[634]=10'd713;
  Q[635]=10'd632;
  Q[636]=10'd482;
  Q[637]=10'd806;
  Q[638]=10'd427;
  Q[639]=10'd904;
  Q[640]=10'd414;
  Q[641]=10'd223;
  Q[642]=10'd663;
  Q[643]=10'd692;
  Q[644]=10'd835;
  Q[645]=10'd619;
  Q[646]=10'd472;
  Q[647]=10'd455;
  Q[648]=10'd796;
  Q[649]=10'd809;
  Q[650]=10'd714;
  Q[651]=10'd721;
  Q[652]=10'd837;
  Q[653]=10'd716;
  Q[654]=10'd864;
  Q[655]=10'd810;
  Q[656]=10'd606;
  Q[657]=10'd912;
  Q[658]=10'd722;
  Q[659]=10'd696;
  Q[660]=10'd377;
  Q[661]=10'd435;
  Q[662]=10'd817;
  Q[663]=10'd319;
  Q[664]=10'd621;
  Q[665]=10'd812;
  Q[666]=10'd484;
  Q[667]=10'd430;
  Q[668]=10'd838;
  Q[669]=10'd667;
  Q[670]=10'd488;
  Q[671]=10'd239;
  Q[672]=10'd378;
  Q[673]=10'd459;
  Q[674]=10'd622;
  Q[675]=10'd627;
  Q[676]=10'd437;
  Q[677]=10'd380;
  Q[678]=10'd818;
  Q[679]=10'd461;
  Q[680]=10'd496;
  Q[681]=10'd669;
  Q[682]=10'd679;
  Q[683]=10'd724;
  Q[684]=10'd841;
  Q[685]=10'd629;
  Q[686]=10'd351;
  Q[687]=10'd467;
  Q[688]=10'd438;
  Q[689]=10'd737;
  Q[690]=10'd251;
  Q[691]=10'd462;
  Q[692]=10'd442;
  Q[693]=10'd441;
  Q[694]=10'd469;
  Q[695]=10'd247;
  Q[696]=10'd683;
  Q[697]=10'd842;
  Q[698]=10'd738;
  Q[699]=10'd899;
  Q[700]=10'd670;
  Q[701]=10'd783;
  Q[702]=10'd849;
  Q[703]=10'd820;
  Q[704]=10'd728;
  Q[705]=10'd928;
  Q[706]=10'd791;
  Q[707]=10'd367;
  Q[708]=10'd901;
  Q[709]=10'd630;
  Q[710]=10'd685;
  Q[711]=10'd844;
  Q[712]=10'd633;
  Q[713]=10'd711;
  Q[714]=10'd253;
  Q[715]=10'd691;
  Q[716]=10'd824;
  Q[717]=10'd902;
  Q[718]=10'd686;
  Q[719]=10'd740;
  Q[720]=10'd850;
  Q[721]=10'd375;
  Q[722]=10'd444;
  Q[723]=10'd470;
  Q[724]=10'd483;
  Q[725]=10'd415;
  Q[726]=10'd485;
  Q[727]=10'd905;
  Q[728]=10'd795;
  Q[729]=10'd473;
  Q[730]=10'd634;
  Q[731]=10'd744;
  Q[732]=10'd852;
  Q[733]=10'd960;
  Q[734]=10'd865;
  Q[735]=10'd693;
  Q[736]=10'd797;
  Q[737]=10'd906;
  Q[738]=10'd715;
  Q[739]=10'd807;
  Q[740]=10'd474;
  Q[741]=10'd636;
  Q[742]=10'd694;
  Q[743]=10'd254;
  Q[744]=10'd717;
  Q[745]=10'd575;
  Q[746]=10'd913;
  Q[747]=10'd798;
  Q[748]=10'd811;
  Q[749]=10'd379;
  Q[750]=10'd697;
  Q[751]=10'd431;
  Q[752]=10'd607;
  Q[753]=10'd489;
  Q[754]=10'd866;
  Q[755]=10'd723;
  Q[756]=10'd486;
  Q[757]=10'd908;
  Q[758]=10'd718;
  Q[759]=10'd813;
  Q[760]=10'd476;
  Q[761]=10'd856;
  Q[762]=10'd839;
  Q[763]=10'd725;
  Q[764]=10'd698;
  Q[765]=10'd914;
  Q[766]=10'd752;
  Q[767]=10'd868;
  Q[768]=10'd819;
  Q[769]=10'd814;
  Q[770]=10'd439;
  Q[771]=10'd929;
  Q[772]=10'd490;
  Q[773]=10'd623;
  Q[774]=10'd671;
  Q[775]=10'd739;
  Q[776]=10'd916;
  Q[777]=10'd463;
  Q[778]=10'd843;
  Q[779]=10'd381;
  Q[780]=10'd497;
  Q[781]=10'd930;
  Q[782]=10'd821;
  Q[783]=10'd726;
  Q[784]=10'd961;
  Q[785]=10'd872;
  Q[786]=10'd492;
  Q[787]=10'd631;
  Q[788]=10'd729;
  Q[789]=10'd700;
  Q[790]=10'd443;
  Q[791]=10'd741;
  Q[792]=10'd845;
  Q[793]=10'd920;
  Q[794]=10'd382;
  Q[795]=10'd822;
  Q[796]=10'd851;
  Q[797]=10'd730;
  Q[798]=10'd498;
  Q[799]=10'd880;
  Q[800]=10'd742;
  Q[801]=10'd445;
  Q[802]=10'd471;
  Q[803]=10'd635;
  Q[804]=10'd932;
  Q[805]=10'd687;
  Q[806]=10'd903;
  Q[807]=10'd825;
  Q[808]=10'd500;
  Q[809]=10'd846;
  Q[810]=10'd745;
  Q[811]=10'd826;
  Q[812]=10'd732;
  Q[813]=10'd446;
  Q[814]=10'd962;
  Q[815]=10'd936;
  Q[816]=10'd475;
  Q[817]=10'd853;
  Q[818]=10'd867;
  Q[819]=10'd637;
  Q[820]=10'd907;
  Q[821]=10'd487;
  Q[822]=10'd695;
  Q[823]=10'd746;
  Q[824]=10'd828;
  Q[825]=10'd753;
  Q[826]=10'd854;
  Q[827]=10'd857;
  Q[828]=10'd504;
  Q[829]=10'd799;
  Q[830]=10'd255;
  Q[831]=10'd964;
  Q[832]=10'd909;
  Q[833]=10'd719;
  Q[834]=10'd477;
  Q[835]=10'd915;
  Q[836]=10'd638;
  Q[837]=10'd748;
  Q[838]=10'd944;
  Q[839]=10'd869;
  Q[840]=10'd491;
  Q[841]=10'd699;
  Q[842]=10'd754;
  Q[843]=10'd858;
  Q[844]=10'd478;
  Q[845]=10'd968;
  Q[846]=10'd383;
  Q[847]=10'd910;
  Q[848]=10'd815;
  Q[849]=10'd976;
  Q[850]=10'd870;
  Q[851]=10'd917;
  Q[852]=10'd727;
  Q[853]=10'd493;
  Q[854]=10'd873;
  Q[855]=10'd701;
  Q[856]=10'd931;
  Q[857]=10'd756;
  Q[858]=10'd860;
  Q[859]=10'd499;
  Q[860]=10'd731;
  Q[861]=10'd823;
  Q[862]=10'd922;
  Q[863]=10'd874;
  Q[864]=10'd918;
  Q[865]=10'd502;
  Q[866]=10'd933;
  Q[867]=10'd743;
  Q[868]=10'd760;
  Q[869]=10'd881;
  Q[870]=10'd494;
  Q[871]=10'd702;
  Q[872]=10'd921;
  Q[873]=10'd501;
  Q[874]=10'd876;
  Q[875]=10'd847;
  Q[876]=10'd992;
  Q[877]=10'd447;
  Q[878]=10'd733;
  Q[879]=10'd827;
  Q[880]=10'd934;
  Q[881]=10'd882;
  Q[882]=10'd937;
  Q[883]=10'd963;
  Q[884]=10'd747;
  Q[885]=10'd505;
  Q[886]=10'd855;
  Q[887]=10'd924;
  Q[888]=10'd734;
  Q[889]=10'd829;
  Q[890]=10'd965;
  Q[891]=10'd938;
  Q[892]=10'd884;
  Q[893]=10'd506;
  Q[894]=10'd749;
  Q[895]=10'd945;
  Q[896]=10'd966;
  Q[897]=10'd755;
  Q[898]=10'd859;
  Q[899]=10'd940;
  Q[900]=10'd830;
  Q[901]=10'd911;
  Q[902]=10'd871;
  Q[903]=10'd639;
  Q[904]=10'd888;
  Q[905]=10'd479;
  Q[906]=10'd946;
  Q[907]=10'd750;
  Q[908]=10'd969;
  Q[909]=10'd508;
  Q[910]=10'd861;
  Q[911]=10'd757;
  Q[912]=10'd970;
  Q[913]=10'd919;
  Q[914]=10'd875;
  Q[915]=10'd862;
  Q[916]=10'd758;
  Q[917]=10'd948;
  Q[918]=10'd977;
  Q[919]=10'd923;
  Q[920]=10'd972;
  Q[921]=10'd761;
  Q[922]=10'd877;
  Q[923]=10'd952;
  Q[924]=10'd495;
  Q[925]=10'd703;
  Q[926]=10'd935;
  Q[927]=10'd978;
  Q[928]=10'd883;
  Q[929]=10'd762;
  Q[930]=10'd503;
  Q[931]=10'd925;
  Q[932]=10'd878;
  Q[933]=10'd735;
  Q[934]=10'd993;
  Q[935]=10'd885;
  Q[936]=10'd939;
  Q[937]=10'd994;
  Q[938]=10'd980;
  Q[939]=10'd926;
  Q[940]=10'd764;
  Q[941]=10'd941;
  Q[942]=10'd967;
  Q[943]=10'd886;
  Q[944]=10'd831;
  Q[945]=10'd947;
  Q[946]=10'd507;
  Q[947]=10'd889;
  Q[948]=10'd984;
  Q[949]=10'd751;
  Q[950]=10'd942;
  Q[951]=10'd996;
  Q[952]=10'd971;
  Q[953]=10'd890;
  Q[954]=10'd509;
  Q[955]=10'd949;
  Q[956]=10'd973;
  Q[957]=10'd1000;
  Q[958]=10'd892;
  Q[959]=10'd950;
  Q[960]=10'd863;
  Q[961]=10'd759;
  Q[962]=10'd1008;
  Q[963]=10'd510;
  Q[964]=10'd979;
  Q[965]=10'd953;
  Q[966]=10'd763;
  Q[967]=10'd974;
  Q[968]=10'd954;
  Q[969]=10'd879;
  Q[970]=10'd981;
  Q[971]=10'd982;
  Q[972]=10'd927;
  Q[973]=10'd995;
  Q[974]=10'd765;
  Q[975]=10'd956;
  Q[976]=10'd887;
  Q[977]=10'd985;
  Q[978]=10'd997;
  Q[979]=10'd986;
  Q[980]=10'd943;
  Q[981]=10'd891;
  Q[982]=10'd998;
  Q[983]=10'd766;
  Q[984]=10'd511;
  Q[985]=10'd988;
  Q[986]=10'd1001;
  Q[987]=10'd951;
  Q[988]=10'd1002;
  Q[989]=10'd893;
  Q[990]=10'd975;
  Q[991]=10'd894;
  Q[992]=10'd1009;
  Q[993]=10'd955;
  Q[994]=10'd1004;
  Q[995]=10'd1010;
  Q[996]=10'd957;
  Q[997]=10'd983;
  Q[998]=10'd958;
  Q[999]=10'd987;
  Q[1000]=10'd1012;
  Q[1001]=10'd999;
  Q[1002]=10'd1016;
  Q[1003]=10'd767;
  Q[1004]=10'd989;
  Q[1005]=10'd1003;
  Q[1006]=10'd990;
  Q[1007]=10'd1005;
  Q[1008]=10'd959;
  Q[1009]=10'd1011;
  Q[1010]=10'd1013;
  Q[1011]=10'd895;
  Q[1012]=10'd1006;
  Q[1013]=10'd1014;
  Q[1014]=10'd1017;
  Q[1015]=10'd1018;
  Q[1016]=10'd991;
  Q[1017]=10'd1020;
  Q[1018]=10'd1007;
  Q[1019]=10'd1015;
  Q[1020]=10'd1019;
  Q[1021]=10'd1021;
  Q[1022]=10'd1022;
  Q[1023]=10'd1023;


           

     for ( i = 0; i < 1024; i=i+1)
      begin
       encoded_reg[i] = 0;
     end
      for ( i = 0; i < 200; i=i+1)
          begin
           encoded_reg[Q[824+i]] = message[i];
         end
   
end
assign encoded = encoded_reg;
endmodule