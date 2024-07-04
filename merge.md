# merge hints

# mpfs
```
meld include/dt-bindings/ ../normal-riscv64/KERNEL/include/dt-bindings/
meld src/riscv/ ../normal-riscv64/KERNEL/arch/riscv/boot/dts/
```

# ti
```
meld include/dt-bindings/ ../normal-arm64/KERNEL/include/dt-bindings/
meld src/arm/ti/omap/ ../normal-arm64/KERNEL/arch/arm/boot/dts/ti/omap/
meld src/arm64/ti/ ../normal-arm64/KERNEL/arch/arm64/boot/dts/ti/
meld src/riscv/ ../normal-arm64/KERNEL/arch/riscv/boot/dts/
```

# linux
```
meld include/dt-bindings/ ~/linux-src/include/dt-bindings/
meld src/arm/ti/omap/ ~/linux-src/arch/arm/boot/dts/ti/omap/
meld src/arm64/ti/ ~/linux-src/arch/arm64/boot/dts/ti/
meld src/riscv/ ~/linux-src/arch/riscv/boot/dts/
```

# linux-next
```
meld include/dt-bindings/ ~/linux-next/include/dt-bindings/
meld src/arm/ti/omap/ ~/linux-next/arch/arm/boot/dts/ti/omap/
meld src/arm64/ti/ ~/linux-next/arch/arm64/boot/dts/ti/
meld src/riscv/ ~/linux-next/arch/riscv/boot/dts/
```
