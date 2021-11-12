# Tesseract vcpkg overlay

This repository contains Tesseract overlay ports and triplets for vcpkg. 

To build Tesseract using vcpkg, first [install vcpkg](https://github.com/microsoft/vcpkg#quick-start), then:

Clone the `tesseract_vcpkg` overlay repo in the vcpkg directory:

```
git clone git@github.com:tesseract-robotics/tesseract_vcpkg.git
```

and build the library:

```
vcpkg --overlay-ports=tesseract_vcpkg\ports install tesseract_common
```

To build x64, use:

```
vcpkg --overlay-ports=tesseract_vcpkg\ports install tesseract_common:x64-windows
```

