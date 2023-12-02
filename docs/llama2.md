# ⚙️ Benchmarking ML Engines

## A100 80GB Inference Bench:

**Environment:**
- Model: LLAMA-2-7B
- CUDA Version: 11.7
- Command: `./benchmark.sh --repetitions 10 --max_tokens 100 --device cuda --prompt 'Explain what is a transformer'`

**Performance Metrics:**
| Engine               | float32      | float16       | int8          | int4          |
|----------------------|--------------|---------------|---------------|---------------|
| burn                 | 13.12 ± 0.85 |      -        |      -        |      -        |
| candle               |      -       | 36.78 ± 2.17  |      -        |      -        |
| llama.cpp            |      -       |      -        | 84.48 ± 3.76  | 106.76 ± 1.29 |
| ctranslate           |      -       | 51.38 ± 16.01 | 36.12 ± 11.93 |      -        |
| tinygrad             |      -       | 20.32 ± 0.06  |      -        |      -        |
| onnx                 |      -       | 54.16 ± 3.15  |      -        |      -        |
| ctransformers        |      -       |      -        | 81.61 ± 3.66  | 84.51 ± 7.93  |

*(Data updated: `02th December 2023`)


## M2 MAX 32GB Inference Bench:

### CPU

**Environment:**
- Model: LLAMA-2-7B
- CUDA Version: NA
- Command: `./benchmark.sh --repetitions 10 --max_tokens 100 --device cpu --prompt 'Explain what is a transformer'`

**Performance Metrics:**
| Engine               | float32      | float16      | int8         | int4         |
|----------------------|--------------|--------------|--------------|--------------|
| burn                 | 0.30 ± 0.09  |      -       |      -       |      -       |
| candle               |      -       | 3.43 ± 0.02  |      -       |      -       |
| llama.cpp            |      -       |      -       | 14.41 ± 1.59 | 20.96 ± 1.94 |
| ctranslate           |      -       |      -       | 2.11 ± 0.73  |      -       |
| tinygrad             |      -       | 4.21 ± 0.38  |      -       |      -       |
| onnx                 |      -       |      -       |      -       |      -       |
| ctransformers        |      -       |      -       | 13.79 ± 0.50 | 22.93 ± 0.86 |

### GPU (Metal)

**Command:** `./benchmark.sh --repetitions 10 --max_tokens 100 --device metal --prompt 'Explain what is a transformer'`

**Performance Metrics:**
| Engine               | float32      | float16       | int8         | int4         |
|----------------------|--------------|---------------|--------------|--------------|
| burn                 |      -       |      -        |      -       |      -       |
| candle               |      -       |      -        |      -       |      -       |
| llama.cpp            |      -       |      -        | 31.24 ± 7.82 | 46.75 ± 9.55 |
| ctranslate           |      -       |      -        |      -       |      -       |
| tinygrad             |      -       | 29.78 ± 1.18  |      -       |      -       |
| onnx                 |      -       |      -        |      -       |      -       |
| ctransformers        |      -       |      -        | 21.24 ± 0.81 | 34.08 ± 4.78 |

*(Data updated: `02th December 2023`)