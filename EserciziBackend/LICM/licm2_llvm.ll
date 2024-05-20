; ModuleID = 'licm2_reg.ll'
source_filename = "licm2.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@.str = private unnamed_addr constant [25 x i8] c"%d,%d,%d,%d,%d,%d,%d,%d\0A\00", align 1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @foo(i32 noundef %0, i32 noundef %1) #0 {
  %3 = add nsw i32 %0, 3
  %4 = add nsw i32 %0, 7
  %5 = add nsw i32 %0, 4
  %6 = add nsw i32 %0, 3
  %7 = add nsw i32 %3, 7
  %8 = add nsw i32 %4, 5
  br label %9

9:                                                ; preds = %22, %2
  %.09 = phi i32 [ 0, %2 ], [ %8, %22 ]
  %.07 = phi i32 [ undef, %2 ], [ %4, %22 ]
  %.06 = phi i32 [ 0, %2 ], [ %23, %22 ]
  %.05 = phi i32 [ 0, %2 ], [ %7, %22 ]
  %.02 = phi i32 [ undef, %2 ], [ %.13, %22 ]
  %.01 = phi i32 [ 9, %2 ], [ %.1, %22 ]
  %.0 = phi i32 [ %1, %2 ], [ %10, %22 ]
  %10 = add nsw i32 %.0, 1
  %11 = icmp sgt i32 %10, 1
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  %.09.lcssa = phi i32 [ %.09, %9 ]
  %.07.lcssa = phi i32 [ %.07, %9 ]
  %.06.lcssa = phi i32 [ %.06, %9 ]
  %.05.lcssa = phi i32 [ %.05, %9 ]
  %.02.lcssa = phi i32 [ %.02, %9 ]
  %.01.lcssa = phi i32 [ %.01, %9 ]
  %.lcssa2 = phi i32 [ %10, %9 ]
  %.lcssa = phi i32 [ %3, %9 ]
  br label %24

13:                                               ; preds = %9
  %14 = icmp slt i32 %10, 5
  br i1 %14, label %15, label %17

15:                                               ; preds = %13
  %16 = add nsw i32 %.01, 2
  br label %22

17:                                               ; preds = %13
  %18 = sub nsw i32 %.01, 1
  %19 = icmp sge i32 %10, 10
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  %.lcssa15 = phi i32 [ %18, %17 ]
  %.lcssa14 = phi i32 [ %5, %17 ]
  %.lcssa13 = phi i32 [ %4, %17 ]
  %.09.lcssa11 = phi i32 [ %.09, %17 ]
  %.06.lcssa8 = phi i32 [ %.06, %17 ]
  %.05.lcssa6 = phi i32 [ %.05, %17 ]
  %.lcssa3 = phi i32 [ %10, %17 ]
  %.lcssa1 = phi i32 [ %3, %17 ]
  br label %24

21:                                               ; preds = %17
  br label %22

22:                                               ; preds = %21, %15
  %.13 = phi i32 [ %6, %15 ], [ %5, %21 ]
  %.1 = phi i32 [ %16, %15 ], [ %18, %21 ]
  %23 = add nsw i32 %.13, 2
  br label %9

24:                                               ; preds = %20, %12
  %.0912 = phi i32 [ %.09.lcssa, %12 ], [ %.09.lcssa11, %20 ]
  %.069 = phi i32 [ %.06.lcssa, %12 ], [ %.06.lcssa8, %20 ]
  %.057 = phi i32 [ %.05.lcssa, %12 ], [ %.05.lcssa6, %20 ]
  %25 = phi i32 [ %.lcssa2, %12 ], [ %.lcssa3, %20 ]
  %26 = phi i32 [ %.lcssa, %12 ], [ %.lcssa1, %20 ]
  %.18 = phi i32 [ %.07.lcssa, %12 ], [ %.lcssa13, %20 ]
  %.24 = phi i32 [ %.02.lcssa, %12 ], [ %.lcssa14, %20 ]
  %.2 = phi i32 [ %.01.lcssa, %12 ], [ %.lcssa15, %20 ]
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %.2, i32 noundef %.24, i32 noundef %.057, i32 noundef %.069, i32 noundef %.18, i32 noundef %.0912, i32 noundef %26, i32 noundef %25)
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
