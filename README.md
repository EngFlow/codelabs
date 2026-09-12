# Bazel Codelab

## Exercise 2: Hello, Bazel!
In this exercise, we will write the rule invocation for the `java_binary` that you ran in the last exercise. Start by opening `java/src/main/java/bazel/bootcamp/BUILD`:

1. Add a `java_binary` target for the `HelloBazelBootcamp.java` file
   <details><summary>Solution</summary>

    Add the following to your build file.
     ```
     load("@rules_java//java:java_binary.bzl", "java_binary")
    
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
2. Why did we have to import `java_binary`?

## Documentation
- [`java_binary` documentation](https://bazel.build/reference/be/java#java_binary)

## Next Exercise
In your terminal, run the following command to get to the next exercise:
```
./next_exercise.sh
```
