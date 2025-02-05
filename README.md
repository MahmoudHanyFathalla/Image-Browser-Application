# Image Browser Application

## Overview
This Qt/QML-based application provides a simple and efficient way to browse and manage images on your system. It features a modern UI built with Qt Quick and includes functionality for selecting individual images and browsing entire folders of images.

## Features
- Browse and select individual image files
- List all images in a selected folder
- Support for common image formats (PNG, JPG, BMP)
- High DPI scaling support
- Cross-platform compatibility

## Prerequisites
- Qt 5.x or Qt 6.x
- CMake 3.14 or higher
- C++17 compatible compiler

## Building the Project

### 1. Clone the Repository
```bash
git clone [repository-url]
cd [repository-name]
```

### 2. Generate Build Files
```bash
mkdir build
cd build
cmake ..
```

### 3. Build the Project
#### On Unix-like systems:
```bash
make
```

#### On Windows:
```bash
cmake --build .
```

## Project Structure
- `CMakeLists.txt` - CMake build configuration file
- `main.cpp` - Application entry point and QML engine setup
- `myhelper.h/cpp` - C++ helper class for file system operations
- `qml.qrc` - Resource file for QML assets
- QML files (main.qml and others) - UI implementation

## Technical Details

### Core Components

#### MyHelper Class
The `MyHelper` class provides the bridge between QML and the native file system:
- `browseImage()`: Opens a native file dialog for selecting image files
- `listImagesInFolder()`: Returns a list of all supported images in a directory

#### Build System
The project uses CMake with the following configurations:
- Automatic handling of Qt MOC, UIC, and RCC
- C++17 standard requirement
- Support for both Qt5 and Qt6
- Proper bundle configuration for macOS and iOS
- Windows executable configuration

### Supported Platforms
- Windows
- macOS
- Linux
- Android (requires additional configuration)
- iOS (requires additional configuration)

## Development Guidelines

### Adding New Features
1. C++ backend changes should be made in `myhelper.h/cpp`
2. UI changes should be implemented in QML files
3. Update `CMakeLists.txt` if adding new source files
4. Ensure cross-platform compatibility when making file system operations

### Best Practices
- Use Qt's cross-platform APIs instead of platform-specific code
- Follow Qt naming conventions for new classes and methods
- Implement proper error handling for file operations
- Use Qt's debug macros (qDebug, qWarning, etc.) for logging

## Troubleshooting

### Common Issues
1. **Build Failures**
   - Ensure Qt is properly installed and findable by CMake
   - Verify CMAKE_PREFIX_PATH includes Qt installation directory
   
2. **Runtime Issues**
   - Check file permissions for image access
   - Verify Qt plugins are properly deployed

### Debug Output
The application logs debug information about:
- Folder paths being accessed
- Image file discovery results
- File operation status
