//===- ATenToStd.td ----------------------------------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifdef MLIR_ATEN_TO_STD_TD
#else
#define MLIR_ATEN_TO_STD_TD

#ifdef STANDARD_OPS
#else
include "mlir/Dialect/StandardOps/IR/Ops.td"
#endif // STANDARD_OPS

#ifdef ATEN_OPS
#else
include "ATen.td"
#endif

// The pytorch convolution operator has 9 arguments, but we only have a jit
// library that supports the first six at the moment.
def : Pat<(aten_ConvolutionOverrideableOp $a1, $a2, $a3, $a4, $a5, $a6,
													   $a7, $a8, $a9),
		 (aten_ConvolutionOp $a1, $a2, $a3, $a4, $a5, $a6)>;

def : Pat<(aten_ConvolutionBackwardOverrideableOp $a1, $a2, $a3, $a4, $a5, $a6,
													   $a7, $a8, $a9),
		 (aten_ConvolutionBackwardOp $a1, $a2, $a3, $a4, $a5, $a6)>;


#endif
