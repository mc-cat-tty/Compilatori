; ModuleID = 'LoopWalk/loop.ll'
source_filename = "loop.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@g = global i32 0, align 4

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @g_incr(i32 noundef %0) #0 {
  %2 = load i32, ptr @g, align 4
  %3 = add nsw i32 %2, %0
  store i32 %3, ptr @g, align 4
  %4 = load i32, ptr @g, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @loop(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  br label %4

4:                                                ; preds = %10, %3
  %.0 = phi i32 [ %0, %3 ], [ %11, %10 ]
  %5 = add i32 %2, 1
  %6 = add i32 %5, 1
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  %9 = call i32 @g_incr(i32 noundef %2)
  br label %10

10:                                               ; preds = %8
  %11 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !5

12:                                               ; preds = %4
  %13 = load i32, ptr @g, align 4
  %14 = add nsw i32 0, %13
  ret i32 %14
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"clang version 17.0.6 (https://github.com/llvm/llvm-project/ 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
