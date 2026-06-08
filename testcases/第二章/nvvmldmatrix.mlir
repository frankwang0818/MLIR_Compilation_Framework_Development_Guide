// RUN: mlir-translate -mlir-to-llvmir %s  -split-input-file --verify-diagnostics | FileCheck %s

// CHECK-LABEL: @ld_matrix
llvm.func @ld_matrix(%arg0: !llvm.ptr<i32, 3>) {
  // CHECK: call i32 @llvm.nvvm.ldmatrix.sync.aligned.m8n8.x1.b16.p3(ptr addrspace(3) %{{.*}})
  %l1 = nvvm.ldmatrix %arg0 {num = 1 : i32, layout = #nvvm.mma_layout<row>} : (!llvm.ptr<i32, 3>) -> i32
  llvm.return
}
