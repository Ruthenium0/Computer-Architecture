sort:
        push    rbp
        mov     rbp, rsp
        push    rbx
        mov     DWORD PTR [rbp-52], edi    
        mov     QWORD PTR [rbp-64], rsi
; function starts
        mov     eax, DWORD PTR [rbp-52]   
        movsx   rdx, eax
        sub     rdx, 1                     
        mov     QWORD PTR [rbp-40], rdx    
        movsx   rdx, eax
        mov     rcx, rdx
        mov     ebx, 0
        mov     edx, DWORD PTR [rbp-52]    ; initialize n
        sub     edx, 1                     ; n-1
        mov     DWORD PTR [rbp-24], edx    ; R = n-1
        mov     BYTE PTR [rbp-25], 1       ; _Bool flag = 1
        jmp     .L2                        ; goto while loop

.L6:
; while (flag == 1)  loop starts
        mov     BYTE PTR [rbp-25], 0       ; flag = 0;
; main loop for( int i = 0;i<n-1;i++) condition
        mov     DWORD PTR [rbp-20], 0      ; int i = 0;
        jmp     .L3                        ; jump to check statement
.L5:
; main loop for( int i = 0;i<n-1;i++) starts
;if(A[i+1][n-2-i]>A[i][n-1-i])
        mov     edx, DWORD PTR [rbp-20]
        add     edx, 1
        movsx   rcx, edx
        movsx   rdx, eax
        imul    rdx, rcx
        lea     rcx, [0+rdx*4]
        mov     rdx, QWORD PTR [rbp-64]
        add     rcx, rdx
        mov     edx, DWORD PTR [rbp-52]
        sub     edx, 2
        sub     edx, DWORD PTR [rbp-20]
        movsx   rdx, edx
        mov     ecx, DWORD PTR [rcx+rdx*4]
        mov     edx, DWORD PTR [rbp-20]
        movsx   rsi, edx
        movsx   rdx, eax
        imul    rdx, rsi
        lea     rsi, [0+rdx*4]
        mov     rdx, QWORD PTR [rbp-64]
        add     rsi, rdx
        mov     edx, DWORD PTR [rbp-52]
        sub     edx, 1
        sub     edx, DWORD PTR [rbp-20]
        movsx   rdx, edx
        mov     edx, DWORD PTR [rsi+rdx*4]
        cmp     ecx, edx
        jle     .L4
; if true branch start
;tmp = A[i+1][n-2-i]
        mov     edx, DWORD PTR [rbp-20]
        add     edx, 1
        movsx   rcx, edx
        movsx   rdx, eax
        imul    rdx, rcx
        lea     rcx, [0+rdx*4]
        mov     rdx, QWORD PTR [rbp-64]
        add     rcx, rdx
        mov     edx, DWORD PTR [rbp-52]
        sub     edx, 2
        sub     edx, DWORD PTR [rbp-20]
        movsx   rdx, edx
        mov     edx, DWORD PTR [rcx+rdx*4]
        mov     DWORD PTR [rbp-44], edx
;A[i+1][n-2-i] = A[i][n-1-i]
        mov     edx, DWORD PTR [rbp-20]  A[i][]
        movsx   rcx, edx
        movsx   rdx, eax
        imul    rdx, rcx
        lea     rcx, [0+rdx*4]
        mov     rdx, QWORD PTR [rbp-64]
        add     rcx, rdx
        mov     edx, DWORD PTR [rbp-52] 
        sub     edx, 1                     ; n-1
        sub     edx, DWORD PTR [rbp-20]    ; A[i][n-1-i]
        mov     esi, DWORD PTR [rbp-20]    ; put i into ESI
        add     esi, 1                     ; i+1
        movsx   rdi, esi                   ; A[i+1]
        movsx   rsi, eax
        imul    rsi, rdi
        lea     rdi, [0+rsi*4]
        mov     rsi, QWORD PTR [rbp-64]
        add     rsi, rdi
        mov     edi, DWORD PTR [rbp-52]    ; put n into EDI
        sub     edi, 2                     ; n-2
        sub     edi, DWORD PTR [rbp-20]    ; A[n-2-i]
        movsx   rdx, edx
        mov     ecx, DWORD PTR [rcx+rdx*4]
        movsx   rdx, edi
        mov     DWORD PTR [rsi+rdx*4], ecx
; A[i][n-1-i] = tmp;
        mov     edx, DWORD PTR [rbp-20]    ;A[i][]
        movsx   rcx, edx
        movsx   rdx, eax
        imul    rdx, rcx
        lea     rcx, [0+rdx*4]
        mov     rdx, QWORD PTR [rbp-64]
        lea     rsi, [rcx+rdx]
        mov     edx, DWORD PTR [rbp-52]    ; put n to edx
        sub     edx, 1                     ; n-1
        sub     edx, DWORD PTR [rbp-20]    ; A[i][n-1-i]
        movsx   rdx, edx
        mov     ecx, DWORD PTR [rbp-44]    ; A[i][n-1-i] = tmp
        mov     DWORD PTR [rsi+rdx*4], ecx 
        mov     BYTE PTR [rbp-25], 1       ;   flag = 1
; if true branch end
.L4:
        add     DWORD PTR [rbp-20], 1      ; i++
.L3:
        mov     edx, DWORD PTR [rbp-20]    ; write i to edx
        cmp     edx, DWORD PTR [rbp-24]    ; i<R
        jl      .L5                        ; goto main loop body
; main loop for( int i = 0;i<n-1;i++) ends
        sub     DWORD PTR [rbp-24], 1      ; R--
; while (flag == 1)  loop ends
; while (flag == 1)  loop condition
.L2:
        cmp     BYTE PTR [rbp-25], 0       ; compare flag with 0
        jne     .L6                        ; if flag !=0 ( equivalent to while(1)) jump to label 6 (loop body)
        nop                                ; no operation
        nop                                ; no operation
        mov     rbx, QWORD PTR [rbp-8]
        leave                              ; copy ebp to esp, set value of esp before fuction starts
        ret                                ; return to programme
; the end of function