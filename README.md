# Bazel Codelab

## Exercise 5: Queries

In this exercise, we will experiment with Bazel queries

1.  What are the dependencies for `//proto/logger:logger_proto`?
    ```
    bazel query 'deps(//proto/logger:logger_proto)'
    ```

1. What targets depend on `//go/cmd/server`?
    ```
    bazel query 'rdeps(//go/cmd/server,//...)' 
    ```

1. What is the dependency path from `//go/cmd/server` to `//proto/logger:logger_proto`?

    ```
    bazel query 'somepath(//go/cmd/server,//proto/logger:logger_proto)'
    ```


## Relevant Documentation
- [`bazel query` guide](https://bazel.build/query/guide)
