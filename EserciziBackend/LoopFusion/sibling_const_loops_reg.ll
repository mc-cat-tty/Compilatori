; ModuleID = 'sibling_const_loops.ll'
source_filename = "sibling_const_loops.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @f(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  br label %5

5:                                                ; preds = %17, %4
  %.01 = phi i32 [ 0, %4 ], [ %18, %17 ]
  %6 = icmp slt i32 %.01, 101
  br i1 %6, label %7, label %19

7:                                                ; preds = %5
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds i32, ptr %1, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds i32, ptr %2, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %10, %13
  %15 = sext i32 %.01 to i64
  %16 = getelementptr inbounds i32, ptr %0, i64 %15
  store i32 %14, ptr %16, align 4
  br label %17

17:                                               ; preds = %7
  %18 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !5

19:                                               ; preds = %5
  br label %20

20:                                               ; preds = %32, %19
  %.0 = phi i32 [ 0, %19 ], [ %33, %32 ]
  %21 = icmp slt i32 %.0, 102
  br i1 %21, label %22, label %34

22:                                               ; preds = %20
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds i32, ptr %0, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds i32, ptr %3, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = add nsw i32 %25, %28
  %30 = sext i32 %.0 to i64
  %31 = getelementptr inbounds i32, ptr %3, i64 %30
  store i32 %29, ptr %31, align 4
  br label %32

32:                                               ; preds = %22
  %33 = add nsw i32 %.0, 1
  br label %20, !llvm.loop !7

34:                                               ; preds = %20
  ret void
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
!7 = distinct !{!7, !6}
