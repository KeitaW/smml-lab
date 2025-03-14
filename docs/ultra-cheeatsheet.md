# The Ultra-Playbook Cheatsheet
This is just a copy of https://nanotron-ultrascale-playbook.static.hf.space/dist/assets/images/ultra-cheatsheet.svg for my reference.

## Step 1: Fit model into memory

### GPU rich case:

* __Small models (<10B)__: use a single parallelism technique, e.g. TP or ZeRO-3/DP with Full Recompute across 8 GPUs.
* __Large models (10B+)__: requires more than 8 GPUs, you have several options:
    * Combining Tensor Parallelism (TP=8) with Pipeline Parallelism
    * Combining Tensor Parallelism (TP=8) with Data Parallelism (ZeRO-3)
    * Using only ZeRO-3 (i.e. only pure Data Parallesim)
### GPU poor case:
* __Reduce memory__: use full activation checkpointing and/or gradient accumulation.


## Step 2: Satisfy target global batch size

Experiments tell us which batch size is ideal for training (4-40M tokens). So we either have to increase or decrease the batch size based on step 1  to meet it.
* __Increase Global Batch Size__: Scale up DP or CP or gradient accumulation steps
* __Dcrease Global Batch Size__: Reduce DP or CP in favor of other parallelism strategies

## Step 3: Optimizing Training Throughput

There is no general recipe for the best configuration so at this point we should experiment:

* __Scale up TP__ up to the node size to reduce other parallel strategies
* __Increase DP__ with ZeRO-3 while keeping target GBS
* __Use PP__ if communication becomes a bottleneck for DP
* Play with __micro batch size__ to balance max GBS, model size, compute/comms


## Parallelization Strategies

* __Data Parallelism__
    * Batch Size: gbs scales with DP
    * Memory Reduction: can reduce mbs by increasing dp -> reduce activations
    * Compute Reduction: can reduce mbs by increasing dp
    * Communication: bwd: allreduce grads_b16
    * Compute/Communication Overlap: __(DP-1) * num_params * peak_flops / (2 * peak_bw * num_tokens * DP)__
* __DP + ZeRO-1__
    * Batch Size: gbs scales with DP
    * Memory Reduction: moedl_fp32/dp, optimizers/dp
    * Compute Reduction: can reduce mbs by increasing dp
    * Communication: bwd: allreduce grads_b16, step_end: allgather model_fp32
    * Compute/Communication Overlap: __(DP-1) * num_params * peak_flops / (2 * peak_bw * num_tokens * DP)__
* __DP + ZeRO-2__
    * Batch Size: gbs scales with DP
    * Memory Reduction: moedl_fp32/dp, grads_fp32/dp, optimizers/dp
    * Compute Reduction: can reduce mbs by increasing dp
    * Communication: bwd: allreduce grads_b16, step_end: allgather model_fp32
    * Compute/Communication Overlap: overlapped with microbatch's backward: __(DP-1) * num_params * peak_flops / (4 * peak_bw * num_tokens * DP)__
