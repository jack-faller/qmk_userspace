(use-modules (gnu packages embedded)
             (gnu packages flashing-tools)
             (gnu packages firmware))
(packages->manifest (list (make-arm-none-eabi-nano-toolchain-6) dfu-util qmk))
