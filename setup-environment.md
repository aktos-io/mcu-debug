# Description

Whether Windows, Linux or any other OS, you need the followings:

1. Debugger server:
  an application that will forward requests to/from STM32 and
  a local TCP port with GDB protocol

      eg. st-util, openocd

2. Debugger executable: specifically `arm-none-eabi-gdb`
3. Compiler: specifically `arm-none-eabi-gcc`
4. Your libraries, RTOS source code, etc (if any)
5. OPTIONAL: A GUI debugger (see [add-gui-debugger.md](./add-gui-debugger.md))

### Linux instructions:

1. Debugger server:

    download `st-util` and add the directory to the path:

        mkdir ~/bin
        cd ~/bin
        git clone https://github.com/texane/stlink
        cd stlink
        ./autogen.sh
        ./configure
        make
        sudo make install
        sudo cp *.rules /etc/udev/rules.d/
        # unplug STM32 usb cable
        # plug STM32 usb cable  

2. Debugger executable and the compiler:

  download and install `gdb-arm-none-eabi`. use one of the following:


  Either:

    sudo apt-get install gdb-arm-none-eabi

  or:

    download the tarball: https://launchpad.net/gcc-arm-embedded/+download
    unzip
    add this path to the `$PATH` variable in `~/.profile` file:

        PATH="$PATH:/path/to/arm-none-eabi-gdb"
        export PATH

    make sure your `.profile` file is sourced. For example, in Debian LXDE,
    we need to do the following:

        cd ~; ln -s .profile .xsessionrc


3. Download ChibiOS source code:

      download Chibios 3.x:

          cd ~
          git clone https://github.com/ChibiOS/ChibiOS

          # if you dowloaded ChibiOS anywhere else from "$HOME" dir,
          ln -s /path/to/Chibios-3.x ~/ChibiOS
