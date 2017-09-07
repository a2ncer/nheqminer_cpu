# Run instructions:

Example:

        docker run --rm --name miner a2ncer/nheqminer_cpu:latest -l eu1-zcash.flypool.org:3333 -u YOUR_ZCASH_WALLET.worker1

Parameters: 
	-h		Print this help and quit
	-l [location]	Stratum server:port
	-u [username]	Username (bitcoinaddress)
	-a [port]	Local API port (default: 0 = do not bind)
	-d [level]	Debug print level (0 = print all, 5 = fatal only, default: 2)
	-b [hashes]	Run in benchmark mode (default: 200 iterations)

CPU settings
	-t [num_thrds]	Number of CPU threads
	-e [ext]	Force CPU ext (0 = SSE2, 1 = AVX, 2 = AVX2)

NVIDIA CUDA settings
	-ci		CUDA info
	-cd [devices]	Enable CUDA mining on spec. devices
	-cb [blocks]	Number of blocks
	-ct [tpb]	Number of threads per block
Example: -cd 0 2 -cb 12 16 -ct 64 128

If run without parameters, miner will start mining with 75% of available logical CPU cores. Use parameter -h to learn about available parameters:

Example to run benchmark on your CPU:

        docker run --rm --name miner a2ncer/nheqminer_cpu:latest -b
        
Example to mine on your CPU with your own wallet address and worker1 on NiceHash USA server:

        docker run --rm --name miner a2ncer/nheqminer_cpu:latest -l equihash.usa.nicehash.com:3357 -u YOUR_WALLET_ADDRESS_HERE.worker1

Example to mine on your CPU with your own wallet address and worker1 on EU server, using 6 threads:

        docker run --rm --name miner a2ncer/nheqminer_cpu:latest -l equihash.eu.nicehash.com:3357 -u YOUR_WALLET_ADDRESS_HERE.worker1 -t 6

<i>Note: if you have a 4-core CPU with hyper threading enabled (total 8 threads) it is best to run with only 6 threads (experimental benchmarks shows that best results are achieved with 75% threads utilized)</i>

Example to mine on your CPU as well on your CUDA GPUs with your own wallet address and worker1 on EU server, using 6 CPU threads and 2 CUDA GPUs:

        docker run --rm --name miner a2ncer/nheqminer_cpu:latest -l equihash.eu.nicehash.com:3357 -u YOUR_WALLET_ADDRESS_HERE.worker1 -t 6 -cd 0 1

Ready docker image https://hub.docker.com/r/a2ncer/nheqminer_cpu/

Source of miner https://github.com/nicehash/nheqminer
