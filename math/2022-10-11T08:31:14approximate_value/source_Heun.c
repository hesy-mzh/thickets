#include <stdio.h>
#include <math.h>

int main(void){

    double DT=0.01;
    double u=1.0;

    // 初期値表示
    printf("t=%f u=%f exp(t)=%f 差分：%.10f\n", 0*DT, u, exp(0*DT), fabs(u - exp(0*DT) ));

    // 近似値と理論値、その差分 表示
    for (int i=1 ; i<=100 ; i++){
        u= u*(1+DT+pow(DT,2)/2);
        printf("t=%f u=%f exp(t)=%f 差分：%.10f\n", i*DT, u, exp(i*DT), fabs(u - exp(i*DT) ));
    }
    return 0;
}
