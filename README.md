# Bazel Codelab

## Exercise 2: Gazelle
1. Look at the contents of `go/cmd/server`
1. Run the following command. Observe the output.
   ```
   bazel run //:gazelle
   ```
1. Run `git status` to see what has changed.
1. Study the contents of any changed files.
1. Run the new binary target that you find.
   <details>
     <summary>Hint</summary>
   
     Run the following command:
     ```
     bazel run //go/cmd/server
     ```
   </details>
1. In the dialog that pops up in the bottom right, click on `Open in Browser`. If you miss the dialog, you can click on `PORTS`, right click on `8081`, and click `Open in Browser`

## Questions
<details>
  <summary>Expand after completing the exercise</summary>

  1. In which `BUILD` files did you observe changes?
  2. Were there any changes to the Java `BUILD` file? Why not?
  3. Why did gazelle create a library target _and_ a binary target?
  4. Why did gazelle create `proto` targets?
</details>

## Next Exercise
In your terminal, run the following command to get to the next exercise:
```
./next_exercise.sh
```
