# Bazel Codelab

Exercise 3: Interpreting Bazel errors
====
In this exercise, we will build our Java gRPC logging client, and connect it to the go gRPC listener.

Let's start by opening //proto/logger/BUILD. Notice that there are now two new definitions:
* A `java_proto_library` target, called `"logger_java_proto"`
* A `java_grpc_library` target, called `"logger_java_grpc"`

1. Build the `:logger_java_proto` target.
   ```
   bazel build //proto/logger:logger_java_proto
   ```

2. Note the error. This indicates that there is a syntax issue with our build file, in a separate definition.

3. Add the Java proto library as a dependency to `logger_java_grpc`, and rebuild the target. You should see the `logger_java_proto` target succeed.


4. Build the `logger_java_grpc`
   ```
   bazel build //proto/logger:logger_java_grpc
   ```

Once both proto and grpc libraries successfully build, move on to the next section.

Part 2: Fix errors in Java targets
========

Now, let's open the `BUILD` file in `java/src/main/java/bazel/bootcamp/`. Notice there are two targets defined here.
* A `java_library` target, called `"JavaLoggingClientLibrary"`
* A `java_binary` target, called `"JavaLoggingClient"`

A common pattern in Bazel is to have a binary target that is separate from a library target, and which inherits the library. This allows for more incremental target structure. In this `BUILD` file, our `JavaLoggingClient` should be executable. And, it should depend on the `JavaLoggingClientLibrary`.

Let's test these targets, like we did with the proto targets before.

1. Start by building the library.
   ```
   bazel build //java/src/main/java/bazel/bootcamp:JavaLoggingClientLibrary
   ```

   Look at the first error. Looks like we have a syntax error on line 9. Fix it, and try the build again.

2. Now, the error has changed. This time, the suggestions are quite helpful.

   Add the suggested dependencies to `JavaLoggingClientLibrary`:
   ```
         "//proto/logger:logger_java_proto",
         "@io_grpc_grpc_java//api",
   ```

3. Now, let's build the executable client.

   ```
   bazel build //java/src/main/java/bazel/bootcamp:JavaLoggingClient
   ```
   Looks like we have a missing dependency. You might have noticed that the client's dependency list is empty. Let's add `:JavaLoggingClientLibrary` to the `deps` list for `:JavaLoggingClient`, since that is the missing symbol reported in our error.

4. Finally, let's try running the client.

   ```
   bazel run //java/src/main/java/bazel/bootcamp:JavaLoggingClient
   ```
   You will likely have gotten an error about a missing channel service provider. This is a runtime dependency required by gRPC. Let's add the following to our Java `BUILD` file, below `deps`:
   ```
       runtime_deps = ["@io_grpc_grpc_java//netty"],
   ```
   Run the client again. If successful, you should see the following message in the terminal:
   ```
   Enter log messages to send to the server, enter 'exit' to stop the client.
   ```


Putting it all together
===

1. In shell 1, run the Java binary target:
   ```
   bazel run //java/src/main/java/bazel/bootcamp:JavaLoggingClientLibrary
   ```
2. Open a new shell, and run this command:
   ```
   bazel run //go/cmd/server
   ```
3. Open the `PORTS` menu in VSCode, and click on 8080 to open the `go` server in a new tab.
4. Send messages from the client to the server, and refresh the `go` server webpage to see the message.

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
