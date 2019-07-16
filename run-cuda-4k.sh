cd cuda

# Compile cuda files
nvcc -I /usr/local/cuda/samples/common/inc device.cu -o device
nvcc -I /usr/local/cuda/samples/common/inc blur-cuda.cu -o blur-cuda

execute_blur_effect () {
kernel=3
while [ $kernel -le 15 ]
do
  ./blur-cuda images/4k.bmp outputs/4k-$kernel-$threads.bmp $kernel $threads | tee -a logs/4k.csv
  kernel=$(($kernel + 1))
done
}

# Procesing images
echo '╔═══════════════════════════════╗'
echo '║ Processing 4k image           ║'
echo '╚═══════════════════════════════╝'
echo "K: Kernel, ms: Milisenconds"
echo "K\ts"
echo '═════════════════════════════════'
echo "K\ts" > logs/4k.csv
threads=1280; execute_blur_effect
threads=2560; execute_blur_effect
threads=3840; execute_blur_effect
threads=5120; execute_blur_effect
threads=6400; execute_blur_effect
threads=7680; execute_blur_effect
echo '' # Break line


