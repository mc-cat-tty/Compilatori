; ModuleID = 'licm2.ll'
source_filename = "licm2.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@.str = private unnamed_addr constant [25 x i8] c"%d,%d,%d,%d,%d,%d,%d,%d\0A\00", align 1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @foo(i32 noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %20, %2
  %.09 = phi i32 [ 0, %2 ], [ %24, %20 ]
  %.07 = phi i32 [ undef, %2 ], [ %9, %20 ]
  %.06 = phi i32 [ 0, %2 ], [ %22, %20 ]
  %.05 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %.02 = phi i32 [ undef, %2 ], [ %.13, %20 ]
  %.01 = phi i32 [ 9, %2 ], [ %.1, %20 ]
  %.0 = phi i32 [ %1, %2 ], [ %4, %20 ]
  %4 = add nsw i32 %.0, 1
  %5 = add nsw i32 %0, 3
  %6 = icmp sgt i32 %4, 1
  br i1 %6, label %7, label %8

7:                                                ; preds = %3
  br label %25

8:                                                ; preds = %3
  %9 = add nsw i32 %0, 7
  %10 = icmp slt i32 %4, 5
  br i1 %10, label %11, label %14

11:                                               ; preds = %8
  %12 = add nsw i32 %.01, 2
  %13 = add nsw i32 %0, 3
  br label %20

14:                                               ; preds = %8
  %15 = sub nsw i32 %.01, 1
  %16 = add nsw i32 %0, 4
  %17 = icmp sge i32 %4, 10
  br i1 %17, label %18, label %19

18:                                               ; preds = %14
  br label %25

19:                                               ; preds = %14
  br label %20

20:                                               ; preds = %19, %11
  %.13 = phi i32 [ %13, %11 ], [ %16, %19 ]
  %.1 = phi i32 [ %12, %11 ], [ %15, %19 ]
  %21 = add nsw i32 %5, 7
  %22 = add nsw i32 %.13, 2
  %23 = add nsw i32 %0, 7
  %24 = add nsw i32 %9, 5
  br label %3

25:                                               ; preds = %18, %7
  %.18 = phi i32 [ %.07, %7 ], [ %9, %18 ]
  %.24 = phi i32 [ %.02, %7 ], [ %16, %18 ]
  %.2 = phi i32 [ %.01, %7 ], [ %15, %18 ]
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %.2, i32 noundef %.24, i32 noundef %.05, i32 noundef %.06, i32 noundef %.18, i32 noundef %.09, i32 noundef %5, i32 noundef %4)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 {
  call void @foo(i32 noundef 0, i32 noundef 4)
  call void @foo(i32 noundef 0, i32 noundef 12)
  ret i32 0
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"clang version 17.0.6 (https://github.com/llvm/llvm-project/ 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
