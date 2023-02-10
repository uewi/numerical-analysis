public class Main2 {
    static int count;

    public static void main(String[] args) {

        System.out.println("TOL = 10^(-2)");
        print(output(0.01));

        System.out.println("TOL = 10^(-3)");
        print(output(0.001));

        System.out.println("TOL = 10^(-4)");
        print(output(0.0001));

        System.out.println("TOL = 10^(-8)");
        print(output(0.00000001));
    }

    static void print(double[] output) {
        for (double d : output) {
            System.out.println(d);
        }
    }

    static double f(double t) {
        count++;
        return (2 / Math.sqrt(Math.PI)) * Math.exp(-t * t);
    }


    static double[] output(double TOL) {
        double[] array = new double[21];
        array[0] = 0;
        for (int i = 1; i < 21; i++) {
            double a = (double) (i - 1) / 10;
            double b = (double) i / 10;
            array[i] = array[i - 1] + integral(a, b, TOL);
        }
        return array;
    }

    static double integral(double a, double b, double TOL) {
        int n = 1;
        double s1 = s(n, a, b);
        double s2 = s(2 * n, a, b);

        while (TOL < Math.abs(s2 - s1) / 15) {
            count = 0;
            n = 2 * n;
            s1 = s(n, a, b);
            s2 = s(2 * n, a, b);
        }
        return s2 + (s2 - s1) / 15;
    }

    static double s(int n, double a, double b) {
        return (4 * t(2 * n, a, b) - t(n, a, b)) / 3;

    }

    static double t(int n, double a, double b) {

        if (n == 1) {
            return (b - a) * (f(a) + f(b)) / 2;
        } else
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
        int i = 0;
        while (i < n) {
            m = m + h * f(x[i] + h / 2);
            i++;
        }
        return m;
    }
}