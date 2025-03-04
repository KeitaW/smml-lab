# Compiler
NVCC = nvcc

# Target
TARGET = hello.out

# Source files
SRCS = hello.cu

# Architecture
ARCH = -arch=sm_90

# Build rule
$(TARGET): $(SRCS)
	$(NVCC) $(ARCH) $(SRCS) -o $(TARGET)

# Clean rule
clean:
	rm -f $(TARGET)