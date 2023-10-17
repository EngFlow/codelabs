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
1.  The test fails, but the cause is unclear. What can you do to see the error?
    <details>
      <summary>Hint</summary>

      Is there a `--test_output` option that can help?
    </details>

    <details>
      <summary>Solution</summary>

    Run the test again with `--test_output=errors`, to see the actual error.
    ```
    bazel test //java/src/main/java/bazel/bootcamp:JavaLoggingClientLibraryTest --test_output=errors
    ```
    </details>

1.  Look at the error. It should look familiar. What did we do last time we encountered this error? Can we do the same thing here?
    <details>
      <summary>Solution</summary>

      Add the following `runtime_dep` to your `JavaLoggingClientLibraryTest` target.
      ```
      runtime_deps = ["@io_grpc_grpc_java//netty"],
      ``` 
    </details>
1.  Using the example from above, create and run a separate test target for `JavaLoggingClientTest.java`
    <details>
      <summary>Solution</summary>

      Add the following to your Java `BUILD` file:
    ```
    java_test(
      name = "JavaLoggingClientTest",
      srcs = ["JavaLoggingClientTest.java"],
      deps = [":JavaLoggingClient"],
    )
    ```
    Run this command to test:
    ```
    bazel test //java/src/main/java/bazel/bootcamp:JavaLoggingClientTest
    ```
    </details>

## Experimenting with parameters
Now that our tests work, let's try experimenting with a few flags. Note that `--nocache_test_results` turns local cache results off, and allows us to experiment with the same test repeatedly without getting cached results.

1. Run your tests with `--runs_per_test=10`. Note the difference.
1. Try running with `--test_output=all --nocache_test_results`. Compare to `--test_output=errors --nocache_test_results`
1. How would you run only one test in `JavaLoggingClientLibraryTest`?
   <details>
      <summary>Hint</summary>

      ```
      bazel test //java/src/main/java/bazel/bootcamp:JavaLoggingClientLibraryTest --test_filter=testHello --nocache_test_results --test_output=all
      ```
    </details>

## Relevant Documentation
- [`java_test` documentation](https://docs.bazel.build/versions/master/be/java.html#java_test)
- [`bazel test` options](https://bazel.build/docs/user-manual#bazel-test-options)
- [bazel `cache_test_results` flag](https://bazel.build/docs/user-manual#cache-test-results)

Questions
====
