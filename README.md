# Bazel Codelab

## Exercise 4: Java client unit tests

In this exercise, we will build tests for the Java classes that were added in the last exercise. Look in `//java/src/main/java/bazel/bootcamp`. You should see two new files:
* `JavaLoggingClientLibraryTest.java`
* `JavaLoggingClientTest.java`

1.  Edit the `BUILD` file for `JavaLoggingClientLibraryTest.java`, and add the following entry:
    ```
    java_test(
      name = "JavaLoggingClientLibraryTest",
      srcs = ["JavaLoggingClientLibraryTest.java"],
      deps = [":JavaLoggingClientLibrary"],
    )
    ```
    Now, run the test using `bazel test`.
    <details>
      <summary>Hint</summary>

      ```
      bazel test //java/src/main/java/bazel/bootcamp:JavaLoggingClientLibraryTest
      ```
    </details>
1.  The test fails, but the cause is unclear. Run the test again with `--test_output=errors`, to see the actual error.
1.  What did we do last time we encountered this error? Can we do the same thing here?
    <details>
      <summary>Hint</summary>

      Add the following `runtime_dep` to your `JavaLoggingClientLibraryTest` target.
      ```
      runtime_deps = ["@io_grpc_grpc_java//netty"],
      ``` 
    </details>
1.  Using the example from above, create a separate test target for `JavaLoggingClientTest.java`

## Experimenting with parameters
Now that our tests work, let's try experimenting with a few flags. Note that `-t-` turns `cache_test_results` off, and allows us to experiment with the same test repeatedly without getting cached results.

1. Run your tests with `--runs_per_test=10`. Note the difference.
1. Try running with `--test_output=all -t-`. Compare to `--test_output=errors -t-`
1. How would you run only one test in `JavaLoggingClientLibraryTest`?
   <details>
      <summary>Hint</summary>

      ```
      bazel test //java/src/main/java/bazel/bootcamp:JavaLoggingClientLibraryTest --test_filter=testHello -t-
      ```
    </details>

## Relevant Documentation
- [`java_test` documentation](https://docs.bazel.build/versions/master/be/java.html#java_test)
- [`bazel test` options](https://bazel.build/docs/user-manual#bazel-test-options)
- [bazel `cache_test_results` flag](https://bazel.build/docs/user-manual#cache-test-results)

Questions
====
