#!/usr/bin/env fish

set C_OUT "main-c"
set C_OUT_OPT "main-opt"
set CPP_OUT "main-cpp"
set RS_OUT "main-rs"
set GO_OUT "main-go"
set DART_OUT "main-dart"


# Compile C code
gcc -o $C_OUT main.c

# Compile C code with O3 optimization
gcc -o $C_OUT_OPT main.c -O3

# Compile C++ code
g++ -o $CPP_OUT main.cpp

# Compile Rust code
rustc -o $RS_OUT main.rs

# Compile Go code
go build -o $GO_OUT main.go

# Compile Java code
javac main.java

# Compile typescript code
tsc main.ts

# Compile dart code
dart compile exe main.dart -o $DART_OUT

# Run benchmark, we warmup to fill the cache
hyperfine --warmup 3 "./$C_OUT" "./$C_OUT_OPT" "./$CPP_OUT" "./$RS_OUT" "./$GO_OUT" "./$DART_OUT" "java main" "python main.py" "node main.js"

# Clean up
rm $C_OUT $C_OUT_OPT $RS_OUT $GO_OUT $DART_OUT main.class main.js
