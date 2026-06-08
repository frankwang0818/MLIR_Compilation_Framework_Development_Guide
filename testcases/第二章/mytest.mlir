func.func @test_constant() -> i32 {
  %0 = arith.constant 42 : i32
  return %0 : i32
}
