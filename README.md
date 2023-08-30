### MinOS is a minimalistic operating system, consisting of a bootloader, a kernel and basic hardware support.
#### Designed with the intent of improving my understanding on what manages the resources on a computer.
#### As I learn more, I will try to add updates to this repository.

#### This basic OS initially boots in 16 bit real mode, followed by entering 32 bit protected mode, before the bootloader hands over the control of the hardware to the kernel.

## Includes 
- Bootloader
- Kernel
- Driver to interact with hardware
- Global Descriptor Table
- Printing routines
 

## Tools used
- nasm for assembly language
- MinGW C compiler
- QEMU for emulation 
- CMake for build automation

## Setup
- Clone the repo
- Install the dependencies listed above
- Compile the boot and kernel code (Still to automate build using CMake)
- Enter qemu-system-x86_64 boot.bin to emulate the result on Qemu
- Bochs could be used as another option.
- Alternatively, you could boot it from a bootable hard drive, but it is not the most practical choice.
