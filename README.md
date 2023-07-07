# Bazel Codelab

## Exercise 2: Gazelle
1. Look at the contents of `go/cmd/server`
2. Run `bazel run //:gazelle`. Observe the output.
3. Run `git status` to see what has changed.
4. Study the contents of any changed files.
5. Run the new binary target that you find.
   <details>
     <summary>Hint</summary>
   
     Look in `go/cmd/server/BUILD` for a `go_binary` target to run.
   </details>

## Questions
<details>
  <summary>Expand after completing the exercise</summary>

  1. In which `BUILD` files did you observe changes?
  2. Were there any changes to the Java `BUILD` file? Why not?
  3. Why did gazelle create a library target _and_ a binary target?
  4. Why did gazelle create `proto` targets?
</details>
