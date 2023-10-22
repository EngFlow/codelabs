# Bazel Codelab

## Exercise 1: Hello, Bazel!
In this exercise, we will build and execute a `java_binary` target. Start by opening `java/src/main/java/bazel/bootcamp/BUILD`:

1. Add a `java_binary` target for the `HelloBazelBootcamp.java` file
   <details><summary>Solution</summary>

    Add the following to your build file.
     ```
     java_binary(
        name = "HelloBazelBootcamp",
        srcs = ["HelloBazelBootcamp.java"],
     )
     ```
   </details>
1. Run the binary using the following command:
   ```
   bazel run //java/src/main/java/bazel/bootcamp:HelloBazelBootcamp
   ```

## Questions
1. Which fields are strictly necessary?
2. Why did we not have to import `java_binary`?

## Documentation
- [`java_binary` documentation](https://docs.bazel.build/versions/master/be/java.html#java_binary)

## Next Exercise
In your terminal, run the following command to get to the next exercise:
```
./next_exercise.sh
```
