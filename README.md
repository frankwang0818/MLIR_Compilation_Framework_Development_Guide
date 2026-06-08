# MLIR_Compilation_Framework_Development_Guide
<img width="346" height="972" alt="MLIR开发指南宣传封面" src="https://github.com/user-attachments/assets/c7663c2f-dfd1-446a-961a-c85ae91aee71" />


Video Link: https://www.youtube.com/@yanwang6750

前  言
第1章AI编译器的演进与变革	1
1.1　AI编译器的核心作用	2
1.2　AI编译器的发展与挑战	4
1.2.1　面向GPU编程的Python DSL	4
1.2.2　基于分块的编程模型	6
1.3　MLIR的优势与价值	11
第2章　MLIR基本概念与工具	15
2.1　MLIR的基本概念和特点	16
2.1.1　MLIR中的操作与方言	16
2.1.2　MLIR中的常用方言简介	17
2.1.3　MLIR的高层结构	18
2.2　MLIR中的pass及其管理机制	22
2.2.1　MLIR pass的分类	22
2.2.2　MLIR pass的管理机制	25
2.3　mlir-opt工作流程	27
2.3.1　mlir-opt的基本用法	28
2.3.2　mlir-opt的内部调用流程	29
2.3.3　mlir-opt主函数功能	40
2.4　mlir-translate工作流程	44
2.4.1　方言操作到LLVM IR的翻译过程	48
2.4.2　操作翻译接口及其执行流程	51
2.5　LLVM IR到硬件指令的序列化	54
2.5.1　序列化成员函数功能	55
2.5.2　指令序列化过程	56
第3章　MLIR中的重写模式与转换机制	59
3.1　MLIR中的重写模式与模式驱动	59
3.1.1　重写模式与模式重写器	60
3.1.2　方言转换驱动与贪婪模式重写驱动	66
3.2　MLIR中的类型转换	70
3.2.1　类型转换函数	72
3.2.2　类型转换过程	75
3.3　转换目标与转换方式	77
3.3.1　ConversionTarget的合法性动作接口	78
3.3.2　转换方式与合法性的关系	78
3.3.3　操作合法化过程	82
3.4　模式收益与成本模型	90
3.4.1　构建合法化图	91
3.4.2　模式集合排序	92
3.4.3　成本模型的实现	94
第4章　MLIR中的GPU代码生成	95
4.1　GPU相关方言递降过程概述	95
4.2　Vector方言和NVGPU方言的基本概念和特点	98
4.2.1　Vector方言简介	98
4.2.2　NVGPU方言及其转换和优化	99
4.3　Vector方言到NVGPU方言的转换	102
4.3.1　ConvertVectorToGPU pass的定义与实现	102
4.3.2　Vector操作到NVGPU操作的转换框架	106
4.3.3　vector.transfer_read操作的转换过程	110
4.3.4　vector.contract操作的转换过程	144
4.3.5　vector.transfer_write操作的转换过程	153
4.4　NVGPU方言到NVVM方言的转换	157
4.4.1　ConvertNVGPUToNVVM pass的定义与实现	157
4.4.2　nvgpu.ldmatrix操作的转换过程	159
4.4.3nvgpu.mma.sync操作的转换过程	170
第5章　MLIR中的多面体编译	180
5.1　多面体编译的基本概念	180
5.1.1　多面体模型基础	181
5.1.2　多面体编译影响因素	192
5.2　MLIR中的多面体编译技术	195
5.2.1　Affine方言介绍	195
5.2.2　MLIR中的多面体编译优化pass	197
5.3　多面体编译在MLIR中的应用实例	198
5.3.1　AffineLoopTiling pass工作流程	199
5.3.2　AffineLoopFusion pass工作流程	221
第6章　MLIR在IREE框架中的应用	256
6.1　IREE简介	256
6.1.1　IREE编译流程及组成模块	257
6.1.2　IREE中的CUDA目标后端	259
6.2　代码生成配置pass流水线工作流程	264
6.2.1　缩并计算配置函数功能分析	265
6.2.2　流水线配置函数分析	268
6.2.3　LLVMGPUMatmulTensorCoreMmaSync流水线的分级分块	271
6.3　TileAndDistributeToWorkgroups pass工作流程	273
6.3.1　设备级分块过程输入IR分析	273
6.3.2　设备级分块过程实现	274
6.4　LLVMGPUTileAndDistribute pass工作流程	300
6.4.1　Linalg方言的基本结构与变换机制	301
6.4.2　工作组级分块过程输入IR分析	305
6.4.3　LLVMGPUTileAndDistribute pass分块过程	306
6.5　MLIR代码生成pass在IREE中的应用	330
6.5.1　LLVMGPUTensorCoreVectorization pass工作流程	330
6.5.2　LLVMGPUVectorToGPU pass工作流程	340
参考文献	341

