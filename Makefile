BENCHMARKS=\
	aes/aes \
	bfs/bulk \
	bfs/queue \
	fft/strided \
	fft/transpose \
	gemm/ncubed \
	gemm/blocked \
#FIXME\
	backprop/backprop \
	kmp/kmp \
	md/knn \
	md/grid \
	nw/nw \
	sort/merge \
	sort/radix \
	spmv/crs \
	spmv/ellpack \
	stencil/stencil2d \
	stencil/stencil3d \
	viterbi/viterbi

CFLAGS=-O3 -Wall -Wno-unused-label

build:
	@( for b in $(BENCHMARKS); do $(MAKE) CFLAGS="$(CFLAGS)" -C $$b || exit ; done )

run:
	@( for b in $(BENCHMARKS); do $(MAKE) CFLAGS="$(CFLAGS)" -C $$b run || exit ; done )

generate:
	@( for b in $(BENCHMARKS); do $(MAKE) CFLAGS="$(CFLAGS)" -C $$b generate || exit ; done )

clean:
	@( for b in $(BENCHMARKS); do $(MAKE) -C $$b clean || exit ; done )
