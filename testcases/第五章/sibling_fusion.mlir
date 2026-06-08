func.func @sibling_fusion(%arg0: memref<10x10xf32>, %arg1: memref<10x10xf32>, 
 %arg2: memref<10x10xf32>, %arg3: memref<10x10xf32>,  
 %arg4: memref<10x10xf32>) { 
 affine.for %arg5 = 0 to 3 { 
 affine.for %arg6 = 0 to 3 { 
   %0 = affine.load %arg0[%arg5, %arg6] : memref<10x10xf32> 
   %1 = affine.load %arg1[%arg5, %arg6] : memref<10x10xf32> 
   %2 = arith.mulf %0, %1 : f32 
   affine.store %2, %arg3[%arg5, %arg6] : memref<10x10xf32> 
  } 
 } 
 affine.for %arg5 = 0 to 3 { 
  affine.for %arg6 = 0 to 3 { 
   %0 = affine.load %arg0[%arg5, %arg6] : memref<10x10xf32> 
   %1 = affine.load %arg2[%arg5, %arg6] : memref<10x10xf32> 
   %2 = arith.addf %0, %1 : f32 
   affine.store %2, %arg4[%arg5, %arg6] : memref<10x10xf32> 
  } 
 } 
 return 
}