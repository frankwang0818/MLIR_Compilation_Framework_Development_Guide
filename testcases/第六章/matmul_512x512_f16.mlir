func.func @matmul(%lhs : tensor<512x512xf16>, %rhs : tensor<512x512xf16>) -> tensor<512x512xf16> {
  %c0 = arith.constant 0.0 : f16
  %empty = tensor.empty() : tensor<512x512xf16>
  %c = linalg.fill ins(%c0 : f16) outs(%empty: tensor<512x512xf16>) -> tensor<512x512xf16>
  %0 = linalg.matmul
         ins(%lhs, %rhs : tensor<512x512xf16>, tensor<512x512xf16>)
         outs(%c: tensor<512x512xf16>) -> tensor<512x512xf16>
  return %0 : tensor<512x512xf16>
}

