# benchmarks
MLOps Engines, Frameworks, and Languages benchmarks over main stream AI Models.

## ML Engines: Feature Table

| Features                    | pytorch | burn | llama.cpp | candle | tinygrad | onnxruntime | CTranslate2 |
| --------------------------- | ------- | ---- | --------- | ------ | -------- | ----------- | ----------- |
| Inference support           | ✅      | ✅   | ✅        | ✅     | ✅       | ✅          | ✅          |
| 16-bit quantization support | ✅      | ✅   | ✅        | ✅     | ✅       | ✅          | ✅          |
| 8-bit quantization support  | ✅      | ❌   | ✅        | ✅     | ✅       | ✅          | ✅          |
| 4-bit quantization support  | ✅      | ❌   | ✅        | ✅     | ❌       | ❌          | ❌          |
| 2/3bit quantization support | ✅      | ❌   | ✅        | ✅     | ❌       | ❌          | ❌          |
| CUDA support                | ✅      | ✅   | ✅        | ✅     | ✅       | ✅          | ✅          |
| ROCM support                | ✅      | ✅   | ✅        | ✅     | ✅       | ❌          | ❌          |
| Intel OneAPI/SYCL support   | ✅**    | ✅   | ✅        | ✅     | ✅       | ❌          | ❌          |
| Mac M1/M2 support           | ✅      | ✅   | ✅        | ⭐     | ✅       | ✅          | ⭐          |
| BLAS support(CPU)           | ✅      | ✅   | ✅        | ✅     | ❌       | ✅          | ✅          |
| Model Parallel support      | ✅      | ❌   | ❌        | ✅     | ❌       | ❌          | ✅          |
| Tensor Parallel support     | ✅      | ❌   | ❌        | ✅     | ❌       | ❌          | ✅          |
| Onnx Format support         | ✅      | ✅   | ✅        | ✅     | ✅       | ✅          | ❌          |
| Training support            | ✅      | 🌟   | ❌        | 🌟     | ❌       | ❌          | ❌          |

⭐ = No Metal Support
🌟 = Partial Support for Training (Finetuning already works, but training from scratch may not work)

## Benchmarking ML Engines

### Consumer Hardware Inference:
#### M1 Pro Mac 16GB Variant
#### LLAMA2-7B
#### mean of runs: 24 (with outliers removed)

| engines     | (cpu) (16bit) tokens/sec | (cpu) (8bit) tokens/sec    | (cpu) (4bit) tokens/sec | (metal) (16bit) tokens/sec | (metal) (8bit) tokens/sec  | (metal/gpu) tokens/sec (4bit) | (metal/gpu) tokens/sec (2bit) |
| ----------- | ------------------------ | -------------------------- | ----------------------- | -------------------------- | -------------------------- | ----------------------------- | ----------------------------- |
| pytorch     |                          |                            |                         |                            |                            |                               |                               |
| burn(torch) |                          | quantization not-supported |                         |                            | quantization not-supported |                               |                               |
| llama.cpp   |                          | 13.2                       |                         |                            | 21.5                       |                               |                               |
| candle      |                          | 9.2                        |                         |                            | metal not supported yet!   |                               |                               |
| CTranslate2 |                          | 12.3                       |                         |                            | metal not supported yet!   |                               |                               |
| tinygrad    |                          | 0.75                       |                         |                            | 7.8                        |                               |                               |


*(data updated: 12th October 2023)

### A100 80GB Inference Bench:

Model: LLAMA-2-7B
CUDA Version: 11.7
Command: `./benchmark.sh --repetitions 10 --max_tokens 100 --device gpu --prompt 'Explain what is a transformer'`

| Engine      | float32      | float16      | int8         | int4         |
|-------------|--------------|--------------|--------------|--------------|
| burn        | 13.28 ± 0.79 |      -       |      -       |      -       |
| candle      |      -       | 26.30 ± 0.29 |      -       |      -       |
| llama.cpp   |      -       |      -       | 67.64 ± 22.57| 106.21 ± 2.21|
| ctranslate  |      -       | 58.54 ± 13.24| 34.22 ± 6.29 |      -       |
| tinygrad    |      -       | 20.13 ± 1.35 |      -       |      -       |

*(data updated: 13th November 2023)


### M2 MAX 32GB Inference Bench:

Model: LLAMA-2-7B
CUDA Version: NA
Command: `./benchmark.sh --repetitions 10 --max_tokens 100 --device gpu --prompt 'Explain what is a transformer'`

| Engine      | float32       | float16       | int8         | int4         |
|-------------|--------------|--------------|--------------|--------------|
| burn        | 0.30 ± 0.09  |      -       |      -       |      -       |
| candle      |      -       | 3.43 ± 0.02  |      -       |      -       |
| llama.cpp   |      -       |      -       | 15.29 ± 1.95 | 22.17 ± 2.25 |
| ctranslate  |      -       |      -       | 2.05 ± 0.56  |      -       |
| tinygrad    |      -       | 16.33 ± 1.38 |      -       |      -       |

*(data updated: 14th November 2023)