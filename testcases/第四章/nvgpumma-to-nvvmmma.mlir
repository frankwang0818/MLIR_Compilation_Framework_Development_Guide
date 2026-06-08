func.func @m16n8k16_fp16(%arg0: vector<4x2xf16>, %arg1: vector<2x2xf16>, %arg2: vector<2x2xf16>) -> vector<2x2xf16> {
  // CHECK: llvm.extractvalue %{{.*}}[0] : !llvm.array<4 x vector<2xf16>>
  // CHECK: llvm.extractvalue %{{.*}}[1] : !llvm.array<4 x vector<2xf16>>
  // CHECK: llvm.extractvalue %{{.*}}[2] : !llvm.array<4 x vector<2xf16>>
  // CHECK: llvm.extractvalue %{{.*}}[3] : !llvm.array<4 x vector<2xf16>>
  // CHECK: llvm.extractvalue %{{.*}}[0] : !llvm.array<2 x vector<2xf16>>
  // CHECK: llvm.extractvalue %{{.*}}[1] : !llvm.array<2 x vector<2xf16>>
  // CHECK: llvm.extractvalue %{{.*}}[0] : !llvm.array<2 x vector<2xf16>>
  // CHECK: llvm.extractvalue %{{.*}}[1] : !llvm.array<2 x vector<2xf16>>
  // CHECK-NOT llvm.extractvalue
  // CHECK: [[d:%.+]] = nvvm.mma.sync
  // CHECK-SAME: shape = #nvvm.shape<m = 16, n = 8, k = 16>
  %d = nvgpu.mma.sync (%arg0, %arg1, %arg2) {mmaShape = [16, 8, 16]} : (vector<4x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
  // CHECK-DAG: llvm.extractvalue [[d]][0] : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  // CHECK-DAG: llvm.extractvalue [[d]][1] : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  // CHECK: llvm.mlir.undef : !llvm.array<2 x vector<2xf16>>
  // CHECK-DAG: llvm.insertvalue {{%.+}}, {{%.+}}[0] : !llvm.array<2 x vector<2xf16>>
  // CHECK-DAG: llvm.insertvalue {{%.+}}, {{%.+}}[1] : !llvm.array<2 x vector<2xf16>>
  return %d : vector<2x2xf16>
}

