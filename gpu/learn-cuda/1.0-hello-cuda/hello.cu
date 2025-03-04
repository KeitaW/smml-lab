#include <stdio.h>

__global__ void helloFromGPU() {
    printf("Hello from GPU thread %d!\n", threadIdx.x);
}

int main(int argc, char **argv) {
    printf("Hello, CUDA!\n");
    helloFromGPU<<<1, 10>>>();
    cudaDeviceReset(); // If you comment out this line, you will not see the line printed by the GPU
    // cudaDeviceSynchronize(); // If you use cudaDeviceSynchronize() instead of cudaDeviceReset(), you will see all the lines printed by the GPU appears at once
    return 0;
}