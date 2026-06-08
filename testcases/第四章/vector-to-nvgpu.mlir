#map0 = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>

func.func @m16n8k32_int8_row_row_row(%arg0: memref<128x128xi8, #gpu.address_space<workgroup>>, %arg1: memref<128x128xi8, #gpu.address_space<workgroup>>, %arg2: memref<128x128xi32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c17 = arith.constant 17 : index
  %c39 = arith.constant 39 : index
  %c40 = arith.constant 40 : index
  %c49 = arith.constant 49 : index
  %c50 = arith.constant 50 : index
  %cst = arith.constant 0 : i8
  %cst0 = arith.constant 0 : i32

  %A = vector.transfer_read %arg0[%c0, %c1], %cst {in_bounds = [true, true]} : memref<128x128xi8, #gpu.address_space<workgroup>>, vector<16x32xi8>
  %B = vector.transfer_read %arg1[%c39, %c40], %cst {in_bounds = [true, true], permutation_map = #map0} : memref<128x128xi8, #gpu.address_space<workgroup>>, vector<8x32xi8>
  %C = vector.transfer_read %arg2[%c49, %c40], %cst0 {in_bounds = [true, true]} : memref<128x128xi32>, vector<16x8xi32>
  %D = vector.contract {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %A, %B, %C : vector<16x32xi8>, vector<8x32xi8> into vector<16x8xi32>
  vector.transfer_write %D, %arg2[%c49, %c40] {in_bounds = [true, true]} : vector<16x8xi32>, memref<128x128xi32>
  return
}
  // Affine expr in strided and contiguous dimension encodes the coordinate mapping for the element a thread points to for warp-wide LdMatrixOp.

for (d0 0:16)
  for (d1 0:8)
    for (d2 0:32)
      C[d0, d1] += A[d0, d2] * B[d1, d2]
