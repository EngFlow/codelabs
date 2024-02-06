package bazel.bootcamp;

class HelloBazelBootcamp {
  public static void main(String[] args) {
    String user = "friend";
    if(args.length > 0){
      user = args[0];
    }
    System.out.println("Welcome to the Bootcamp, " + user + "! Let's get going :) ");

  }
}
