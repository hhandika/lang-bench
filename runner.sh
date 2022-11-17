#!/usr/bin/env fish

set C_OUT "main-c"
set C_OUT_OPT "main_opt"
set CPP_OUT "main-cpp"
set RS_OUT "main-rs"
set GO_OUT "main-go"

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

# Clean cache
hyperfine --warmup 3 "./$C_OUT" "./$C_OUT_OPT" "./$CPP_OUT" "./$RS_OUT" "./$GO_OUT" "python main.py"

# Run benchmark
hyperfine "./$C_OUT" "./$C_OUT_OPT" "./$CPP_OUT" "./$RS_OUT" "./$GO_OUT" "python main.py"


# Clean up
rm $C_OUT $C_OUT_OPT $RS_OUT
