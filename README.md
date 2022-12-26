# What is it?

This project makes it easy to use libedgetpu and tensorflowlite using CMake. 
So for quick use, we use prebuilt tensorflow, edgetpu, and flatbuffers.
In particular, ARM64 (aarch64) has been documented separately for this purpose because of its weak support.

# Requirements

1. Ninja
2. CMake
3. gcc, g++
4. aarch64(ARM64) Board

# How to build?

1. lstpu (Displays a list of TPU equipment currently connected.)
```sh
$ git clone --recursive https://github.com/Piorosen/CMake-CoralTPU-Tutorial
$ cd CMake-CoralTPU-Tutorial
$ make lstpu
$ ./build/chacha
```

2. your software build
```sh
$ git clone --recursive https://github.com/Piorosen/CMake-CoralTPU-Tutorial
$ cd CMake-CoralTPU-Tutorial
$ make build # make
$ ./build/chacha
```
