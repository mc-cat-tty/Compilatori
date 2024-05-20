; ModuleID = 'licm2_reg.ll'
source_filename = "licm2.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@.str = private unnamed_addr constant [25 x i8] c"%d,%d,%d,%d,%d,%d,%d,%d\0A\00", align 1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @foo(i32 noundef %0, i32 noundef %1) #0 {
  %3 = add nsw i32 %0, 3
  %4 = add nsw i32 %0, 3
  %5 = add nsw i32 %3, 7
  br label %6

6:                                                ; preds = %21, %2
  %.09 = phi i32 [ 0, %2 ], [ %23, %21 ]
  %.07 = phi i32 [ undef, %2 ], [ %11, %21 ]
  %.06 = phi i32 [ 0, %2 ], [ %22, %21 ]
  %.05 = phi i32 [ 0, %2 ], [ %5, %21 ]
  %.02 = phi i32 [ undef, %2 ], [ %.13, %21 ]
  %.01 = phi i32 [ 9, %2 ], [ %.1, %21 ]
  %.0 = phi i32 [ %1, %2 ], [ %7, %21 ]
  %7 = add nsw i32 %.0, 1
  %8 = icmp sgt i32 %7, 1
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  %.09.lcssa = phi i32 [ %.09, %6 ]
  %.07.lcssa = phi i32 [ %.07, %6 ]
  %.06.lcssa = phi i32 [ %.06, %6 ]
  %.05.lcssa = phi i32 [ %.05, %6 ]
  %.02.lcssa = phi i32 [ %.02, %6 ]
  %.01.lcssa = phi i32 [ %.01, %6 ]
  %.lcssa2 = phi i32 [ %7, %6 ]
  %.lcssa = phi i32 [ %3, %6 ]
  br label %24

10:                                               ; preds = %6
  %11 = add nsw i32 %0, 7
  %12 = icmp slt i32 %7, 5
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = add nsw i32 %.01, 2
  br label %21

15:                                               ; preds = %10
  %16 = sub nsw i32 %.01, 1
  %17 = add nsw i32 %0, 4
  %18 = icmp sge i32 %7, 10
  br i1 %18, label %19, label %20

19:                                               ; preds = %15
  %.lcssa15 = phi i32 [ %16, %15 ]
  %.lcssa14 = phi i32 [ %17, %15 ]
  %.lcssa13 = phi i32 [ %11, %15 ]
  %.09.lcssa11 = phi i32 [ %.09, %15 ]
  %.06.lcssa8 = phi i32 [ %.06, %15 ]
  %.05.lcssa6 = phi i32 [ %.05, %15 ]
  %.lcssa3 = phi i32 [ %7, %15 ]
  %.lcssa1 = phi i32 [ %3, %15 ]
  br label %24

20:                                               ; preds = %15
  br label %21

21:                                               ; preds = %20, %13
  %.13 = phi i32 [ %4, %13 ], [ %17, %20 ]
  %.1 = phi i32 [ %14, %13 ], [ %16, %20 ]
  %22 = add nsw i32 %.13, 2
  %23 = add nsw i32 %11, 5
  br label %6

24:                                               ; preds = %19, %9
  %.0912 = phi i32 [ %.09.lcssa, %9 ], [ %.09.lcssa11, %19 ]
  %.069 = phi i32 [ %.06.lcssa, %9 ], [ %.06.lcssa8, %19 ]
  %.057 = phi i32 [ %.05.lcssa, %9 ], [ %.05.lcssa6, %19 ]
  %25 = phi i32 [ %.lcssa2, %9 ], [ %.lcssa3, %19 ]
  %26 = phi i32 [ %.lcssa, %9 ], [ %.lcssa1, %19 ]
  %.18 = phi i32 [ %.07.lcssa, %9 ], [ %.lcssa13, %19 ]
  %.24 = phi i32 [ %.02.lcssa, %9 ], [ %.lcssa14, %19 ]
  %.2 = phi i32 [ %.01.lcssa, %9 ], [ %.lcssa15, %19 ]
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
