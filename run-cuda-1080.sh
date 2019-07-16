cd cuda

# Compile cuda files
nvcc -I /usr/local/cuda/samples/common/inc device.cu -o device
nvcc -I /usr/local/cuda/samples/common/inc blur-cuda.cu -o blur-cuda

execute_blur_effect () {
kernel=3
while [ $kernel -le 15 ]
do
  ./blur-cuda images/1080.bmp outputs/blur-cuda-1080-$kernel.bmp $kernel $threads | tee -a logs/1080.csv
  kernel=$(($kernel + 1))
done
}

# Procesing images
echo '╔═══════════════════════════════╗'
echo '║ Processing 1080p image        ║'
echo '╚═══════════════════════════════╝'
echo "K s h"
echo '═════════════════════════════════'
echo "K s h" > logs/1080.csv
threads=640; execute_blur_effect
threads=1280; execute_blur_effect
threads=1920; execute_blur_effect
threads=2560; execute_blur_effect
threads=3200; execute_blur_effect
threads=3840; execute_blur_effect
echo '' # Break line