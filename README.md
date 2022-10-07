# PipedLined-CPU

## 開發平台
Windows 10

## 開發環境
Code Block

Icarus Verilog 模擬器


## 題目說明
使用 Verilog HDL 與 Icarus Verilog 模擬器，以 Midterm Project 所設計之 ALU Design 為基礎，參考下方Pipelined Datapath，設計一個 Pipelined MIPS-Lite CPU。
![image](https://user-images.githubusercontent.com/95240041/194579822-aed074c9-553a-48de-9928-79054065ec91.png)

使用single_cycle_CPU將其用5個暫存器(分別是IF_ID、ID_EX、EX_MEM、MEM_WB)切成五份，其中:

第一階(IF)包括
PC、PCADD、PCMUX、JMUX、InstrMem

IF_ID暫存器存了clk, rst, en_reg, instruction, pc的值


第二階(ID)包括
hazardDection、STALLMUX、SignExt、JalMUX、JalWnMUX、RegFile 、CTL、BRADD、branchEqual、BR_AND

ID_EX暫存器存了
clk,rst,WB(from CTL),MEM(from CTL),EX(from CTL),RD1(from RegFile),RD2(from RegFile),immed(from SignExt),rt(from instruction), rd(from instruction), rs(from  instruction), Jal(from CTL)的值


第三階(EX)包括
ALU、branchEqual、BR_AND、ALU_CTL、multiplier、hilo、shifter、RESULTMUX、RFMUX、ALUMUX、ALUMUX1、ALUMUX2、Forwarding

EX_MEM暫存器存了
clk, rst,WB(from ID_EX), MEM(from ID_EX), ALU(from ALU), WN(from RFMUX), zero(from ALU), WD(from ID_EX), Jal(from ID_EX)的值


第四階(MEM)包括          DatMem

MEM_WB暫存器存了clk,rst,WB(from EX_MEM),RD(from DatMem), ADDRESS(from EX_MEM), WN(from EX_MEM), Jal(from EX_MEM)的值

第五階(WB)包括	    WRMUX

## 執行程式碼
iverilog -o mips.vvp *.v

vvp mips.vvp

gtkwave mips_single.vcd &



## Icarus Verilog 驗證結果與 Waveform 輸出圖形
Icarus Verilog 驗證結果：
![image](https://user-images.githubusercontent.com/95240041/194580650-007295d5-8b8f-49db-954b-5580e3c08544.png)
![image](https://user-images.githubusercontent.com/95240041/194580690-fafd8f99-cdbe-4b77-80c5-14690e9bcc48.png)
![image](https://user-images.githubusercontent.com/95240041/194580738-32e49ea7-dd7c-4395-95ec-3d2800791b9b.png)
![image](https://user-images.githubusercontent.com/95240041/194580795-3d75cf94-04f2-4a28-b93e-2cde23068674.png)

Waveform：
(a)ALU : (包括add, sub, and, or, sll, slt, addiu)
![image](https://user-images.githubusercontent.com/95240041/194580866-39a22565-06a3-4a0f-8139-b61d5435d91d.png)

(b)lw, sw :
![image](https://user-images.githubusercontent.com/95240041/194580942-ddbf6ecf-fea9-4861-ac01-91107c1d2ac4.png)

(c)beq, j, jal :
![image](https://user-images.githubusercontent.com/95240041/194581040-8b721da9-d64f-4fb1-8e27-a89b5ef4c536.png)
![image](https://user-images.githubusercontent.com/95240041/194581067-d1eeb6e1-6cd6-481a-bcfd-a0d2b98c571b.png)

(d)multu :
![image](https://user-images.githubusercontent.com/95240041/194581148-3b0794eb-9c6f-4954-aeb9-5c1b2ad5cf4b.png)

(e)mfhi, mflo, nop :
![image](https://user-images.githubusercontent.com/95240041/194581210-16d528e4-c6ee-4045-a561-cf0d4aa22a54.png)


## 流程圖

