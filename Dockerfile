FROM ubuntu:14.04
RUN apt-get update -y
RUN apt-get install -y gcc g++ gcc-4.6 g++-4.6 make xutils bison flex doxygen python-pmw python-ply python-numpy libpng12-dev python-matplotlib doxygen graphviz git python-pmw python-ply python-numpy libpng12-dev libxi-dev libxmu-dev wget iproute2 expect xutils-dev libc-dev libgl1-mesa-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-all-dev mpich libcuda1-304 binutils-gold vim
RUN wget http://developer.download.nvidia.com/compute/cuda/4_2/rel/toolkit/cudatoolkit_4.2.9_linux_64_ubuntu11.04.run -P ~/.
RUN wget http://developer.download.nvidia.com/compute/cuda/4_2/rel/sdk/gpucomputingsdk_4.2.9_linux.run -P ~/.
RUN wget https://gist.githubusercontent.com/Kiran-r/a7ea775e5ddc0474754be3f234c6b5f1/raw/9e7fe954aaf90ce6d1c1f3c0343a226e7bd3c7a7/cuda.exp -P ~/.
RUN chmod 777 ~/gpucomputingsdk_4.2.9_linux.run ~/cudatoolkit_4.2.9_linux_64_ubuntu11.04.run
RUN echo "export CUDA_INSTALL_PATH=/usr/local/cuda" >> ~/.bashrc
RUN echo "export NVIDIA_COMPUTE_SDK_LOCATION=~/NVIDIA_GPU_Computing_SDK" >> ~/.bashrc
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 50
RUN git clone https://github.com/socal-ucr/gpgpu-sim_distribution ~/gpgpu-sim_distribution
RUN git clone https://github.com/socal-ucr/ispass2009-benchmarks ~/ispass2009-benchmarks
RUN expect ~/gpgpu-sim_distribution/cuda.exp
