#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define A 2.0 /* u の初期値 */
#define B 1.5 /* v の初期値 */
#define M 0.2 /* 空気抵抗 */
#define T 50.0 /* 終了時間 */
#define DT 0.1 /* 刻み時間 */

// 関数 メイン
double fn_main (double x, double y, double z) {
    (void) x;
    (void) y;
    return z;
}
// 関数 サブ
double fn_sub (double x, double y, double z) {
    (void) x;
    return - sin(y) - M * z;
}


int main(void) {
    int i;
    double u=A, v=B; /* 実数型の変数宣言、初期値で初期化 */
    double k_1, k_2, k_3, k_4, m_1, m_2, m_3, m_4;

    int N = (int) ceil(T / DT);
    double t=0;

    printf("%f %f\n", 0.0, A);
    for (i=1; i<=N; i++) {

        t=DT*i;
        
        k_1 = fn_main(t,u,v);
        m_1 = fn_sub(t,u,v);
        
        k_2 = fn_main(t+DT/2, u+k_1*DT/2, v+m_1*DT/2);
        m_2 = fn_sub(t+DT/2, u+k_1*DT/2, v+m_1*DT/2);
        
        k_3 = fn_main(t+DT/2, u+k_2*DT/2, v+m_2*DT/2);
        m_3 = fn_sub(t+DT/2, u+k_2*DT/2, v+m_2*DT/2);
        
        k_4 = fn_main(t+DT/2, u+k_3*DT, v+m_3*DT);
        m_4 = fn_sub(t+DT/2, u+k_3*DT, v+m_3*DT);
        
        u = u + (k_1 + 2*k_2 + 2*k_3 + k_4)*DT/6; /* u の差分式 */
        v = v + (m_1 + 2*m_2 + 2*m_3 + m_4)*DT/6; /* v の差分式 */
        printf("%f %f\n", i*DT, u);
        
    }
    
    return EXIT_SUCCESS;
}
