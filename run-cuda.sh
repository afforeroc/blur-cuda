cd cuda

# Compile cuda files
nvcc -I /usr/local/cuda/samples/common/inc device.cu -o device
nvcc -I /usr/local/cuda/samples/common/inc blur-cuda.cu -o blur-cuda

# Procesing images
echo '╔═══════════════════════════════╗'
echo '║ Processing 4k image           ║'
echo '╚═══════════════════════════════╝'
echo "K: Kernel, ms: Milisenconds"
echo "K\ts"
echo '═════════════════════════════════'

echo "K\ts" > logs/4k.csv

kernel=3
while [ $kernel -le 15 ]
do
  ./blur-cuda images/4k.bmp outputs/blur-cuda-4k-$kernel.bmp $kernel | tee -a logs/4k.csv
  kernel=$(($kernel + 1))
done

echo '╔═══════════════════════════════╗'
echo '║ Processing 1080p image        ║'
echo '╚═══════════════════════════════╝'
echo "K: Kernel, ms: Milisenconds"
echo "K\ts"
echo '═════════════════════════════════'

echo "K\ts" > logs/1080.csv

kernel=3
while [ $kernel -le 15 ]
do
  ./blur-cuda images/1080.bmp outputs/blur-cuda-1080-$kernel.bmp $kernel | tee -a logs/1080.csv
  kernel=$(($kernel + 1))
done

echo '╔═══════════════════════════════╗'
echo '║ Processing 720p image         ║'
echo '╚═══════════════════════════════╝'
echo "K: Kernel, ms: Milisenconds"
echo "K\ts"
echo '═════════════════════════════════'

echo "K\ts" > logs/720.csv

kernel=3
while [ $kernel -le 15 ]
do
  ./blur-cuda images/720.bmp outputs/blur-cuda-720-$kernel.bmp $kernel | tee -a logs/720.csv
  kernel=$(($kernel + 1))
done