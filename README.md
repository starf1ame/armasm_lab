## Matrix Multiplication: Lab to Learn Armasm

It's a simple lab to learn to write Armasm. It's designed for an undergraduate course when I was a teaching assistant.

### Task of Lab

Given `main.c`, implement `matrix_mul` function in `matrix.s` in ARM assembler (armasm), which has different syntax from GNU assembler (GAS).

In fact, the source code of `matrix_mul` function is very simple as follow:

```c
int matrix_mul(Matrix* dst, const Matrix* src1, const Matrix* src2){
	int i, j, k;
	int sum = 0;
	for (i = 0; i < src1->row; i++)
	{
		for (j = 0; j < src2->column; j++)
		{
			sum = 0;
			for (k = 0; k < src1->column; k++)
			{
				sum += *(src1->data + src1->column * i + k) * *(src2->data + src2->column * k + j);
			}
			*(dst->data + i * dst->column + j) = sum;
		}	
	}

	return 0;
}
```

But to write the armasm for this function with structure `Matrix` may bring some challenges.

To give an example, I just implement the `matrix.s` using the armasm compiled from source code, however, you'd better write it on hand.

### Setup and Usage

This repo provide a docker environment, which contains:
* `GCC-ARM` toolchain for cross-compilation of ARM program (i.e., `gcc-arm-linux-gnueabi`);
* `qemu-arm-static` which enable us to run ARM executables directly on linux.

To compile and test, just run following commands:
* Build the docker: `docker build -t ubuntu:arm`
* Run the docker: `docker run -it ubuntu:arm /bin/bash`
* Run `make` to compile and run `python3 grade.py` to test the result.


### Some Notes

[Keil MDK](https://www.keil.com/demo/eval/arm.htm) is a complete software development environment for Arm Cortex-M based microcontroller devices, which provide visual emulation and debug function.

However, when I try to build environment on Linux, I found the `armclang` of Keil is not available (I don't have the license). Therefore, I use the script from [arm2gas](https://github.com/yxnan/arm2gas) to transfer the armasm to gnu syntax and then use `GCC-ARM` toolchain to compile.

### Reference

* [ARM on QEMU for Debian Ubuntu](https://gist.github.com/luk6xff/9f8d2520530a823944355e59343eadc1)
* [arm2gas](https://github.com/yxnan/arm2gas)
* [INTRODUCTION TO ARM ASSEMBLY BASICS](https://azeria-labs.com/writing-arm-assembly-part-1/)
