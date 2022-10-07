`timescale 1ns/1ns
module Shifter( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input Signal ;
output [31:0] dataOut ;

reg [31:0] temp ;
wire [31:0] w, x, y, z;

/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

		// 16 bit shift left
	
	    
		mux2to1  ins_400 (.in0(dataA[0]),.in1(1'b0),.sel(dataB[4]),.out(w[0]));
		mux2to1  ins_401 (.in0(dataA[1]),.in1(1'b0),.sel(dataB[4]),.out(w[1]));
		mux2to1  ins_402 (.in0(dataA[2]),.in1(1'b0),.sel(dataB[4]),.out(w[2]));
		mux2to1  ins_403 (.in0(dataA[3]),.in1(1'b0),.sel(dataB[4]),.out(w[3]));
		mux2to1  ins_404 (.in0(dataA[4]),.in1(1'b0),.sel(dataB[4]),.out(w[4]));
		mux2to1  ins_405 (.in0(dataA[5]),.in1(1'b0),.sel(dataB[4]),.out(w[5]));
		mux2to1  ins_406 (.in0(dataA[6]),.in1(1'b0),.sel(dataB[4]),.out(w[6]));
		mux2to1  ins_407 (.in0(dataA[7]),.in1(1'b0),.sel(dataB[4]),.out(w[7]));
		mux2to1  ins_408 (.in0(dataA[8]),.in1(1'b0),.sel(dataB[4]),.out(w[8]));
		mux2to1  ins_409 (.in0(dataA[9]),.in1(1'b0),.sel(dataB[4]),.out(w[9]));
		mux2to1  ins_410 (.in0(dataA[10]),.in1(1'b0),.sel(dataB[4]),.out(w[10]));
		mux2to1  ins_411 (.in0(dataA[11]),.in1(1'b0),.sel(dataB[4]),.out(w[11]));
		mux2to1  ins_412 (.in0(dataA[12]),.in1(1'b0),.sel(dataB[4]),.out(w[12]));
		mux2to1  ins_413 (.in0(dataA[13]),.in1(1'b0),.sel(dataB[4]),.out(w[13]));
		mux2to1  ins_414 (.in0(dataA[14]),.in1(1'b0),.sel(dataB[4]),.out(w[14]));
		mux2to1  ins_415 (.in0(dataA[15]),.in1(1'b0),.sel(dataB[4]),.out(w[15]));
		mux2to1  ins_416 (.in0(dataA[16]),.in1(dataA[0]),.sel(dataB[4]),.out(w[16]));
		mux2to1  ins_417 (.in0(dataA[17]),.in1(dataA[1]),.sel(dataB[4]),.out(w[17]));
		mux2to1  ins_418 (.in0(dataA[18]),.in1(dataA[2]),.sel(dataB[4]),.out(w[18]));
		mux2to1  ins_419 (.in0(dataA[19]),.in1(dataA[3]),.sel(dataB[4]),.out(w[19]));
		mux2to1  ins_420 (.in0(dataA[20]),.in1(dataA[4]),.sel(dataB[4]),.out(w[20]));
		mux2to1  ins_421 (.in0(dataA[21]),.in1(dataA[5]),.sel(dataB[4]),.out(w[21]));
		mux2to1  ins_422 (.in0(dataA[22]),.in1(dataA[6]),.sel(dataB[4]),.out(w[22]));
		mux2to1  ins_423 (.in0(dataA[23]),.in1(dataA[7]),.sel(dataB[4]),.out(w[23]));
		mux2to1  ins_424 (.in0(dataA[24]),.in1(dataA[8]),.sel(dataB[4]),.out(w[24]));
		mux2to1  ins_425 (.in0(dataA[25]),.in1(dataA[9]),.sel(dataB[4]),.out(w[25]));
		mux2to1  ins_426 (.in0(dataA[26]),.in1(dataA[10]),.sel(dataB[4]),.out(w[26]));
		mux2to1  ins_427 (.in0(dataA[27]),.in1(dataA[11]),.sel(dataB[4]),.out(w[27]));
		mux2to1  ins_428 (.in0(dataA[28]),.in1(dataA[12]),.sel(dataB[4]),.out(w[28]));
		mux2to1  ins_429 (.in0(dataA[29]),.in1(dataA[13]),.sel(dataB[4]),.out(w[29]));
		mux2to1  ins_430 (.in0(dataA[30]),.in1(dataA[14]),.sel(dataB[4]),.out(w[30]));
		mux2to1  ins_431 (.in0(dataA[31]),.in1(dataA[15]),.sel(dataB[4]),.out(w[31]));
		
		
		// 8 bit shift left
		mux2to1  ins_300 (.in0(w[0]),.in1(1'b0),.sel(dataB[3]),.out(x[0]));
		mux2to1  ins_301 (.in0(w[1]),.in1(1'b0),.sel(dataB[3]),.out(x[1]));
		mux2to1  ins_302 (.in0(w[2]),.in1(1'b0),.sel(dataB[3]),.out(x[2]));
		mux2to1  ins_303 (.in0(w[3]),.in1(1'b0),.sel(dataB[3]),.out(x[3]));
		mux2to1  ins_304 (.in0(w[4]),.in1(1'b0),.sel(dataB[3]),.out(x[4]));
		mux2to1  ins_305 (.in0(w[5]),.in1(1'b0),.sel(dataB[3]),.out(x[5]));
		mux2to1  ins_306 (.in0(w[6]),.in1(1'b0),.sel(dataB[3]),.out(x[6]));
		mux2to1  ins_307 (.in0(w[7]),.in1(1'b0),.sel(dataB[3]),.out(x[7]));
		mux2to1  ins_308 (.in0(w[8]),.in1(w[0]),.sel(dataB[3]),.out(x[8]));
		mux2to1  ins_309 (.in0(w[9]),.in1(w[1]),.sel(dataB[3]),.out(x[9]));
		mux2to1  ins_310 (.in0(w[10]),.in1(w[2]),.sel(dataB[3]),.out(x[10]));
		mux2to1  ins_311 (.in0(w[11]),.in1(w[3]),.sel(dataB[3]),.out(x[11]));
		mux2to1  ins_312 (.in0(w[12]),.in1(w[4]),.sel(dataB[3]),.out(x[12]));
		mux2to1  ins_313 (.in0(w[13]),.in1(w[5]),.sel(dataB[3]),.out(x[13]));
		mux2to1  ins_314 (.in0(w[14]),.in1(w[6]),.sel(dataB[3]),.out(x[14]));
		mux2to1  ins_315 (.in0(w[15]),.in1(w[7]),.sel(dataB[3]),.out(x[15]));
		mux2to1  ins_316 (.in0(w[16]),.in1(w[8]),.sel(dataB[3]),.out(x[16]));
		mux2to1  ins_317 (.in0(w[17]),.in1(w[9]),.sel(dataB[3]),.out(x[17]));
		mux2to1  ins_318 (.in0(w[18]),.in1(w[10]),.sel(dataB[3]),.out(x[18]));
		mux2to1  ins_319 (.in0(w[19]),.in1(w[11]),.sel(dataB[3]),.out(x[19]));
		mux2to1  ins_320 (.in0(w[20]),.in1(w[12]),.sel(dataB[3]),.out(x[20]));
		mux2to1  ins_321 (.in0(w[21]),.in1(w[13]),.sel(dataB[3]),.out(x[21]));
		mux2to1  ins_322 (.in0(w[22]),.in1(w[14]),.sel(dataB[3]),.out(x[22]));
		mux2to1  ins_323 (.in0(w[23]),.in1(w[15]),.sel(dataB[3]),.out(x[23]));
		mux2to1  ins_324 (.in0(w[24]),.in1(w[16]),.sel(dataB[3]),.out(x[24]));
		mux2to1  ins_325 (.in0(w[25]),.in1(w[17]),.sel(dataB[3]),.out(x[25]));
		mux2to1  ins_326 (.in0(w[26]),.in1(w[18]),.sel(dataB[3]),.out(x[26]));
		mux2to1  ins_327 (.in0(w[27]),.in1(w[19]),.sel(dataB[3]),.out(x[27]));
		mux2to1  ins_328 (.in0(w[28]),.in1(w[20]),.sel(dataB[3]),.out(x[28]));
		mux2to1  ins_329 (.in0(w[29]),.in1(w[21]),.sel(dataB[3]),.out(x[29]));
		mux2to1  ins_330 (.in0(w[30]),.in1(w[22]),.sel(dataB[3]),.out(x[30]));
		mux2to1  ins_331 (.in0(w[31]),.in1(w[23]),.sel(dataB[3]),.out(x[31]));
		
		
		// 4 bit shift left
		mux2to1  ins_200 (.in0(x[0]),.in1(1'b0),.sel(dataB[2]),.out(y[0]));
		mux2to1  ins_201 (.in0(x[1]),.in1(1'b0),.sel(dataB[2]),.out(y[1]));
		mux2to1  ins_202 (.in0(x[2]),.in1(1'b0),.sel(dataB[2]),.out(y[2]));
		mux2to1  ins_203 (.in0(x[3]),.in1(1'b0),.sel(dataB[2]),.out(y[3]));
		mux2to1  ins_204 (.in0(x[4]),.in1(x[0]),.sel(dataB[2]),.out(y[4]));
		mux2to1  ins_205 (.in0(x[5]),.in1(x[1]),.sel(dataB[2]),.out(y[5]));
		mux2to1  ins_206 (.in0(x[6]),.in1(x[2]),.sel(dataB[2]),.out(y[6]));
		mux2to1  ins_207 (.in0(x[7]),.in1(x[3]),.sel(dataB[2]),.out(y[7]));
		mux2to1  ins_208 (.in0(x[8]),.in1(x[4]),.sel(dataB[2]),.out(y[8]));
		mux2to1  ins_209 (.in0(x[9]),.in1(x[5]),.sel(dataB[2]),.out(y[9]));
		mux2to1  ins_210 (.in0(x[10]),.in1(x[6]),.sel(dataB[2]),.out(y[10]));
		mux2to1  ins_211 (.in0(x[11]),.in1(x[7]),.sel(dataB[2]),.out(y[11]));
		mux2to1  ins_212 (.in0(x[12]),.in1(x[8]),.sel(dataB[2]),.out(y[12]));
		mux2to1  ins_213 (.in0(x[13]),.in1(x[9]),.sel(dataB[2]),.out(y[13]));
		mux2to1  ins_214 (.in0(x[14]),.in1(x[10]),.sel(dataB[2]),.out(y[14]));
		mux2to1  ins_215 (.in0(x[15]),.in1(x[11]),.sel(dataB[2]),.out(y[15]));
		mux2to1  ins_216 (.in0(x[16]),.in1(x[12]),.sel(dataB[2]),.out(y[16]));
		mux2to1  ins_217 (.in0(x[17]),.in1(x[13]),.sel(dataB[2]),.out(y[17]));
		mux2to1  ins_218 (.in0(x[18]),.in1(x[14]),.sel(dataB[2]),.out(y[18]));
		mux2to1  ins_219 (.in0(x[19]),.in1(x[15]),.sel(dataB[2]),.out(y[19]));
		mux2to1  ins_220 (.in0(x[20]),.in1(x[16]),.sel(dataB[2]),.out(y[20]));
		mux2to1  ins_221 (.in0(x[21]),.in1(x[17]),.sel(dataB[2]),.out(y[21]));
		mux2to1  ins_222 (.in0(x[22]),.in1(x[18]),.sel(dataB[2]),.out(y[22]));
		mux2to1  ins_223 (.in0(x[23]),.in1(x[19]),.sel(dataB[2]),.out(y[23]));
		mux2to1  ins_224 (.in0(x[24]),.in1(x[20]),.sel(dataB[2]),.out(y[24]));
		mux2to1  ins_225 (.in0(x[25]),.in1(x[21]),.sel(dataB[2]),.out(y[25]));
		mux2to1  ins_226 (.in0(x[26]),.in1(x[22]),.sel(dataB[2]),.out(y[26]));
		mux2to1  ins_227 (.in0(x[27]),.in1(x[23]),.sel(dataB[2]),.out(y[27]));
		mux2to1  ins_228 (.in0(x[28]),.in1(x[24]),.sel(dataB[2]),.out(y[28]));
		mux2to1  ins_229 (.in0(x[29]),.in1(x[25]),.sel(dataB[2]),.out(y[29]));
		mux2to1  ins_230 (.in0(x[30]),.in1(x[26]),.sel(dataB[2]),.out(y[30]));
		mux2to1  ins_231 (.in0(x[31]),.in1(x[27]),.sel(dataB[2]),.out(y[31]));
		
		
		//2 bit shift left
		mux2to1  ins_100 (.in0(y[0]),.in1(1'b0),.sel(dataB[1]),.out(z[0]));
		mux2to1  ins_101 (.in0(y[1]),.in1(1'b0),.sel(dataB[1]),.out(z[1]));
		mux2to1  ins_102 (.in0(y[2]),.in1(y[0]),.sel(dataB[1]),.out(z[2]));
		mux2to1  ins_103 (.in0(y[3]),.in1(y[1]),.sel(dataB[1]),.out(z[3]));
		mux2to1  ins_104 (.in0(y[4]),.in1(y[2]),.sel(dataB[1]),.out(z[4]));
		mux2to1  ins_105 (.in0(y[5]),.in1(y[3]),.sel(dataB[1]),.out(z[5]));
		mux2to1  ins_106 (.in0(y[6]),.in1(y[4]),.sel(dataB[1]),.out(z[6]));
		mux2to1  ins_107 (.in0(y[7]),.in1(y[5]),.sel(dataB[1]),.out(z[7]));
		mux2to1  ins_108 (.in0(y[8]),.in1(y[6]),.sel(dataB[1]),.out(z[8]));
		mux2to1  ins_109 (.in0(y[9]),.in1(y[7]),.sel(dataB[1]),.out(z[9]));
		mux2to1  ins_110 (.in0(y[10]),.in1(y[8]),.sel(dataB[1]),.out(z[10]));
		mux2to1  ins_111 (.in0(y[11]),.in1(y[9]),.sel(dataB[1]),.out(z[11]));
		mux2to1  ins_112 (.in0(y[12]),.in1(y[10]),.sel(dataB[1]),.out(z[12]));
		mux2to1  ins_113 (.in0(y[13]),.in1(y[11]),.sel(dataB[1]),.out(z[13]));
		mux2to1  ins_114 (.in0(y[14]),.in1(y[12]),.sel(dataB[1]),.out(z[14]));
		mux2to1  ins_115 (.in0(y[15]),.in1(y[13]),.sel(dataB[1]),.out(z[15]));
		mux2to1  ins_116 (.in0(y[16]),.in1(y[14]),.sel(dataB[1]),.out(z[16]));
		mux2to1  ins_117 (.in0(y[17]),.in1(y[15]),.sel(dataB[1]),.out(z[17]));
		mux2to1  ins_118 (.in0(y[18]),.in1(y[16]),.sel(dataB[1]),.out(z[18]));
		mux2to1  ins_119 (.in0(y[19]),.in1(y[17]),.sel(dataB[1]),.out(z[19]));
		mux2to1  ins_120 (.in0(y[20]),.in1(y[18]),.sel(dataB[1]),.out(z[20]));
		mux2to1  ins_121 (.in0(y[21]),.in1(y[19]),.sel(dataB[1]),.out(z[21]));
		mux2to1  ins_122 (.in0(y[22]),.in1(y[20]),.sel(dataB[1]),.out(z[22]));
		mux2to1  ins_123 (.in0(y[23]),.in1(y[21]),.sel(dataB[1]),.out(z[23]));
		mux2to1  ins_124 (.in0(y[24]),.in1(y[22]),.sel(dataB[1]),.out(z[24]));
		mux2to1  ins_125 (.in0(y[25]),.in1(y[23]),.sel(dataB[1]),.out(z[25]));
		mux2to1  ins_126 (.in0(y[26]),.in1(y[24]),.sel(dataB[1]),.out(z[26]));
		mux2to1  ins_127 (.in0(y[27]),.in1(y[25]),.sel(dataB[1]),.out(z[27]));
		mux2to1  ins_128 (.in0(y[28]),.in1(y[26]),.sel(dataB[1]),.out(z[28]));
		mux2to1  ins_129 (.in0(y[29]),.in1(y[27]),.sel(dataB[1]),.out(z[29]));
		mux2to1  ins_130 (.in0(y[30]),.in1(y[28]),.sel(dataB[1]),.out(z[30]));
		mux2to1  ins_131 (.in0(y[31]),.in1(y[29]),.sel(dataB[1]),.out(z[31]));
		
		
		//1 bit shift left
		mux2to1  ins_000 (.in0(z[0]),.in1(1'b0),.sel(dataB[0]),.out(dataOut[0]));
		mux2to1  ins_001 (.in0(z[1]),.in1(z[0]),.sel(dataB[0]),.out(dataOut[1]));
		mux2to1  ins_002 (.in0(z[2]),.in1(z[1]),.sel(dataB[0]),.out(dataOut[2]));
		mux2to1  ins_003 (.in0(z[3]),.in1(z[2]),.sel(dataB[0]),.out(dataOut[3]));
		mux2to1  ins_004 (.in0(z[4]),.in1(z[3]),.sel(dataB[0]),.out(dataOut[4]));
		mux2to1  ins_005 (.in0(z[5]),.in1(z[4]),.sel(dataB[0]),.out(dataOut[5]));
		mux2to1  ins_006 (.in0(z[6]),.in1(z[5]),.sel(dataB[0]),.out(dataOut[6]));
		mux2to1  ins_007 (.in0(z[7]),.in1(z[6]),.sel(dataB[0]),.out(dataOut[7]));
		mux2to1  ins_008 (.in0(z[8]),.in1(z[7]),.sel(dataB[0]),.out(dataOut[8]));
		mux2to1  ins_009 (.in0(z[9]),.in1(z[8]),.sel(dataB[0]),.out(dataOut[9]));
		mux2to1  ins_010 (.in0(z[10]),.in1(z[9]),.sel(dataB[0]),.out(dataOut[10]));
		mux2to1  ins_011 (.in0(z[11]),.in1(z[10]),.sel(dataB[0]),.out(dataOut[11]));
		mux2to1  ins_012 (.in0(z[12]),.in1(z[11]),.sel(dataB[0]),.out(dataOut[12]));
		mux2to1  ins_013 (.in0(z[13]),.in1(z[12]),.sel(dataB[0]),.out(dataOut[13]));
		mux2to1  ins_014 (.in0(z[14]),.in1(z[13]),.sel(dataB[0]),.out(dataOut[14]));
		mux2to1  ins_015 (.in0(z[15]),.in1(z[14]),.sel(dataB[0]),.out(dataOut[15]));
		mux2to1  ins_016 (.in0(z[16]),.in1(z[15]),.sel(dataB[0]),.out(dataOut[16]));
		mux2to1  ins_017 (.in0(z[17]),.in1(z[16]),.sel(dataB[0]),.out(dataOut[17]));
		mux2to1  ins_018 (.in0(z[18]),.in1(z[17]),.sel(dataB[0]),.out(dataOut[18]));
		mux2to1  ins_019 (.in0(z[19]),.in1(z[18]),.sel(dataB[0]),.out(dataOut[19]));
		mux2to1  ins_020 (.in0(z[20]),.in1(z[19]),.sel(dataB[0]),.out(dataOut[20]));
		mux2to1  ins_021 (.in0(z[21]),.in1(z[20]),.sel(dataB[0]),.out(dataOut[21]));
		mux2to1  ins_022 (.in0(z[22]),.in1(z[21]),.sel(dataB[0]),.out(dataOut[22]));
		mux2to1  ins_023 (.in0(z[23]),.in1(z[22]),.sel(dataB[0]),.out(dataOut[23]));
		mux2to1  ins_024 (.in0(z[24]),.in1(z[23]),.sel(dataB[0]),.out(dataOut[24]));
		mux2to1  ins_025 (.in0(z[25]),.in1(z[24]),.sel(dataB[0]),.out(dataOut[25]));
		mux2to1  ins_026 (.in0(z[26]),.in1(z[25]),.sel(dataB[0]),.out(dataOut[26]));
		mux2to1  ins_027 (.in0(z[27]),.in1(z[26]),.sel(dataB[0]),.out(dataOut[27]));
		mux2to1  ins_028 (.in0(z[28]),.in1(z[27]),.sel(dataB[0]),.out(dataOut[28]));
		mux2to1  ins_029 (.in0(z[29]),.in1(z[28]),.sel(dataB[0]),.out(dataOut[29]));
		mux2to1  ins_030 (.in0(z[30]),.in1(z[29]),.sel(dataB[0]),.out(dataOut[30]));
		mux2to1  ins_031 (.in0(z[31]),.in1(z[30]),.sel(dataB[0]),.out(dataOut[31]));

/*
=====================================================8
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
endmodule