; ModuleID = 'loop_reg.ll'
source_filename = "loop.c"
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
  %8 = add nsw i32 %0, 7
  %9 = add nsw i32 %4, 5
  br label %10

10:                                               ; preds = %20, %2
  %.05 = phi i32 [ 0, %2 ], [ %9, %20 ]
  %.04 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %.03 = phi i32 [ 0, %2 ], [ %7, %20 ]
  %.01 = phi i32 [ 9, %2 ], [ %.1, %20 ]
  %.0 = phi i32 [ %1, %2 ], [ %11, %20 ]
  %11 = add nsw i32 %.0, 1
  %12 = icmp slt i32 %11, 5
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = add nsw i32 %.01, 2
  br label %20

15:                                               ; preds = %10
  %16 = sub nsw i32 %.01, 1
  %17 = icmp sge i32 %11, 10
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  %.lcssa4 = phi i32 [ %16, %15 ]
  %.lcssa3 = phi i32 [ %5, %15 ]
  %.05.lcssa = phi i32 [ %.05, %15 ]
  %.04.lcssa = phi i32 [ %.04, %15 ]
  %.03.lcssa = phi i32 [ %.03, %15 ]
  %.lcssa2 = phi i32 [ %11, %15 ]
  %.lcssa1 = phi i32 [ %3, %15 ]
  %.lcssa = phi i32 [ %4, %15 ]
  br label %22

19:                                               ; preds = %15
  br label %20

20:                                               ; preds = %19, %13
  %.02 = phi i32 [ %6, %13 ], [ %5, %19 ]
  %.1 = phi i32 [ %14, %13 ], [ %16, %19 ]
  %21 = add nsw i32 %.02, 2
  br label %10

22:                                               ; preds = %18
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %.lcssa4, i32 noundef %.lcssa3, i32 noundef %.03.lcssa, i32 noundef %.04.lcssa, i32 noundef %.lcssa, i32 noundef %.05.lcssa, i32 noundef %.lcssa1, i32 noundef %.lcssa2)
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
