
import java.util.*;
import java.io.*;

public class TodoApp {
    static ArrayList<String> tasks = new ArrayList<>();
    static String file = "tasks.txt";

    static void load() {
        try {
            Scanner s = new Scanner(new File(file));
            while (s.hasNextLine())
                tasks.add(s.nextLine());
            s.close();
        } catch (Exception e) {}
    }

    static void save() {
        try {
            PrintWriter p = new PrintWriter(file);
            for (String t : tasks) p.println(t);
            p.close();
        } catch (Exception e) {}
    }

    static void list() {
        for (int i = 0; i < tasks.size(); i++)
            System.out.println((i+1) + ". " + tasks.get(i));
    }

    public static void main(String[] args) {
        load();

        if (args.length > 0) {
            switch (args[0]) {
                case "add":
                    tasks.add(String.join(" ",
                        Arrays.copyOfRange(args,1,args.length)));
                    save();
                    System.out.println("Task added!");
                    break;

                case "delet":
                    int n = Integer.parseInt(args[1]);
                    if (n >= 1 && n <= tasks.size()) {
                        tasks.remove(n-1);
                        save();
                        System.out.println("Task deleted!");
                    }
                    break;

                case "l":
                    list();
                    break;
            }
            return;
        }

        Scanner sc = new Scanner(System.in);
        while (true) {
            System.out.println("\n1. Add Task");
            System.out.println("2. Delete Task");
            System.out.println("3. List Tasks");
            System.out.println("4. Exit");

            int c = sc.nextInt();
            sc.nextLine();

            if (c == 1) {
                System.out.print("Enter task: ");
                tasks.add(sc.nextLine());
                save();
            } else if (c == 2) {
                list();
                int n = sc.nextInt();
                if (n >= 1 && n <= tasks.size()) {
                    tasks.remove(n-1);
                    save();
                }
            } else if (c == 3) {
                list();
            } else if (c == 4) {
                break;
            }
        }
        sc.close();
    }
}
