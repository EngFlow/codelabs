# Bazel Codelab

## Exercise 1: Hello, Bazel!
1. Edit: `java/src/main/java/bazel/bootcamp/BUILD`
1. Add a `java_binary` target for the `HelloBazelBootcamp.java` file
   - [`java_binary` documentation](https://docs.bazel.build/versions/master/be/java.html#java_binary)
   - Hint: Look at the next step for ideas on the target's name.
1. Run the binary using `bazel run //java/src/main/java/bazel/bootcamp:HelloBazelBootcamp`

## Questions
1. Which fields are strictly necessary?
2. Why did we not have to import `java_binary`?

## Next Exercise
In your terminal, run the following command to get to the next exercise:
```
./next_exercise.sh
```
