!/usr/bin/env sh
# This script converts the mnist data into lmdb/leveldb format,
# depending on the value assigned to $BACKEND.
set -e

EXAMPLE=examples/mnist
DATA=../../data/mnist
BUILD=../../data/mnist
#BUILD=./data/mnist
#DATA=./data/mnist

BACKEND="lmdb"

echo "Creating ${BACKEND}..."

rm -rf $EXAMPLE/mnist_train_${BACKEND}
rm -rf $EXAMPLE/mnist_test_${BACKEND}

#../../data/mnist/t10k-images-idx3-ubyte ../../data/mnist/t10k-labels-idx1-ubyte ./seramesmo.lmdb --backend="lmdb"
#$BUILD/convert_mnist_data.bin $DATA/train-images-idx3-ubyte --backend="lmdb"
#$BUILD/convert_mnist_data.bin $DATA/train-images-idx3-ubyte \
#  $DATA/train-labels-idx1-ubyte $EXAMPLE/mnist_train_${BACKEND} --backend=${BACKEND}
#$BUILD/convert_mnist_data.bin $DATA/t10k-images-idx3-ubyte \
#  $DATA/t10k-labels-idx1-ubyte $EXAMPLE/mnist_test_${BACKEND} --backend=${BACKEND}
sudo ../../data/mnist/convert_mnist_data.bin  ../../data/mnist/t10k-images-idx3-ubyte ../../data/mnist/t10k-labels-idx1-ubyte ./mnist_train_lmdb --backend="lmdb"
sudo ../../data/mnist/convert_mnist_data.bin  ../../data/mnist/t10k-images-idx3-ubyte ../../data/mnist/t10k-labels-idx1-ubyte ./mnist_test_lmdb --backend="lmdb"

echo "Done."
