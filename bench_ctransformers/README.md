# CTransformers

[![GitHub Repo](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/marella/ctransformers) &nbsp;

[CTransformers](https://github.com/marella/ctransformers) is a python binding for some popular transformer models implemented in C/C++ using the [GGML library](https://github.com/ggerganov/ggml). CTransformers provides support across CUDA, CPU and Metal. This library also provides very similar [huggingface-transformers](https://github.com/huggingface/transformers/) like interface, which makes it easier to use and integrate in various applications.


### 🚀 Running the ctransformers Benchmark.

You can run the ctransformers benchmark using the following command:

```bash
./bench_ctransformers/bench.sh \
  --prompt <value> \            # Enter a prompt string
  --max_tokens <value> \        # Maximum number of tokens to output
  --repetitions <value> \       # Number of repititions to be made for the prompt.
  --log_file <file_path> \      # A .log file underwhich we want to write the results.
  --device <cpu/cuda/metal> \   # The device in which we want to benchmark.
  --models_dir <path_to_models> # The directory in which model weights are present
```

To get started quickly you can simply run:

```bash
./bench_ctransformers/bench.sh -d cuda
```
This will take all the default values (see in the [bench.sh](/bench_ctransformers/bench.sh) file) and perform the benchmarks. You can find all the benchmarks results for ctransformers [here](/docs/llama2.md).


### 👀 Some points to note:

1. Since, ctransformers only supports quantized model. So it does not have benchmarking for float32/16.
2. You can not specify GPU device, rather you have to specify the number of [GPU Layers](https://github.com/marella/ctransformers?tab=readme-ov-file#gpu).
3. The device support for CTransformer is model specific. For example, Llama 2 supports CUDA/Metal/CPU, but models like Falcon or MPT only runs on CUDA. You can check out the model support [here](https://github.com/marella/ctransformers?tab=readme-ov-file#supported-models).
