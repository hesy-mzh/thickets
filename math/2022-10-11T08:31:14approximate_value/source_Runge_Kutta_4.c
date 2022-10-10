#include <stdio.h>
#include <math.h>

int main(void){

    double DT=0.1;
    double u=1.0;
    double k1,k2,k3,k4;

    // 初期値表示
    printf("t=%f u=%f exp(t)=%f 差分：%.10f\n", 0*DT, u, exp(0*DT), fabs(u - exp(0*DT) ));

    // 近似値と理論値、その差分 表示
    for (int i=1 ; i<=10 ; i++){
        k1 = DT * u;
        k2 = DT * (u + k1/2);
        k3 = DT * (u + k2/2);
        k4 = DT * (u + k3);
        u= u + (k1 + 2*k2 + 2*k3 + k4)/6;
        printf("t=%f u=%f exp(t)=%f 差分：%.10f\n", i*DT, u, exp(i*DT), fabs(u - exp(i*DT) ));
    }
    return 0;
}
