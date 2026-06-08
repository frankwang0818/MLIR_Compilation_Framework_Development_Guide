func.func @ldmatrix_x4(%arg0: memref<128x128xf16, 3>) ->  vector<4x2xf16> {
  %c0  = arith.constant 0 : index
  // CHECK: nvvm.ldmatrix {{%.+}} {layout = #nvvm.mma_layout<row>, num = 4 : i32} {{.*}} -> !llvm.struct<(i32, i32, i32, i32)
  %a = nvgpu.ldmatrix %arg0[%c0, %c0] {transpose = false, numTiles = 4 : i32} : memref<128x128xf16, 3> -> vector<4x2xf16>
  // CHECK: llvm.extractvalue
  // CHECK: llvm.bitcast
  // CHECK: llvm.insertvalue
  // CHECK: llvm.extractvalue
  // CHECK: llvm.bitcast
  // CHECK: llvm.insertvalue
  // CHECK: llvm.extractvalue
  // CHECK: llvm.bitcast
  // CHECK: llvm.insertvalue
  // CHECK: llvm.extractvalue
  // CHECK: llvm.bitcast
  // CHECK: llvm.insertvalue
  return %a : vector<4x2xf16>
}


func.func @ldmatrix_x4(%arg0: memref<128x128xi8, 3>) ->  vector<4x4xi8> {
  %c0  = arith.constant 0 : index
  %c1  = arith.constant 10 : index
  %a = nvgpu.ldmatrix %arg0[%c0, %c1] {transpose = false, numTiles = 4 : i32} : memref<128x128xi8, 3> -> vector<4x4xi8>
  return %a : vector<4x4xi8>
}


