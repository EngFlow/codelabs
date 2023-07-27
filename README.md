# Bazel Codelab

## Exercise 3: Java Client
1. Edit the `BUILD` file for `logger.proto`, to add proto and gRPC definitions for Java.
   - Create a `java_proto_library` target to generate Java protobuf code.
        <details>
           <summary>Hint</summary>
           
        The docs state that your `java_proto_library` should depend on a `proto_library` target. Is there one already defined?
   
        Also, take note of the parameters for `java_proto_library` rule. They are different from the `go_proto_library` rule definition!
        </details>
   - Using the Java proto library we just created, create a `java_grpc_library` target to generate gRPC code.
        <details>
           <summary>Hint</summary>

     In the example `java_grpc_library`, note that the `srcs` parameter is the same `proto_library`.
     The `deps` parameter should be the `java_proto_library` that you just defined.
        </details>
        <details>
           <summary>Hint 2</summary>

        You might get an error like this:
        ```
        ERROR: codelabs/proto/logger/BUILD:34:1: name 'java_grpc_library' is not defined (did you mean 'java_proto_library'?)
        ```
        Is there a commented import statement in the build file that would help resolve this issue?
        </details>
     - `bazel build` your new targets to ensure that your library definitions are correct.
2. Edit the `BUILD` file in the `java/src/main/java/bazel/bootcamp` package.
   - Using the `java_proto_library` and `java_grpc_library` target definitions that you just created, add a `java_library` entry for `JavaLoggingClientLibrary.java`
   - `bazel build` the library to ensure that your library definition is correct.
     <details>
        <summary>Hint</summary>
     
     You will need to add `"@io_grpc_grpc_java//core"` to your dependencies to use the gRPC client.
     </details>
   - Using the `java_library` you just created, add a `java_binary` target for `JavaLoggingClient.java`
3. `bazel run` your new Java binary target
   <details>
   <summary>Hint</summary>
   
   If you get a `ProviderNotFoundException`, you will need to add `"@io_grpc_grpc_java//netty"` as a `runtime_dep`.
   </details>
4. In a separate terminal, `bazel run` the Go binary from Section 2
5. Send messages from the client to the server and view them on http://localhost:8081

## Relevant Documentation
- [`java_proto_library` documentation](https://docs.bazel.build/versions/master/be/java.html#java_proto_library)
- [`java_grpc_library` documentation](https://grpc.io/docs/reference/java/generated-code.html) (look towards the
  bottom of the page for a Bazel example)
- [`java_library` documentation](https://docs.bazel.build/versions/master/be/java.html#java_library)
- [`java_binary` documentation](https://docs.bazel.build/versions/master/be/java.html#java_binary)

## Questions
<details>
  <summary>Expand after completing the exercise</summary>

1. Where is `@io_grpc_grpc_java` coming from?
2. Why do we need to add gRPC, protobuf, and local dependencies for our targets?
3. Why did the code `build` successfully without `netty`, but fail to run?
</details>
