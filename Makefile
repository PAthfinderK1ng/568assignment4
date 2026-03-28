
NVCC=nvcc
ARCH=sm_70  # Change to sm_80 for A100, sm_90 for H100

all: spmm_baseline spmm_opt

spmm_baseline: spmm_baseline.cu spmm_ref.cpp
	$(NVCC) -O3 -arch=$(ARCH) spmm_baseline.cu spmm_ref.cpp -o spmm_baseline

spmm_opt: spmm_opt.cu spmm_ref.cpp
	$(NVCC) -O3 -arch=$(ARCH) spmm_opt.cu spmm_ref.cpp -o spmm_opt

clean:
	rm -f spmm_baseline spmm_opt
