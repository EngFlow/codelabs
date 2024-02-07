# Bazel Codelab

## Exercise 4: Interpreting Bazel errors
### Part 1: Syntax errors
In this exercise, we will build our Java gRPC logging client, and connect it to the go gRPC listener.

Let's start by opening `//proto/logger/BUILD`. Notice that there are now two new definitions:
* A `java_proto_library` target, called `"logger_java_proto"`
* A `java_grpc_library` target, called `"logger_java_grpc"`

1. Build the `:logger_java_proto` target.
   <details><summary>Hint</summary>

    ```
    bazel build //proto/logger:logger_java_proto
    ```
   </details>
1. Note the error. This indicates that there is a syntax issue with our build file. Fix the issue and try to build again.
   <details><summary>Hint</summary>

   Is `java_grpc_library` properly imported?
   </details>

   <details><summary>Solution</summary>

   Uncomment line 4 of `//proto/logger/BUILD`
   </details>

1. Re-run your last build, and fix the next syntax error. 
   <details><summary>Hint</summary>

   It looks like we are missing a field in a different target in this file. What should the dependencies of `logger_java_grpc` look like? Check the documentation section at the bottom if you need help with the syntax for this rule.
   </details>
   
   <details><summary>Solution</summary>
   
   Add the following line to `logger_java_grpc` under `srcs` (line 34), and rebuild `logger_java_proto`.
   ```
       deps = [":logger_java_proto"],
   ```
   </details>


1. With the syntax errors fixed in this build file, you should now be able to build `logger_java_grpc`
   <details><summary>Solution</summary>

   ```
   bazel build //proto/logger:logger_java_grpc
   ```
   </details>

Once both proto and grpc libraries successfully build, move on to the next section.

### Part 2: Dependency errors in Java targets

Now, let's open the `BUILD` file in `java/src/main/java/bazel/bootcamp/`. Notice there are two targets defined here.
* A `java_library` target, called `"JavaLoggingClientLibrary"`
* A `java_binary` target, called `"JavaLoggingClient"`

A common pattern in Bazel is to have a binary target that is separate from a library target, and which inherits the library. This allows for more incremental target structure. In this `BUILD` file, our `JavaLoggingClient` should be executable. And, it should depend on the `JavaLoggingClientLibrary`.

Let's test these targets, like we did with the proto targets before.

1. Start by building the `java_library` target. Fix the error that you see, and try again.
   <details><summary>Hint</summary>

   ```
   bazel build //java/src/main/java/bazel/bootcamp:JavaLoggingClientLibrary
   ```

   Look at the first line of the error. Looks like we have a syntax error right before line 9.
   </details>
   <details><summary>Solution</summary>

   Add a comma to the end of line 8 in `java/src/main/java/bazel/bootcamp/BUILD`. Then run this command:

   ```
   bazel build //java/src/main/java/bazel/bootcamp:JavaLoggingClientLibrary
   ```
   </details>
   

1. Now, the error has changed. Fix the error that you see, and try again.

   <details><summary>Hint</summary>

   Look at the bold error, near the middle. This time, the suggestions are quite helpful. However, `//proto/logger:logger_proto` is just a descriptor. Is there a Java proto library that you can add instead?
   </details>

   <details><summary>Solution</summary>

   Add the suggested dependencies to `JavaLoggingClientLibrary`:
   ```
         "//proto/logger:logger_java_proto",
         "@io_grpc_grpc_java//api",
   ```
   And then run this command:
   ```
   bazel build //java/src/main/java/bazel/bootcamp:JavaLoggingClientLibrary
   ```
   </details>

1. Now, let's build the `java_binary` client. Fix any errors that you find.

   <details><summary>Hint</summary>
   
   Looks like we have a missing dependency. You might have noticed that the client's dependency list is empty. What target contains the definition for the symbol that is missing?

   </details>

   <details><summary>Solution</summary>

    In the Java `BUILD` file, find the line that contains the following contents:
    ```
    # Add the library from above
    ```

    Replace with the following:
    ```
    ":JavaLoggingClientLibrary",
    ```
   </details>
1. Finally, let's try running the client.

   <details><summary>Hint</summary>

   The error mentions needing a runtime library. Is there a dependency in the comments at the top of the Java `BUILD` file that looks like a good fix for this error?
   </details>

   <details><summary>Solution</summary>

   First, run the following command to see the error:
   ```
   bazel run //java/src/main/java/bazel/bootcamp:JavaLoggingClient
   ```
   You will likely have gotten an error about a missing channel service provider. This is a runtime dependency required by gRPC. Add the following to our Java `BUILD` file, below `deps`:
   ```
    runtime_deps = ["@io_grpc_grpc_java//netty"],
   ```
   Run the command again. It should succeed this time.
   </details>
   
If successful, you should see the following message in the terminal:
```
Enter log messages to send to the server, enter 'exit' to stop the client.
```


Putting it all together
===

1. First, run the Java binary target:
   ```
   bazel run //java/src/main/java/bazel/bootcamp:JavaLoggingClient
   ```
1. Open a new terminal, and run this command to start the Go server:
   ```
   bazel run //go/cmd/server
   ```
1. Open the `PORTS` menu in VSCode, and click on 8080 to open the `go` server in a new tab.
1. Send messages from the client to the server, and refresh the `go` server webpage to see the message.

Relevant Documentation
=====
- [`java_proto_library` documentation](https://docs.bazel.build/versions/master/be/java.html#java_proto_library)
- [`java_grpc_library` documentation](https://grpc.io/docs/reference/java/generated-code.html) (look towards the bottom of the page for a Bazel example)
- [`java_library` documentation](https://docs.bazel.build/versions/master/be/java.html#java_library)
- [`java_binary` documentation](https://docs.bazel.build/versions/master/be/java.html#java_binary)

Questions
====
1. Where is `@io_grpc_grpc_java` coming from?
2. Why do we need to add gRPC, protobuf, and local dependencies for our targets?
3. Why did the code `build` successfully without `netty`, but fail to run?
