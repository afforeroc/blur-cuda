cd cuda

# Compile cuda files
nvcc -I /usr/local/cuda/samples/common/inc device.cu -o device
nvcc -I /usr/local/cuda/samples/common/inc blur-cuda.cu -o blur-cuda

execute_blur_effect () {
kernel=3
while [ $kernel -le 15 ]
do
  ./blur-cuda images/720.bmp outputs/blur-cuda-720-$kernel.bmp $kernel $threads | tee -a logs/720.csv
  kernel=$(($kernel + 1))
done
}

# Procesing images
echo '╔═══════════════════════════════╗'
echo '║ Processing 720p image         ║'
echo '╚═══════════════════════════════╝'
echo "K s h"
echo '═════════════════════════════════'
echo "K s h" > logs/720.csv
threads=320; execute_blur_effect
threads=640; execute_blur_effect
threads=960; execute_blur_effect
threads=1280; execute_blur_effect
threads=1600; execute_blur_effect
threads=1920; execute_blur_effect
threads=2240; execute_blur_effect
threads=2560; execute_blur_effect
echo '' # Break line