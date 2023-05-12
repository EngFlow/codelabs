# Bazel Codelab

## Before you get started
Take a look at these [informational slides](https://docs.google.com/presentation/d/1N1hwmWBn1buu6QM-iPyWnce09u5gA6qckhNWVKnFibU/edit?usp=sharing&resourcekey=0-ReNkM3KNxRsh0Erzl9vagw) to learn about Bazel.

## Exercise 0 - Introduction to Bazel
Welcome! In this course, we will be writing Bazel BUILD files, in order to create the build system for the provided code. At the end, using only Bazel, we will build:
* Protobuf and gRPC generated code for Go and Java.
* A Go gRPC server that listens for Protobuf messages, and prints received messages to a status page.
* A Java client that connects to our server, and sends log messages via gRPC.

Note the file structure for this project:
* Where are the protobuf files?
* Where is the Java and Go code?
* How many workspaces are present in this project?
* How many packages are currently present in the root workspace?
* How many packages do you think we will need, when we are done?
