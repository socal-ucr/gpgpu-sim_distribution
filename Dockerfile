FROM ubuntu:14.04
RUN apt-get update -y
RUN apt-get install -y gcc g++ gcc-4.6 g++-4.6 make xutils bison flex doxygen python-pmw python-ply python-numpy libpng12-dev python-matplotlib doxygen graphviz git python-pmw python-ply python-numpy libpng12-dev libxi-dev libxmu-dev wget iproute2 expect xutils-dev libc-dev libgl1-mesa-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-all-dev mpich libcuda1-304 binutils-gold vim
RUN chmod 777 ~/gpucomputingsdk_4.2.9_linux.run ~/cudatoolkit_4.2.9_linux_64_ubuntu11.04.run
RUN echo "export CUDA_INSTALL_PATH=/usr/local/cuda" >> ~/.bashrc
RUN echo "export NVIDIA_COMPUTE_SDK_LOCATION=~/NVIDIA_GPU_Computing_SDK" >> ~/.bashrc
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 50
RUN git clone https://github.com/socal-ucr/gpgpu-sim_distribution ~/gpgpu-sim_distribution
RUN git clone https://github.com/socal-ucr/ispass2009-benchmarks ~/ispass2009-benchmarks
RUN expect ~/gpgpu-sim_distribution/cuda.exp
