import java.util.*;

public class Main1 {
    static int count;
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("a = ");
        int a = scanner.nextInt();
        System.out.print("b = ");
        int b = scanner.nextInt();
        System.out.print("TOL = 10^ ");
        int c = scanner.nextInt();
        double tol = Math.pow(10, c);
        System.out.println(integral(a, b, tol));
        System.out.println("count = " + count);
    }

//    static double f(double x) {
//        count++;
//        return 4 / (1 + x * x);
//    }

//    static double f(double x) {
//        count++;
//        double y = Math.cos(x);
//        return y * y;
//    }


    static double integral(double a, double b, double TOL) {
        int n = 1;
        double s1 = s(n, a, b);
        double s2 = s(2 * n, a, b);

        while (TOL < Math.abs(s2 - s1) / 15) {
            n = 2 * n;
            count = 0;
            s1 = s(n, a, b);
            s2 = s(2 * n, a, b);
        }
        return s2 + (s2 - s1) / 15;
    }


    static double s(int n, double a, double b) {
        return (4 * t(2 * n, a, b) - t(n, a, b)) / 3;

    }

    static double t(int n, double a, double b) {

        if (n == 1)
            return (b - a) * (f(a) + f(b)) / 2;
        else
            return (t(n / 2, a, b) + m(n / 2, a, b)) / 2;
    }

    static double m(int n, double a, double b) {
        if (n == 1) {
            return (b - a) * f((a + b) / 2);
        }
        double h = (b - a) / n;
        double[] x = new double[n];
        x[0] = a;
        for (int i = 0; i < n - 1; i++) {
            x[i + 1] = x[i] + h;
        }

        double m = 0;
        for (int i = 0; i < n; i++) {
            m = m + h * f(x[i] + h / 2);
        }
        return m;
    }
}