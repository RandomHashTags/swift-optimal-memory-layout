Sorts stored property declarations in the optimal layout so they don't waste memory.

<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-5.9+-F05138?style=&logo=swift" alt="Requires at least Swift 5.9"></a> <img src="https://img.shields.io/badge/Platforms-Any-gold"> <a href="https://discord.com/invite/VyuFQUpcUz"><img src="https://img.shields.io/badge/Chat-Discord-7289DA?style=&logo=discord"></a> <a href="https://github.com/RandomHashTags/swift-htmlkit/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-Apache_2.0-blue" alt="Apache 2.0 License"></a>

## Limitations

Current limitations of Swift Macros doesn't enable this library to support custom objects, only values found in the Standard Library (and Foundation).

However, it does support custom objects but you have to supply the literal memory layout (no reference or stored value) using the correct macro.

This library organizes custom objects at the bottom, just above objects that have a 1,1,1 (alignment,size,stride) memory layout.