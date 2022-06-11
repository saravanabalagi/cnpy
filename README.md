# cnpy

Read and write `.npy` and `.npz` files in C++. Forked from [rogersce/cnpy](https://github.com/rogersce/cnpy), added an example project showing how this library can be used as a dependency. For converting `.mat` files to `.npz` and vice versa, use [npy_mat_npz](https://github.com/saravanabalagi/npy_mat_npz).

## Quick Start

```
git clone https://github.com/saravanabalagi/cnpy.git
sh build.sh
```

## Usage

For reading data:
- npy_load(f)
- npz_load(f)
- npz_load(f, var)

Once loaded into, say `cnpy::NpyArray np_data` variable, you can retrieve
- `np_data.data<T>()` yields data pointer `T*`, where T can be `int`, `double`, etc.
- `np_data.shape` yields `std::vector<size_t> shape`;
- `np_data.word_size` yields `size_t word_size`;

For saving data:
- npy_save(f, data, shape)
- npz_save(f, var, data, shape)

## Example

[example](example) shows how to use this lib in your own projects and [example.cpp](example/example.cpp) has code to read and write sample numpy arrays.
