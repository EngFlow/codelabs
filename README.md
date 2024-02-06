# Bazel Codelab

## Exercise 1 - Get To Know Bazel Commands
In this exercise, we will be getting to know Bazel by running `build` and `run` commands.

1. Build the target `HelloBazelBootcamp` in `java/src/main/java/bazel/bootcamp`.
    <details><summary>Solution</summary>
    ```
    bazel build //java/src/main/java/bazel/bootcamp:HelloBazelBootcamp
    ```
    </details>
1. Build all targets in `java/src/main/java/bazel/bootcamp`.
   <details><summary>Solution</summary>
    ```
    bazel build //java/src/main/java/bazel/bootcamp:...
    ```
    </details>
1. Run `HelloBazelBootcamp`.
   <details><summary>Solution</summary>
    ```
    bazel run //java/src/main/java/bazel/bootcamp:HelloBazelBootcamp
    ```
    </details>
1. Run `HelloBazelBootcamp`, and pass in your name as a parameter.
   <details><summary>Solution</summary>
    ```
    bazel run //java/src/main/java/bazel/bootcamp:HelloBazelBootcamp -- "Jane"
    ```
    </details>

## Next Exercise
In your terminal, run the following command to get to the next exercise:
```
./next_exercise.sh
```
